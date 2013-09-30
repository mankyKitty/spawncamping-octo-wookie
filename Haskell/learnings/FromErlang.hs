-- Replicating stuff from Learn You Some Erlang.

module Main where

import Criterion.Main (defaultMain,bench,whnf)

myLen :: [a] -> Int
myLen [] = 0
myLen (_:xs) = ((+1) . myLen) xs

tailLen :: [a] -> Int
tailLen = accTailLen 0

accTailLen :: Int -> [a] -> Int
accTailLen acc [] = acc
accTailLen acc (_:xs) = accTailLen (acc+1) xs

main = defaultMain [
    bench "myLen [1..100000]" $ whnf myLen [1..100000]
  , bench "tailLen [1..100000]" $ whnf tailLen [1..100000]
  ]