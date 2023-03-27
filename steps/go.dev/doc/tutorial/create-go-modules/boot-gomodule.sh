#!/bin/bash


mkdir pokus-greetings/
cd pokus-greetings/

go mod init pokusio.io/pokus_greetings


cat <<EOF > ./pokus_greetings.go
// the '-' (not '_') character is not allowed in golang modules names.
package pokus_greetings

import "fmt"

// GetPokusGreetings returns a greeting for the named person.
func GetPokusGreetings(name string) string {
    // Return a greeting that embeds the name in a message.
    message := fmt.Sprintf("Hi, %v. Welcome!", name)
    return message
}
EOF

go mod tidy


# --- 
# Now we first completely re-init the
# [pokusio.io/hello_pokus] executable golang app, but
#  WITHOUT the usage of 
# the [pokusio.io/pokus_greetings] golang module
# 
ls -alh ./../../getting-started/hello-pokus/hello-pokus.go
cat <<EOF > ./../../getting-started/hello-pokus/hello-pokus.go
package main

import (

	"fmt"
	
	"rsc.io/quote"
	
	// "pokusio.io/pokus_greetings"
)

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
	
	// Usage of our "pokusio.io/pokus_greetings" Golang Module : 
	// SendPokusGreetings () 
}

func SendPokusGreetings () {
	// Get a greeting message and print it.
	// message := pokus_greetings.GetPokusGreetings("Gabriel")
	// fmt.Println(message)
}



*/

EOF

ls -alh ./../../getting-started/hello-pokus/hello-pokus.go

cd ./../../getting-started/hello-pokus/

rm go.sum
rm go.mod


go mod init pokusio.io/hello_pokus
go mod tidy
go run .






cat <<EOF > ./../../getting-started/hello-pokus/hello-pokus.go
package main

import (
	"fmt"
	
	"rsc.io/quote"
	
	"pokusio.io/pokus_greetings"
)

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
	
	// Usage of our "pokusio.io/pokus_greetings" Golang Module : 
	SendPokusGreetings () 
}

func SendPokusGreetings () {
	// Get a greeting message and print it.
	message := pokus_greetings.GetPokusGreetings("Jeanne")
	fmt.Println(message)
}

EOF

# ---
# go mod edit will edit 
go mod edit -replace pokusio.io/pokus_greetings=./../../create-go-modules/pokus-greetings

go mod tidy
# $ go run .
# hello-pokus.go:8:5: module pokusio.io/pokus_greetings provides package pokusio.io/pokus_greetings and is replaced but not required; to add it:
#         go get pokusio.io/pokus_greetings



# $ go mod tidy
# go: found pokusio.io/pokus_greetings in pokusio.io/pokus_greetings v0.0.0-00010101000000-000000000000


# ---
#
# go back to where we were
# 
cd ./../../create-go-modules/pokus-greetings/