#!/bin/bash

# -- 
# 
export TMP_GO_INSTALL_HOME=$(mktemp -d -t "golang_install_ops_XXXXXXXX")
export GOLANG_VERSION=${GOLANG_VERSION:-"1.20.2"}
export GOLANG_OS=${GOLANG_OS:-"linux"}
export GOLANG_CPU_ARCH=${GOLANG_CPU_ARCH:-"amd64"}


export GOLANG_DWNLD_LINK="https://go.dev/dl/go${GOLANG_VERSION}.${GOLANG_OS}-${GOLANG_CPU_ARCH}.tar.gz"
export GOLANG_PKG_FILENAME="go${GOLANG_VERSION}.${GOLANG_OS}-${GOLANG_CPU_ARCH}.tar.gz"


cd ${TMP_GO_INSTALL_HOME}
curl -LO "${GOLANG_DWNLD_LINK}"
ls -alh ${GOLANG_PKG_FILENAME}

# --- 

if [ -d /usr/local/golang/${GOLANG_VERSION}/ ]; then
  sudo rm -fr /usr/local/golang/${GOLANG_VERSION}/
fi;

sudo mkdir -p /usr/local/golang/${GOLANG_VERSION}/

if [ -d /usr/local/go ]; then
  sudo rm -rf /usr/local/go
fi;

tar -C /usr/local/golang/${GOLANG_VERSION}/ -xzf ${GOLANG_PKG_FILENAME}

# --- 
sudo ln -s /usr/local/golang/${GOLANG_VERSION}/go /usr/local/go
# --- 

go version