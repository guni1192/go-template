GOOS=$(shell go env GOOS)
GOARCH=$(shell go env GOARCH)
GO_LDFLAGS=-ldflags="-s -w"

TARGET=hello

.PHONY: build test clean

build:
	mkdir -p bin
	GOOS=$(GOOS) GO_ARCH=$(GOARCH) go build $(GO_LDFLAGS) -o bin/$(TARGET) ./...

test:
	go test -v ./...

clean:
	rm -r bin
