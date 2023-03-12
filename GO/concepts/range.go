// range iterates over elements in a variety of data structures. 

package main

import "fmt"

func main(){

	nums := []int{2, 3, 4}
	sum := 0
	// Summing the numbers in the slice
	for _, num := range nums{
		sum += num
	}
}