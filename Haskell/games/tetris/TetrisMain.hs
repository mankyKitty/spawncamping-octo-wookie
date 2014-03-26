
module Main where

import Data.List (intersperse)

data Dir = Up
         | Dwn
         | Lft
         | Rht
         deriving Show

boardWidth = 20
boardHeight = 10

getTile :: Int -> Char
getTile t
  | t == 0    = '|'
  | t == 20   = '|'
  | otherwise = ' '
                
getNewPosition :: Dir -> [Int] -> [Int]
getNewPosition dir [x,y]
  | not validMove = [x,y]
  | otherwise = case dir of
    Up -> [(x - 1), y]
    Dwn -> [(x + 1), y]
    Lft -> [x, (y - 1)]
    Rht -> [x, (y + 1)]
  where validMove = isValidMove dir [x,y]

isValidMove :: Dir -> [Int] -> Bool
isValidMove Up  [x,y] = x > 1
isValidMove Dwn [x,y] = x < boardHeight - 1
isValidMove Lft [x,y] = y > 1
isValidMove Rht [x,y] = y < boardWidth - 1

getRow :: [Char]
getRow = [getTile x | x <- [0..20]]

getBoard :: [[Char]]
getBoard = [getRow | x <- [0..10]]

showPlayer :: Char
showPlayer = 'P'

updateBoard :: Char -> [Int] -> [[Char]] -> [[Char]]
updateBoard t [x,y] brd = map (\r -> updateRow t [x,y] r) zippedBoard
  where zippedBoard = zip [0..] brd
        
atPositionOnBoard :: [Int] -> [[Char]] -> Char
atPositionOnBoard [x,y] brd = brd!!x!!y

updateRow :: Char -> [Int] -> (Int,[Char]) -> [Char]
updateRow t [x,y] (n,row)
  | n /= x = row
  | otherwise = rs ++ ([t] ++ (tail rr))
  where (rs,rr) = splitAt y row

printableBoard :: [[Char]] -> [Char]
printableBoard b = foldr (++) "" brd
  where brd = intersperse "\n" b

validInput :: Char -> Bool
validInput m = m `elem` "udlr"

getMove :: Char -> Dir
getMove m = case m of
    'u' -> Up
    'd' -> Dwn
    'l' -> Lft
    'r' -> Rht
    
addScenery :: Char -> [[Int]] -> [[Char]] -> [[Char]]
addScenery tile [] board = board
addScenery tile (loc:rest) board = updateBoard tile loc newBoard
  where newBoard = addScenery tile rest board

updateScore :: Int -> Char -> Int
updateScore n ' ' = n
updateScore n 'o' = n + 1

gameLoop :: [[Char]] -> [Int] -> Int -> IO ()
gameLoop brd pPos score = do
  displayLatestBoard brd score
  (input:xs) <- getLine
  if not $ validInput input
    then  if input == 'q'
          then putStrLn "Game Over"
          else gameLoop brd pPos score
    else let pMoveTo = getNewPosition (getMove input) pPos
             newScore = updateScore score $ atPositionOnBoard pMoveTo brd
             cleanedBoard = updateBoard ' ' pPos brd
             newBoard = updateBoard playerImg pMoveTo cleanedBoard in
         gameLoop newBoard pMoveTo newScore
  where playerImg = showPlayer

displayLatestBoard :: [[Char]] -> Int -> IO ()
displayLatestBoard brd score = do
  putStrLn $ printableBoard brd
  putStr "Current Score: "
  print score
  putStrLn "Move (u = Up, d = Down, l = Left, r = Right), q to Quit:"

main :: IO ()
main = do
  -- Start our game loop
  gameLoop brd startPos startingScore
  where startingScore = 0
        startPos = [0,1]
        prePlayer = addScenery 'o' [[3,5],[6,8],[8,13]] getBoard
        brd = updateBoard (showPlayer) startPos prePlayer