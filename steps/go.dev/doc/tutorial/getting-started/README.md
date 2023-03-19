## 

* create a minimal go module project : 

```bash

mkdir hello-pokus
cd hello-pokus/

go mod init pokusio.io/hello-pokus

cat <<EOF > ./README.md
# Hello Pokus !

The best golang module on Github, because it's french-made!
EOF

cat <<EOF > ./hello-pokus.go
package main

import "fmt"

func main() {
    fmt.Println("Hello, Pokus!")
}
EOF


```

* And now run your first go module : 

```bash
cd hello-pokus/
go run .
```


* Oh and now look at this (the go help is awesome) :

``` 
$ go help module-auth
When the go command downloads a module zip file or go.mod file into the
module cache, it computes a cryptographic hash and compares it with a known
value to verify the file hasn't changed since it was first downloaded. Known
hashes are stored in a file in the module root directory named go.sum. Hashes
may also be downloaded from the checksum database depending on the values of
GOSUMDB, GOPRIVATE, and GONOSUMDB.

```


## Call code in an external package

See https://pkg.go.dev/rsc.io/quote ?

Alright, now, we are going to use a new golang dependency in our code. As example, We will use a new golang package in our golang source code, this one : https://pkg.go.dev/rsc.io/quote

To do that, three steps : 
* update source code : 
  * Add an import command in your source code : `import "rsc.io/quote"`
  * make use of a first Golang Function of the `rsc.io/quote` project, the `Go()` Function, which displays a Go proverb
* Run the `go mod tidy` command : this will download and install that dependency in the golang project.
* Run the `go run .` command to run the golang `hello-pokus` application.

After that, I did the same thing, adding usage for all Functions of the `rsc.io/quote` Golang package : 

```Golang
package main

import "fmt"

import "rsc.io/quote"

func main() {
	fmt.Println("Hello, Pokus!")
	fmt.Println("Here is the quote of the day (Go returns a Go proverb.) : ")
	fmt.Println(quote.Go())
	
	fmt.Println("Here is an example usage of another 'rsc.io/quote' package function (Glass returns a useful phrase for world travelers.) : ")
	fmt.Println(quote.Glass())
	
	fmt.Println("Here is an example usage of another 'rsc.io/quote' package function (Hello returns a greeting.) : ")
	fmt.Println(quote.Hello())
	
	fmt.Println("Here is an example usage of another 'rsc.io/quote' package function (Opt returns an optimization truth.) : ")
	fmt.Println(quote.Opt())
}
```

## Point in docs

https://go.dev/doc/tutorial/getting-started