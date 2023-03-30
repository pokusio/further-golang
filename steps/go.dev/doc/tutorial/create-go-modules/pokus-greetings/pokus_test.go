package pokus_greetings

import (
    "testing"
    "regexp"
)

// TestGetPokusGreetings executes a test for GetPokusGreetings in 'pokus.go'
// TestHelloName calls pokus_greetings.GetPokusGreetings with a name, checking
// for a valid return value.
func TestGetPokusGreetings(t *testing.T) {
    // Return a greeting that embeds the name in a message.
	testedName := "De Bois Guilbert"
	want := regexp.MustCompile(`\b`+testedName+`\b`)
	
    // ---  
	// 
	result, potentialError := GetPokusGreetings(testedName)
	
	if (!want.MatchString(result) || potentialError != nil) {
		t.Fatalf(`GetPokusGreetings(testedName) = %q, %v, want match for %#q, nil`, result, potentialError, want)
	} else {
		t.Logf(`GetPokusGreetings(testedName) = %q, %v, want match for %#q, nil`, result, potentialError, want)
	}
	
	
}

func TestGetPokusGreetingsForEmptyName(t *testing.T) {
    // Return a greeting that embeds the name in a message.
	testedName := ""
	want := regexp.MustCompile(`\b`+testedName+`\b`)
	
    // ---  
	// 
	result, potentialError := GetPokusGreetings(testedName)
	
	if (potentialError != nil) {
		t.Fatalf(`GetPokusGreetings(testedName) = %q, %v, is not nil, but was expected to, see %#q, nil`, result, potentialError, want)
	} else {

	}
	
}