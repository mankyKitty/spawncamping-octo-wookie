package main

import (
  "fmt"
  "github.com/barnex/cuda5/safe"
  "github.com/barnex/cuda5/cuda"
)

func main() {
  safe.InitCuda()
  fmt.Println(cuda.ApiVersion())
}
