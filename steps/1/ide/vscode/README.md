## Golang IDE Tooling


### VS Code

We will here install the most used golang tools for VS Code.

* First Update your VS Code, to make sure your VS Code is up to date
* First we will install the most used Golang VS Code Extension : 
  * https://github.com/golang/vscode-go
  * https://marketplace.visualstudio.com/items?itemName=golang.go
* Second, press `Ctrl + Shift + P` Key combination, and fill in the text field with `Go: Install/Update Tools` : 
  * This will give a list of classical golang development tools, for `gotests` (can generate unit tests), `staticcheck` linter, debugger (`dlv`/`dlv-dap` the delve golang debugger) etc... 
  * They will all be installed in the `$GOPATH/bin` folder (you can check the value of your Golang installation by running `go env GOPATH`)
  * You have to learn how to use a Golang Debugger, here in the tools we have installed the delve Golang Debugger, and you can learn about this one here, for example : https://github.com/golang/vscode-go/wiki/debugging
  * you can find out more about those tools at https://github.com/golang/vscode-go/wiki/tools




## References


* https://github.com/golang/vscode-go
* https://marketplace.visualstudio.com/items?itemName=golang.go
