#!/bin/bash

go env GOROOT
go env GOPATH


# go install golang.org/dl/go1.10.7@latest
# go1.10.7 download

export ANOTHER_GO_VERSION="1.10.7"
go install golang.org/dl/go${ANOTHER_GO_VERSION}@latest
# go${ANOTHER_GO_VERSION} download
ls -alh $(go env GOPATH)/bin/go${ANOTHER_GO_VERSION}
$(go env GOPATH)/bin/go${ANOTHER_GO_VERSION} download

$(go env GOPATH)/bin/go${ANOTHER_GO_VERSION} version



export ANOTHER_GO_VERSION="1.18.3"
go install golang.org/dl/go${ANOTHER_GO_VERSION}@latest
# go${ANOTHER_GO_VERSION} download
ls -alh $(go env GOPATH)/bin/go${ANOTHER_GO_VERSION}
$(go env GOPATH)/bin/go${ANOTHER_GO_VERSION} download

$(go env GOPATH)/bin/go${ANOTHER_GO_VERSION} version

export PATH="$PATH:$(go env GOPATH)/bin"


go1.10.7 version
go1.18.3 version
go version




go env GOPATH
go env GOROOT




go1.10.7 env GOROOT
go1.10.7 env GOPATH


go1.18.3 env GOROOT
go1.18.3 env GOPATH


echo "# Golang version $(go version)" | tee -a ${HOME}/.profile
echo 'export PATH="$PATH:$(go env GOPATH)/bin"' | tee -a ${HOME}/.profile
echo "# Golang version $(go1.10.7 version)" | tee -a ${HOME}/.profile
echo 'export PATH="$PATH:$(go1.10.7 env GOPATH)/bin"' | tee -a ${HOME}/.profile
echo "# Golang version $(go1.18.3 version)" | tee -a ${HOME}/.profile
echo 'export PATH="$PATH:$(go1.18.3 env GOPATH)/bin"' | tee -a ${HOME}/.profile
