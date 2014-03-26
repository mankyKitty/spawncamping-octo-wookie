-- file: Currying.hs
-- This is me trying out function currying and folds and scans and other things.

add :: Int -> Int -> Int
add a b = a + b

useAddCurry =
  map addTwo [3..20]
  where 
    addTwo = add 2
    
useFoldl xs = foldl1 (+) xs