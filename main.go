// this dumps the TLS ClientHello message to stdout. which might be useful when
// testing your TLS client settings.

package main

import (
	"encoding/csv"
	"errors"
	"flag"
	"fmt"
	"github.com/rgl/tls-dump-clienthello/tls"
	"io"
	"log"
	"os"
	"regexp"
	"strconv"
	"strings"
)

var protocolVersions = map[uint16]string{
	tls.VersionSSL30: "SSLv3.0",
	tls.VersionTLS10: "TLSv1.0",
	tls.VersionTLS11: "TLSv1.1",
	tls.VersionTLS12: "TLSv1.2",
}

// http://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-4
func loadCipherSuites(fileName string) (map[uint16]string, error) {
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
		return nil, errors.New("Invalid header")
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
			return nil, errors.New("Invalid data")
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
	r.FieldsPerRecord = 4

	header, err := r.Read()

	if err != nil {
		return nil, err
	}

	if strings.Join(header, ",") != "Value,Description,DTLS-OK,Reference" {
		return nil, errors.New("Invalid header")
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
			return nil, errors.New("Invalid data")
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
		return nil, errors.New("Invalid header")
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
			return nil, errors.New("Invalid data")
		}

		points[uint8(id)] = description

		//log.Printf("point %v %v", id, description)
	}
}

// test with:
//
//	openssl s_client -connect localhost:8888 -servername example.com
func main() {
	log.SetFlags(0)

	var listenAddress = flag.String("listen", ":8888", "Listen address.")

	flag.Parse()

	if flag.NArg() != 0 {
		flag.Usage()
		log.Fatalf("\nERROR You MUST NOT pass any positional arguments")
	}

	knownCipherSuites, err := loadCipherSuites("tls-parameters-4.csv")

	if err != nil {
		log.Fatalf("ERROR failed to load cipher suites from tls-parameters-4.csv: %v", err)
	}

	// add missing cipher suites. these are the prefered suites of chrome 44.
	// See http://tools.ietf.org/html/draft-agl-tls-chacha20poly1305-04
	knownCipherSuites[0xcc13] = "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256"
	knownCipherSuites[0xcc14] = "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256"
	knownCipherSuites[0xcc15] = "TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256"

	knownCurves, err := loadCurves("tls-parameters-8.csv")

	if err != nil {
		log.Fatalf("ERROR failed to load curves from tls-parameters-8.csv: %v", err)
	}

	knownPoints, err := loadPoints("tls-parameters-9.csv")

	if err != nil {
		log.Fatalf("ERROR failed to load points from tls-parameters-9.csv: %v", err)
	}

	certificate, err := tls.LoadX509KeyPair("example.com-crt.pem", "example.com-keypair.pem")

	if err != nil {
		log.Fatalf("ERROR failed to load keypair: %v", err)
	}

	tlsConfig := &tls.Config{
		Certificates: []tls.Certificate{certificate},
		OnClientHello: func(clientHello *tls.ClientHello) {
			protocolVersion := protocolVersions[clientHello.Vers]
			if protocolVersion == "" {
				protocolVersion = fmt.Sprintf("0x%04x", clientHello.Vers)
			}

			log.Printf("client version: %s", protocolVersion)
			log.Printf("client SNI: %s", clientHello.ServerName)

			for _, cipherSuiteId := range clientHello.CipherSuites {
				log.Printf("client cipher suite: %s (0x%04x)", knownCipherSuites[cipherSuiteId], cipherSuiteId)
			}

			for _, curveId := range clientHello.SupportedCurves {
				log.Printf("client curve: %s (%d)", knownCurves[curveId], curveId)
			}

			for _, pointId := range clientHello.SupportedPoints {
				log.Printf("client point: %s (%d)", knownPoints[pointId], pointId)
			}
		},
	}

	l, err := tls.Listen("tcp", *listenAddress, tlsConfig)

	if err != nil {
		log.Fatalf("ERROR failed to listen: %v", err)
	}

	defer l.Close()

	log.Printf("server address: %v", l.Addr())

	for {
		c, err := l.Accept()

		if err != nil {
			log.Printf("WARN failed to accept: %v", err)
			continue
		}

		log.Printf("client address: %v", c.RemoteAddr())

		go func(c *tls.Conn) {
			defer c.Close()

			err := c.Handshake()

			if err != nil {
				log.Printf("ERROR failed to TLS Handshake: %v", err)
				return
			}

			state := c.ConnectionState()

			protocolVersion := protocolVersions[state.Version]
			if protocolVersion == "" {
				protocolVersion = fmt.Sprintf("%x", state.Version)
			}

			cipherSuite := knownCipherSuites[state.CipherSuite]
			if cipherSuite == "" {
				cipherSuite = fmt.Sprintf("%x", state.CipherSuite)
			}

			log.Printf("handshake version: %v", protocolVersion)
			log.Printf("handshake cipher suite: %v", cipherSuite)
			log.Printf("handshake protocol: %v", state.NegotiatedProtocol)
		}(c.(*tls.Conn))
	}
}
