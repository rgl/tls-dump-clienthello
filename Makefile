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

# see https://github.com/goreleaser/goreleaser
# renovate: datasource=github-releases depName=goreleaser/goreleaser extractVersion=^v?(?<version>2\..+)
GORELEASER_VERSION := 2.18.2

all: build

$(GORELEASER):
	go install github.com/goreleaser/goreleaser/v2@v$(GORELEASER_VERSION)

$(CYCLONEDXGOMOD):
	go install github.com/CycloneDX/cyclonedx-gomod/cmd/cyclonedx-gomod@v1.12.0

build: $(GORELEASER) $(EXTRA_SOURCE_FILES)
	$(GORELEASER) build --skip=validate --clean

release-snapshot: $(GORELEASER) $(CYCLONEDXGOMOD) $(EXTRA_SOURCE_FILES)
	$(GORELEASER) release --snapshot --skip=publish --clean

release: $(GORELEASER) $(CYCLONEDXGOMOD) $(EXTRA_SOURCE_FILES)
	$(GORELEASER) release --clean

clean:
	rm -rf dist

tls-parameters-%.csv:
	wget -qO $@ https://www.iana.org/assignments/tls-parameters/$@

example.com-crt.pem:
	./create-certificate.sh

.PHONY: all build release-snapshot release clean
