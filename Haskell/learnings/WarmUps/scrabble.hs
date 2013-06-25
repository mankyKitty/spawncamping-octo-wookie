-- Attempt at Scrabble Warm Up Problem
import Data.List
import Data.Char

letterList = [(1, "aeioulnrst"),
              (2, "dg"),
              (3, "bcmp"),
              (4, "fhvwy"),
              (5, "k"),
              (8, "jx"),
              (10, "qz")]
             
letterScore :: Char -> Integer
letterScore n = (fst . head) $ filter (\y -> any ((toLower n) ==) (snd y)) letterList

wordScoreMap :: [Char] -> [Integer]
wordScoreMap w = map letterScore w

wordScore :: [Char] -> Integer
wordScore w = foldr (+) 0 $ wordScoreMap w