package main

import "fmt"

func main()  {
	
	// Create array that will hold excatly 5 int values
	// all will return 0's
	var a [5]int
	fmt.Println("emp: ", a)

	a[4] = 100
	fmt.Println("set:", a)
	fmt.Println("get:", a[4])

	// Returns the length of the array 
	fmt.Println("len:", len(a))
	
	// Declare array in one line
	b := [5]int{1, 2, 3, 4, 5}
	fmt.Println("dcl:", b)

	// 2 dimensional array to build multi-dimensional
	// data structures
	var twoD [2][3]int
	for i := 0; i < 2; i++ {
		for j := 0; j < 2; j++ {
			twoD[i][j] = i + j
		}
	}
	fmt.Println("2d:", twoD)
}