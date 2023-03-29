package pokus_greetings

import (

	"fmt"
	
	"errors"

    "math/rand"

    "time"
    
)

// GetPokusGreetings returns a greeting for the named person.
func GetPokusGreetings(name string)  (string, error) {
    // If no name was given, return an error with a message.
    if name == "" {
        return name, errors.New("An empty name was provided, indeed here is the name parameter value : '" + name + "'")
    }
    // Get a random format
    pokusRandomFormat := getPokusGreetingsFormat()
    // Return a greeting that embeds the name in a message.
    message := fmt.Sprintf(pokusRandomFormat, name)
    // if the provided name is not empty, then we return the message, and 
    return message, nil
}


// GetPokusGreetings returns a greeting for the named person.
func GetPokusGreetingsForThose(names []string)  (map[string]string, error) {

    // --- --- -
    // --- The map to return
    greetingsMessagesMapToReturn := make(map[string]string)

    // --- --- -
    // --- 
    for _, name := range names {
        
        greetingsMessage, error :=  GetPokusGreetings(name)
        if (error != nil) {
            return nil, error
        }
        greetingsMessagesMapToReturn[name] = greetingsMessage
    }
    
    fmt.Println(" - - - ")
    fmt.Println(" - After getting the greetings message for each")
    fmt.Println(" - name, and it into the map to return, here is ")
    fmt.Println(" - the content of the [greetingsMessagesMapToReturn]")
    for k, v := range greetingsMessagesMapToReturn {
        fmt.Println("key is : " + k)
        fmt.Println("value is : " + v)
    }
    
    // if the provided name is not empty, then we return the message, and 
    return greetingsMessagesMapToReturn, nil
}


/**
 * Note that getPokusGreetingsFormat starts with a lowercase 
 * letter, making it accessible only to code in its own package
 * (in other words, it's not exported).
 */
func getPokusGreetingsFormat() (string) {
        // A slice of message formats.
        // When declaring a slice, you omit its size in the brackets: 
        // This tells Go that the size of the array underlying the
        // slice can be dynamically changed.
        formats := []string{
            "Hi, %v. Welcome!",
            "Great to see you, %v!",
            "Hail, %v! Well met!",
        }
    
        // Return a randomly selected message format by specifying
        // a random index for the slice of formats.
        return formats[rand.Intn(len(formats))]

}

// init sets initial values for variables used in the function.

/**
 * Seeds the rand package with the current time.
 * Go executes init functions automatically at program
 * startup, after global variables have been initialized.
 */
func init() {
    fmt.Print("Oh wow!! Ok, if Golang comiler spots a function named 'init' inside a package, it executes that init function automatically at execution startup, after global variables have been initialized.")
    rand.Seed(time.Now().UnixNano())
}