package main

import (
  "fmt"
  "math/rand"
  "time"
)

func main() {
  c := make(chan int)

  for i := 0; i < 10; i++ {
    go func(i int) {
      sleep := time.Duration(rand.Intn(1000))
      time.Sleep(sleep * time.Millisecond)
      c <- i
    }(i)
  }

  for i := 0; i < 10; i++ {
    fmt.Println(<-c)
  }
}
