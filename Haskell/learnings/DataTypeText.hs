-- This is me... testing data Types
import Data.List

factorial :: (Eq a, Num a) => a -> a
factorial 0 = 1
factorial a = a * (factorial (a - 1))

foofoo = [1,2,5,4,7,9,12,14,8,22,34,99,67]

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
  where
    lesser = filter (< p) xs
    greater = filter (>= p) xs
    
hailstone :: Integer -> Integer
hailstone n
  | n `mod` 2 == 0 = n `div` 2
  | otherwise = 3 * n + 1

intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo [] = [] -- Do nothing to an empty list
sumEveryTwo (x:[]) = [] -- Do nothing to a list with one element
sumEveryTwo (x:y:zs) = (x + y) : sumEveryTwo zs -- RAWR

data Thing = Shoe
           | Ship
           | SealingWax
           | Cabbage
           | King
           deriving Show
                    
shoe :: Thing
shoe = Shoe

listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Cabbage, King]

isSmall :: Thing -> Bool
isSmall Ship = False
isSmall King = False
isSmall _ = True

data FailableDouble = Failure
                    | OK Double
                    deriving Show

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x / y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d) = d

-- Store a persons name, age, and favourite thing
data Person = Person String Int Thing
            deriving Show
                     
brent :: Person
brent = Person "Brent" 30 SealingWax

stan :: Person
stan = Person "Stan" 94 Cabbage

getAge :: Person -> Int
getAge (Person _ a _) = a

baz :: Person -> String
baz p@(Person n _ _) = "The name field of (" ++ show p ++ ") is " ++ n

checkFav :: Person -> String
checkFav (Person n _ SealingWax) = n ++ ", you're my kind of person!"
checkFav (Person n _ _) = n ++ ", your favourite thing is lame"

data IntList = Empty | Cons Int IntList

intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x xs) = x * intListProd xs

data Tree = Leaf Char
            | Node Tree Int Tree
            deriving Show
                     
tree :: Tree
tree = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))

-- Crappy Versions of Functions

addOneToAll :: IntList -> IntList
addOneToAll Empty = Empty
addOneToAll (Cons x xs) = Cons (x + 1) (addOneToAll xs)

absAll :: IntList -> IntList
absAll Empty = Empty
absAll (Cons x xs) = Cons (abs x) (absAll xs)

squareAll :: IntList -> IntList
squareAll Empty = Empty
squareAll (Cons x xs) = Cons (x * x) (squareAll xs)

-- Awesome Versions of Functions

addOne :: Int -> Int
addOne x = x + 1

square :: Int -> Int
square x = x * x

mapIntList :: (Int -> Int) -> IntList -> IntList
mapIntList _ Empty = Empty
mapIntList f (Cons x xs) = Cons (f x) (mapIntList f xs)

