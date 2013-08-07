
encodeMe = "aaaabccaadeeee"

data Encoded = Single Int Char
             | Multiple Int Char
             deriving (Show)

encodeModified :: [Char] -> [Encoded]
encodeModified (x:xs) =
  encodeModifiedRun xs [] $ Single 1 x

encodeModifiedRun :: [Char] -> [Encoded] -> Encoded -> [Encoded]
encodeModifiedRun [] acc _ =
  acc
encodeModifiedRun (x:[]) acc (Single cnt char)
  | x == char = acc ++ [Multiple (cnt + 1) char]
  | otherwise = acc ++ [Single 1 char, Single 1 x]
encodeModifiedRun (x:[]) acc (Multiple cnt char) =
  acc ++ [Multiple cnt char]
encodeModifiedRun (x:xs) acc (Single cnt char)
  | x == char = getRest acc $ Multiple (cnt + 1) char
  | otherwise = getRest (acc ++ [Single 1 char]) $ Single 1 x
 where
  getRest = encodeModifiedRun xs
encodeModifiedRun (x:xs) acc (Multiple cnt char)
  | x == char = getRest acc $ (Multiple (cnt + 1) char)
  | otherwise = getRest (acc ++ [Multiple cnt char]) $ Single 1 x
 where
  getRest = encodeModifiedRun xs

decodeModified :: [Encoded] -> [Char]
decodeModified code =
  decodeModifiedRun code []

decodeModifiedRun :: [Encoded] -> [Char] -> [Char]
decodeModifiedRun [] acc = acc
decodeModifiedRun ((Single cnt char):xs) acc = (acc ++ [char]) ++ rest
  where rest = decodeModifiedRun xs acc
decodeModifiedRun ((Multiple cnt char):xs) acc = (acc ++ letters) ++ rest
  where letters = take cnt (repeat char)
        rest = decodeModifiedRun xs acc

