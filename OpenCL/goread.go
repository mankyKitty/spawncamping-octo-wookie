package main

import (
	"os"
	"fmt"
	"log"
	"image"
	"image/color"

	_ "image/jpeg"
)

func main() {
	link,_ := os.Open("octo-link.jpeg")
	shield,_ := os.Open("shield1.jpg")
	
	// Decode the image
	dlink, _, err := image.Decode(link)
	if err != nil {
		log.Fatal(err)
	}
	 dshield, _, err := image.Decode(shield)
	if err != nil {
	 	log.Fatal(err)
	}

	lBounds := dlink.Bounds()

	res := make([][]int, lBounds.Max.Y)

	for i := lBounds.Min.Y; i < lBounds.Max.Y; i++ {
		res[i] = make([]int, lBounds.Max.X)
	}

	count := imageMap(lBounds, dlink, dshield, 0)
	
	fmt.Println("The count is :", count)
	fmt.Println("Colour is :", color.White)
	
	link.Close()
	shield.Close()
}

func imageMap(bnds image.Rectangle, xDecoded image.Image, yDecoded image.Image, count int) int {
	for y := bnds.Min.Y; y < bnds.Max.Y; y++ {
		for x := bnds.Min.X; x < bnds.Max.X; x++ {
			if yDecoded.At(x, y) != color.White && xDecoded.At(x, y) == yDecoded.At(x, y) {
				count++
			}
		}
	}
	return count
}
