-- Learning how to fold
import Data.List

f :: (a -> b -> b) -> b -> [a] -> b
f func valueWhenEmpty (head:tail) = func head recursiveCallWithTail
  where recursiveCallWithTail = f func valueWhenEmpty tail

-- Original Len
len :: [a] -> Int
len [] = 0
len (head:tail) = 1 + len tail

-- New Len
len2 :: [a] -> Int
len2 list = f func 0 list
  where func head lenOfTail = 1 + lenOftail