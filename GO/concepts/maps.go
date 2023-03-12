package main

import (
	"fmt"
)

func main(){

	m := make(map[string]int)

	// Set key/value pairs using typical name[key] = val syntax.
	m["k1"] = 7
	m["k2"] = 13

	// Printing all key value pairs
	fmt.Println("map:", m)

	v1 := m["k1"]
	fmt.Println("v1: ", v1)

	// returns no. of key value pairs of the map 
	fmt.Println("len:", len(m))

	// delete value of k2 from map 
	delete(m, "k2")
	fmt.Println("map:", m)

	// The optional second return value when getting a value from a map indicates if the key was present in the map. This can be used to disambiguate between missing keys and keys with zero values like 0 or "". Here we didn’t need the value itself, so we ignored it with the blank identifier _.
	_, prs := m["k2"]
	fmt.Println("prs:", prs)

	// Declare and initialise a new map in the same line
	n := map[string]int{"foo": 1, "bar": 2}
	fmt.Println("map:", n)
}