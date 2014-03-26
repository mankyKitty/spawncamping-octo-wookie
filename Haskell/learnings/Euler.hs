import Data.Char
import qualified Data.Text as T

appyT :: [Char] -> T.Text
appyT a = if b == (T.pack "hello")
          then T.append b (T.pack ", world")
          else b
  where b = T.pack a

appArg :: [Char] -> [Char]
appArg a = if a == "hello"
           then a ++ ", world"
           else a

isCapitalised :: [Char] -> Bool
isCapitalised [] = False
isCapitalised (first:rest) = isUpper first

myLength :: [Char] -> Integer
myLength [] = 0
myLength (a:rest) = 1 + (myLength rest)

countCaps :: [Char] -> Integer
countCaps [] = 0
countCaps (a:rest)
  | isUpper a = 1 + b
  | otherwise = b
  where b = countCaps rest
        
onlyCaps :: [Char] -> [Char]
onlyCaps [] = []
onlyCaps a = filter isUpper a