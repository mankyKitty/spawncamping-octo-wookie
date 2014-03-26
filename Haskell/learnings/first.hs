doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                         then x
                         else x * 2

doubleSmallNumber' x
  | x > 100 = x
  | otherwise = x * 2

boomBangs xs = [if x < 10 then "BOOM!" else "BANG" | x <- xs, odd x]

length' xs = sum [1 | _ <- xs]

triangles = [(a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10]]
rightTriangles = [(a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10], a^2 + b^2 == c^2]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r
