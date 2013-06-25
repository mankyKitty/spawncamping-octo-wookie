-- Attempting to Solve problem 9 from 99 Haskell Problems
import Data.List

testList = "aaaabccaadeeee"
desiredResult = "abcade"

compress [] = []
compress (x:y:xs)
  | x == y && null xs = []
  | x == y = [head xs] ++ compress xs
  | otherwise = [y] ++ compress xs

compressTwo [] = []
compressTwo (x:y:xs) =
  if x == y
  then if null xs
       then []
       else [head xs] ++ compress xs
  else compress (init xs)

main = do
  print $ compress testList == desiredResult
  print $ compressTwo testList == desiredResult