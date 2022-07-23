SHELL = /bin/bash
GOPATH := $(shell go env GOPATH | tr '\\' '/')
GOEXE := $(shell go env GOEXE)
GORELEASER := $(GOPATH)/bin/goreleaser$(GOEXE)
CYCLONEDXGOMOD := $(GOPATH)/bin/cyclonedx-gomod$(GOEXE)
EXTRA_SOURCE_FILES := \
	tls-parameters-4.csv \
	tls-parameters-8.csv \
	tls-parameters-9.csv \
	example.com-crt.pem

all: build

$(GORELEASER):
	go install github.com/goreleaser/goreleaser@v1.9.2

$(CYCLONEDXGOMOD):
	go install github.com/CycloneDX/cyclonedx-gomod/cmd/cyclonedx-gomod@v1.2.0

build: $(GORELEASER) $(EXTRA_SOURCE_FILES)
	$(GORELEASER) build --skip-validate --rm-dist

release-snapshot: $(GORELEASER) $(CYCLONEDXGOMOD) $(EXTRA_SOURCE_FILES)
	$(GORELEASER) release --snapshot --skip-publish --rm-dist

release: $(GORELEASER) $(CYCLONEDXGOMOD) $(EXTRA_SOURCE_FILES)
	$(GORELEASER) release --rm-dist

clean:
	rm -rf dist

tls-parameters-%.csv:
	wget -qO $@ https://www.iana.org/assignments/tls-parameters/$@

example.com-crt.pem:
	./create-certificate.sh

.PHONY: all build release-snapshot release clean
