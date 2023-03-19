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
