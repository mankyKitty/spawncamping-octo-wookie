-- We declare the type using ::
f :: Num a => a -> a -> a
f x y = x*x + y*y

square :: Num a => a -> a
square x = x^2
square' x = (^) x 2
square'' x = (^2) x
square''' = (^2)

absolute :: (Ord a, Num a) => a -> a
absolute x = if x >= 0 then x else -x
absolute' x
  | x >= 0 = x
  | otherwise = -x

main = print $ f (square 3) 4.2