-- Create a disemvowel function
import Data.Char (toLower)
import Data.List (intersperse)

disemvowel :: [Char] -> [Char]
disemvowel = unwords . filter (isVowel . head) . words
  where isVowel c = toLower c `elem` "aeiou"

fizzBuzz :: Int -> [Char]
fizzBuzz n
  | fizz n && buzz n = "FizzBuzz"
  | fizz n           = "Fizz"
  | buzz n           = "Buzz"
  | otherwise        = ""
  where fizz n = n `mod` 3 == 0
        buzz n = n `mod` 5 == 0

fizzList n = map (\x -> if null $ fizzBuzz x
                        then show x
                        else fizzBuzz x)
             [1..n]
