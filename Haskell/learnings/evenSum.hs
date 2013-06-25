-- file evenSum.hs
-- Even sum refactoring

-- Version 1

evenSum :: Integral a => [a] -> a
evenSum l = accumSum 0 l
  where accumSum n l =
          if l == []
          then n
          else let x = head l
                   xs = tail l
               in if even x
                  then accumSum (n+x) xs
                  else accumSum n xs

-- Version 3
evenSum l = accumSum 0 l
    where
      accumSum n [] = n
      accumSum n (x:xs) =
        if even x
        then accumSum (n+x) xs
        else accumSum n xs

-- Version 4
evenSum :: Integral a => [a] -> a

evenSum = accumSum 0
  where
    accumSum n [] = n
    accumSum n (x:xs) =
      if even x
      then accumSum (n+x) xs
      else accumSum x xs

-- Version 5
evenSum l = mysum 0 (filter even l)
  where
    mysum n [] = n
    mysum n (x:xs) = mysum (n+x) xs

-- Version 6
import Data.List
evenSum l = foldl' mysum 0 (filter even l)
  where mysum acc value = acc + value

-- Version 7
import Data.List (foldl')
evenSum l = foldl' (\x y -> x+y) 0 (filter even l)

-- Version 8
import Data.List (foldl')
evenSum :: Integral a => [a] -> a
evenSum l = foldl' (+) 0 (filter even l)

-- Version 9
import Data.List (foldl')
evenSum :: Integral a => [a] -> a
evenSum = (foldl' (+) 0) . (filter even)

-- Version 10
import Data.List (foldl')
sum' :: (Num a) => [a] -> a
sum' = foldl' (+) 0
evenSum :: Integral a => [a] -> a
evenSum = sum' . (filter even)

