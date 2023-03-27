package main

import (

	"fmt"
	
	"rsc.io/quote"
	
	"log"

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
    // Set properties of the predefined Logger, including
    // the log entry prefix and a flag to disable printing
    // the time, source file, and line number.
    log.SetPrefix("[pokus] - : ")
    // log.SetFlags(0)
	log.SetFlags(log.Ltime)
	log.SetFlags(log.LstdFlags)
	
	// Get a greeting message and print it.
	message, perhapsError := pokus_greetings.GetPokusGreetings("Gabriel")

	if perhapsError != nil { // https://go.dev/doc/tutorial/handle-errors
		// log.Output(1,"There has been an error using [pokus_greetings]")
		log.Fatal(perhapsError)
	}
	fmt.Println(message) // if perhapsError is nil , then we print the message

	message2, perhapsError2 := pokus_greetings.GetPokusGreetings("Jeanne")
	if perhapsError2 != nil {
		// log.Output(1,"There has been an error using [pokus_greetings]")
		log.Fatal(perhapsError2)
	}
	fmt.Println(message2)
	message3, perhapsError3 := pokus_greetings.GetPokusGreetings("")
	if perhapsError3 != nil {
		// log.Output(1,"There has been an error using [pokus_greetings]")
		log.Fatal(perhapsError3)
	}
	fmt.Println(message3)
	
}

