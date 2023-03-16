#!/bin/bash


mkdir hello-pokus
cd hello-pokus/

go mod init pokusio.io/hello-pokus


cat <<EOF > ./hello-pokus.go
package main

import "fmt"

func main() {
    fmt.Println("Hello, Pokus!")
}
EOF

go run .