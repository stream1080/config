SHELL = /bin/bash

TOP := ./project
# $(shell pwd)/project root

all: build

build:
	cd ${TOP}; go build -v

rebuild: clean
	make build

clean:
	rm ${TOP}/sofa

install:
	GODEBUG=netdns=go go install ./...

install_golangci_lint:
	# binary will be ${GOPATH}/bin/golangci-lint
	@type ${GOPATH}/bin/golangci-lint || curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b ${GOPATH}/bin v1.23.8

.PHONY: lint
lint: install_golangci_lint
	cd ${TOP}; pwd; ${GOPATH}/bin/golangci-lint run -v ./...

format:
	cd ${TOP}; gofmt -s -w .

test:
	cd ${TOP}; go test -v -race ./...

use_git:
	git config --global url."git@github.com:".insteadOf "https://github.com/"

linux: GOOS=linux
linux: linux-install
linux-install:
	cd ${TOP} && GOOS=${GOOS} GOBIN='' go build -v