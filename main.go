// this dumps the TLS ClientHello message to stdout. which might be useful when
// testing your TLS client settings.

package main

import (
	"bytes"
	"context"
	"crypto/tls"
	"encoding/csv"
	"errors"
	"flag"
	"fmt"
	"io"
	"log"
	"net"
	"net/http"
	"os"
	"regexp"
	"runtime"
	"sort"
	"strconv"
	"strings"
	"time"
)

var (
	version = "unknown"
	commit  = "unknown"
	date    = "unknown"
)

var protocolVersions = map[uint16]string{
	tls.VersionSSL30: "SSLv3.0",
	tls.VersionTLS10: "TLSv1.0",
	tls.VersionTLS11: "TLSv1.1",
	tls.VersionTLS12: "TLSv1.2",
	tls.VersionTLS13: "TLSv1.3",
}

// http://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-4
func loadCipherSuites(fileName string) (map[uint16]string, error) {
	f, err := os.Open(fileName)

	if err != nil {
		return nil, err
	}

	defer f.Close()

	r := csv.NewReader(f)
	r.FieldsPerRecord = 5

	header, err := r.Read()

	if err != nil {
		return nil, err
	}

	if strings.Join(header, ",") != "Value,Description,DTLS-OK,Recommended,Reference" {
		return nil, errors.New("invalid header")
	}

	suiteRegexp := regexp.MustCompile(`^0x([0-9a-fA-F]{2}),0x([0-9a-fA-F]{2})$`)

	suites := map[uint16]string{}

	for {
		record, err := r.Read()

		if err == io.EOF {
			return suites, nil
		}

		if err != nil {
			return nil, err
		}

		value := record[0]

		matches := suiteRegexp.FindStringSubmatch(value)

		if matches == nil {
			continue
		}

		description := record[1]

		id, err := strconv.ParseUint(matches[1]+matches[2], 16, 16)

		if err != nil {
			return nil, errors.New("invalid data")
		}

		suites[uint16(id)] = description

		//log.Printf("suite 0x%s%s %x %s", matches[1], matches[2], id, description)
	}
}

// http://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-8
// http://tools.ietf.org/html/rfc4492#section-5.1.1
func loadCurves(fileName string) (map[tls.CurveID]string, error) {
	f, err := os.Open(fileName)

	if err != nil {
		return nil, err
	}

	defer f.Close()

	r := csv.NewReader(f)
	r.FieldsPerRecord = 6

	header, err := r.Read()

	if err != nil {
		return nil, err
	}

	if strings.Join(header, ",") != "Value,Description,DTLS-OK,Recommended,Reference,Comment" {
		return nil, errors.New("invalid header")
	}

	curveRegexp := regexp.MustCompile(`^([0-9]+)$`)

	curves := map[tls.CurveID]string{}

	for {
		record, err := r.Read()

		if err == io.EOF {
			return curves, nil
		}

		if err != nil {
			return nil, err
		}

		value := record[0]

		matches := curveRegexp.FindStringSubmatch(value)

		if matches == nil {
			continue
		}

		description := record[1]

		id, err := strconv.ParseUint(matches[1], 10, 16)

		if err != nil {
			return nil, errors.New("invalid data")
		}

		curves[tls.CurveID(id)] = description

		//log.Printf("curve %v %v", id, description)
	}
}

// http://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-9
// http://tools.ietf.org/html/rfc4492#section-5.1.2
func loadPoints(fileName string) (map[uint8]string, error) {
	f, err := os.Open(fileName)

	if err != nil {
		return nil, err
	}

	defer f.Close()

	r := csv.NewReader(f)
	r.FieldsPerRecord = 4

	header, err := r.Read()

	if err != nil {
		return nil, err
	}

	if strings.Join(header, ",") != "Value,Description,DTLS-OK,Reference" {
		return nil, errors.New("invalid header")
	}

	pointRegexp := regexp.MustCompile(`^([0-9]+)$`)

	points := map[uint8]string{}

	for {
		record, err := r.Read()

		if err == io.EOF {
			return points, nil
		}

		if err != nil {
			return nil, err
		}

		value := record[0]

		matches := pointRegexp.FindStringSubmatch(value)

		if matches == nil {
			continue
		}

		description := record[1]

		id, err := strconv.ParseUint(matches[1], 10, 8)

		if err != nil {
			return nil, errors.New("invalid data")
		}

		points[uint8(id)] = description

		//log.Printf("point %v %v", id, description)
	}
}

type contextKey struct {
	name string
}

func (k *contextKey) String() string { return k.name + " context value" }

var handshakeInfoContextKey = &contextKey{"handshake"}

// test with:
//
//	(printf 'GET / HTTP/1.0\n\n'; sleep .1) | openssl s_client -connect localhost:8888 -servername example.com
func main() {
	log.SetFlags(0)

	log.Printf("Starting tls-dump-clienthello (version %s; commit %s; date %s)", version, commit, date)

	var listenAddress = flag.String("listen", ":8888", "Listen address.")
	var defaultServerName = flag.String("default-server-name", "example.com", "Default server name to use when the cilent does not send the SNI extension.")
	var logClientHelloSupportedCrypto = flag.Bool("log-client-hello-supported-crypto", true, "whether to log the client supported crypto parameters.")
	var keyLogFilename = flag.String("key-log", "", "Write the TLS session keys into this file (e.g. key-log.txt). You can also set the SSLKEYLOGFILE environment variable. See https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Key_Log_Format.")

	flag.Parse()

	if flag.NArg() != 0 {
		flag.Usage()
		log.Fatalf("\nERROR You MUST NOT pass any positional arguments")
	}

	knownCipherSuites, err := loadCipherSuites("tls-parameters-4.csv")

	if err != nil {
		log.Fatalf("ERROR failed to load cipher suites from tls-parameters-4.csv: %v", err)
	}

	knownCurves, err := loadCurves("tls-parameters-8.csv")

	if err != nil {
		log.Fatalf("ERROR failed to load curves from tls-parameters-8.csv: %v", err)
	}

	knownPoints, err := loadPoints("tls-parameters-9.csv")

	if err != nil {
		log.Fatalf("ERROR failed to load points from tls-parameters-9.csv: %v", err)
	}

	tlsConfig := &tls.Config{
		GetConfigForClient: func(clientHello *tls.ClientHelloInfo) (*tls.Config, error) {
			handshakeInfoBuffer := clientHello.Context().Value(handshakeInfoContextKey).(*bytes.Buffer)

			fmt.Fprintf(handshakeInfoBuffer, "----\n")
			fmt.Fprintf(handshakeInfoBuffer, "client address: %s\n", clientHello.Conn.RemoteAddr())
			fmt.Fprintf(handshakeInfoBuffer, "client SNI: %s\n", clientHello.ServerName)

			if *logClientHelloSupportedCrypto {
				for _, versionId := range clientHello.SupportedVersions {
					protocolVersion := protocolVersions[versionId]
					if protocolVersion == "" {
						protocolVersion = fmt.Sprintf("0x%04x", versionId)
					}
					fmt.Fprintf(handshakeInfoBuffer, "client version: %s\n", protocolVersion)
				}
				for _, cipherSuiteId := range clientHello.CipherSuites {
					fmt.Fprintf(handshakeInfoBuffer, "client cipher suite: %s (0x%04x)\n", knownCipherSuites[cipherSuiteId], cipherSuiteId)
				}

				for _, curveId := range clientHello.SupportedCurves {
					fmt.Fprintf(handshakeInfoBuffer, "client curve: %s (%d)\n", knownCurves[curveId], curveId)
				}

				for _, pointId := range clientHello.SupportedPoints {
					fmt.Fprintf(handshakeInfoBuffer, "client point: %s (%d)\n", knownPoints[pointId], pointId)
				}
			}

			log.Print(handshakeInfoBuffer.String())

			return nil, nil
		},
		GetCertificate: func(clientHello *tls.ClientHelloInfo) (*tls.Certificate, error) {
			serverName := clientHello.ServerName
			if serverName == "" {
				serverName = *defaultServerName
			}
			// TODO cache these certificates.
			kp, err := tls.LoadX509KeyPair(
				fmt.Sprintf("%s-crt.pem", serverName),
				fmt.Sprintf("%s-key.pem", serverName))
			return &kp, err
		},
	}

	if *keyLogFilename == "" {
		*keyLogFilename = os.Getenv("SSLKEYLOGFILE")
	}

	if *keyLogFilename != "" {
		keyLog, err := os.OpenFile(*keyLogFilename, os.O_WRONLY|os.O_CREATE|os.O_APPEND, 0600)
		if err != nil {
			log.Fatal(err)
		}
		tlsConfig.KeyLogWriter = keyLog
	}

	server := &http.Server{
		Addr:      *listenAddress,
		TLSConfig: tlsConfig,
		ConnContext: func(ctx context.Context, c net.Conn) context.Context {
			return context.WithValue(ctx, handshakeInfoContextKey, &bytes.Buffer{})
		},
		Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			handshakeInfoBuffer := r.Context().Value(handshakeInfoContextKey).(*bytes.Buffer)

			state := r.TLS

			protocolVersion := protocolVersions[state.Version]
			if protocolVersion == "" {
				protocolVersion = fmt.Sprintf("%x", state.Version)
			}

			cipherSuite := knownCipherSuites[state.CipherSuite]
			if cipherSuite == "" {
				cipherSuite = fmt.Sprintf("%x", state.CipherSuite)
			}

			buffer := bytes.Buffer{}
			fmt.Fprint(&buffer, handshakeInfoBuffer.String())
			fmt.Fprintf(&buffer, "handshake version: %v\n", protocolVersion)
			fmt.Fprintf(&buffer, "handshake cipher suite: %v\n", cipherSuite)
			fmt.Fprintf(&buffer, "handshake protocol: %v\n", state.NegotiatedProtocol)
			fmt.Fprintf(&buffer, "http: %s %s %s\n", r.Method, r.URL.RequestURI(), r.Proto)
			if r.Host != "" {
				fmt.Fprintf(&buffer, "http header: Host: %s\n", r.Host)
			}
			keys := make([]string, 0, len(r.Header))
			for k := range r.Header {
				keys = append(keys, k)
			}
			sort.Strings(keys)
			for _, name := range keys {
				headers := r.Header[name]
				for _, value := range headers {
					fmt.Fprintf(&buffer, "http header: %s: %s\n", name, value)
				}
			}
			for name, values := range r.URL.Query() {
				for _, value := range values {
					fmt.Fprintf(&buffer, "http query: %s=%s\n", name, value)
				}
			}
			log.Print(buffer.String())

			w.WriteHeader(http.StatusOK)
			w.Write([]byte(time.Now().Format("2006-01-02T15:04:05-0700")))
		}),
	}

	log.Printf("Binary built with runtime %s", runtime.Version())
	log.Printf("Listening at %s", *listenAddress)
	log.Println("Press Ctrl+C to quit")

	err = server.ListenAndServeTLS("", "")
	if err != nil {
		log.Fatal(err)
	}
}
