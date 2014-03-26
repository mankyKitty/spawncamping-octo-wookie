module main where

fizzBuzz n = map isBuzz [1..n]

main =
  nums <- fizzBuzz 25