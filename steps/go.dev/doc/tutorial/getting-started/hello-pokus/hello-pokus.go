package main

import "fmt"

import "rsc.io/quote"

func main() {
	fmt.Println("Hello, Pokus!")
	fmt.Println("Here is the quote of the day : ")
	fmt.Println(quote.Go())
}
