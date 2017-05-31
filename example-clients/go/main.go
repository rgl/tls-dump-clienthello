package main

import (
	"crypto/tls"
	"crypto/x509"
	"io/ioutil"
	"log"
	"net/http"
)

func main() {
	const exampleCAPath = "../../example.com-crt.pem"

	exampleCA, err := ioutil.ReadFile(exampleCAPath)
	if err != nil {
		log.Fatalf("failed to read the example.com certificate from %s: %v", exampleCAPath, err)
	}

	rootCAs := x509.NewCertPool()
	if !rootCAs.AppendCertsFromPEM(exampleCA) {
		log.Fatalf("failed to load the example.com certificate from %s", exampleCAPath)
	}

	http.DefaultTransport.(*http.Transport).TLSClientConfig = &tls.Config{
		RootCAs: rootCAs,
	}

	_, err = http.Get("https://example.com:8888")
	if err != nil {
		log.Fatalf("failed to get https://example.com:8888: %v", err)
	}
}
