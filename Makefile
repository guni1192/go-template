GO=go
GOOS=$(shell go env GOOS)
GOARCH=$(shell go env GOARCH)
GO_LDFLAGS=-ldflags="-s -w"
TARGET_DIR=bin/

.PHONY: build test clean

fmt:
	goimports -w cmd/*.go pkg/*/*.go
	gofmt -l -w .

build:
	mkdir -p bin
	fmt
	GOOS=$(GOOS) GO_ARCH=$(GOARCH) $(GO) build $(GO_LDFLAGS) -o $(TARGET_DIR) ./...

test:
	$(GO) test -v ./...

clean:
	rm -rf bin
