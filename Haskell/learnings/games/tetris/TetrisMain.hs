-- My attempt at Haskell Tetris
-- Board size 12 across, 20 down.

module Main where

import Data.List (intersperse)

data Dir = Up
         | Dwn
         | Lft
         | Rht
         deriving Show

width = 20
height = 10

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
isValidMove Dwn [x,y] = x < height
isValidMove Lft [x,y] = y > 1
isValidMove Rht [x,y] = y < width

getRow :: [Char]
getRow = [getTile x | x <- [0..20]]

getBoard :: [[Char]]
getBoard = [getRow | x <- [0..10]]

showPlayer :: Char
showPlayer = 'P'

updateBoard :: Char -> [Int] -> [[Char]] -> [[Char]]
updateBoard t [x,y] brd = map processRow zippedBoard
  where 
    processRow = updateRow t [x,y]
    zippedBoard = zip [0..] brd

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
getMove 'u' = Up
getMove 'd' = Dwn
getMove 'l' = Lft
getMove 'r' = Rht
    
addScenery :: Char -> [[Int]] -> [[Char]] -> [[Char]]
addScenery tile [] board = board
addScenery tile (loc:rest) board = updateBoard tile loc newBoard
  where newBoard = addScenery tile rest board

gameLoop :: [[Char]] -> [Int] -> IO ()
gameLoop brd pPos = do
  putStrLn $ printableBoard brd
  putStrLn "Move (u = Up, d = Down, l = Left, r = Right), q to Quit:"
  input <- getChar
  if (not . validInput) input
    then  if input == 'q'
          then putStrLn "Game Over"
          else gameLoop brd pPos
    else let pMoveTo = getNewPosition (getMove input) pPos 
             cleanedBoard = updateBoard ' ' pPos brd
             newBoard = updateBoard playerImg pMoveTo cleanedBoard in
         gameLoop newBoard pMoveTo
  where playerImg = showPlayer

main :: IO ()
main = do
  let startPos = [0,1]
      prePlayer = addScenery 'o' [[3,5],[6,8],[8,13]] getBoard
      brd = updateBoard (showPlayer) startPos prePlayer in 
    gameLoop brd startPos