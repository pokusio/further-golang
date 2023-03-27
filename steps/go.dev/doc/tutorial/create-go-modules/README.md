## Create a `Go` module

In this tutorial we will create two modules :
* The first is a library which is intended to be imported by other libraries or applications. 
* The second is a caller application which will use the first : i will there re-use the hello-pokus application implemented in the previous step, see `./steps/go.dev/doc/tutorial/getting-started`




### Let's do it 

* Create a module which will be a small module with functions we can call from another module : 

```bash

go mod init pokusio.io/pokus_greetings

# ---
# $ go mod init pokusio.io/pokus_greetings
# go: creating new go.mod: module pokusio.io/pokus_greetings

cat <<EOF > ./pokus.go
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
# there is no checksums generated in the go.mod file, becasue there 
# are no external dependencies used in the source code
```

### Call your code from another module -- Import and use your new module

#### Local Modules resolution

For production use, we would publish the `pokusio.io/pokus_greetings` module from its repository (with a module path that reflected its published location), where Go tools could find it to download it. 


For now, because we haven't published the module yet, we need to adapt the `pokusio.io/hello_pokus` module so it can find the `pokusio.io/pokus_greetings` code on our local file system.

To do that, use the `go mod edit` command to edit the `pokusio.io/hello_pokus` module to redirect Go tools from its module path (where the module isn't) to the local directory (where it is).

This is how we do that : 

* First, our `pokusio.io/hello_pokus` executable golang app is located in the `./steps/go.dev/doc/tutorial/getting-started/hello-pokus` Folder of this git repository
* Second, our `pokusio.io/pokus_greetings` Golang module is located in the `./steps/go.dev/doc/tutorial/getting-started/hello-pokus` Folder of this git repository.
* So, in the `./steps/go.dev/doc/tutorial/getting-started/hello-pokus` Folder of this git repository, we'll execute : 

```bash
go mod edit -replace pokusio.io/pokus_greetings=./../../create-go-modules/pokus-greetings

go mod tidy
```

* And then we can use our `pokusio.io/pokus_greetings` Golang module, inside our `pokusio.io/hello_pokus`


### Return and handle an error -- Add simple error handling.

### Return a random greeting -- Handle data in slices (Go's dynamically-sized arrays).

### Return greetings for multiple people -- Store key/value pairs in a map.

### Add a test -- Use Go's built-in unit testing features to test your code.

### Compile and install the application -- Compile and install your code locally.










## Points in docs

* https://go.dev/doc/tutorial/create-module
* and https://go.dev/doc/tutorial/call-module-code

