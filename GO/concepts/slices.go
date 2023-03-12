package main

import "fmt"

func main(){

	s := make([]string, 3)
	fmt.Println("emp:", s)

	s[0] = "a"
	s[1] = "b"
	s[2] = "c"
	fmt.Println("set:", s)
	fmt.Println("get:", s[2])

	// returns the length of slice as expected
	fmt.Println("len:", len(s))

	// builtin append
	s = append(s, "d")
	s = append(s, "e", "f")
	fmt.Println("apd:", s)

	// duplicate a slice 
	c := make([]string, len(s))
	copy(c, s)
	fmt.Println("cpy:", c)

	//  returns a set of values from 2 to 5
	l := s[2:5]
	fmt.Println("sl1:", l)

	// excludes s5
	l = s[:5]
	fmt.Println("sl2:", l)
	
	// includes s2
	l = s[2:]
	fmt.Println("sl3:", l)

	// initialise a slice in a single line
	t := []string{"g", "h", "i"}
	fmt.Println("dcl:", t)

	// creating a 2D slice
	twoD := make([][]int, 3)
	for i := 0; i < count; i++ {
		innerLen := i + 1
		twoD[i] = make([]int, innerLen)
		for j := 0; j < innerLen; j++ {
			twoD[i][j] = i + j
		}
	}
	fmt.Println("2d:", twoD)
}