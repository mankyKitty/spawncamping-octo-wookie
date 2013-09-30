import Data.Char
import Test.QuickCheck

-- Arbitrary Char is now part of the library

{-
instance Arbitrary Char where
  arbitrary   = choose ('\32', '\128')
  coarbitrary = variant (ord c `rem` 4)
-}

getList :: IO [Char]
getList = fmap take5 getContents

take5 :: [Char] -> [Char]
take5 = take 5 . filter (`elem` ['a'..'e'])
