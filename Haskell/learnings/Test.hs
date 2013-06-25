import Data.List

main = do putStrLn "What is 2 + 2?"
          x <- readLn
          if check x
            then putStrLn "You're right!"
            else putStrLn "You're wrong!"
                 
check:: Int -> Bool
check foo = foo == 4

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

secsToWeeks:: Fractional a => a -> a
secsToWeeks secs = let perMinute = 60
                       perHour = 60 * perMinute
                       perDay  = 24 * perHour
                       perWeek = 7 * perDay
                   in secs / perWeek

classify:: Int -> String
classify age = case age of 0 -> "newborn"
                           1 -> "infant"
                           2 -> "toddler"
                           _ -> "senior citizen"

myLast:: [a] -> a
myLast a = last a

lastButOne:: [a] -> a
lastButOne a = last (init a)

elementAt:: [a] -> Int -> a
elementAt a b = a !! (b - 1)

myLength:: [a] -> Int
myLength a = length a

isPalindrome:: Eq a => [a] -> Bool
isPalindrome a = reverse a == a

flatten:: [[a]] -> [a]
flatten [] = []
flatten a = concat a

compress:: [a] -> [a]
compress [] = []

x = [1..20]
y = [[1..4],[5..10],[11..15]]
z = "aaaabccaadeeee"