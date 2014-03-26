import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
  let nlen = length needle 
      compFunc = compFun nlen in 
  
  foldl compFunc False (tails haystack)
  
  where 
    compFun ln acc x = if take ln x == needle
                       then True
                       else acc
