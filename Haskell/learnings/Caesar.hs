module Main where

import Data.Char

encode :: Int -> String -> String
encode shift msg =
  let ords = map ord msg
      shifted = map (+ shift) ords
  in map chr shifted

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg
