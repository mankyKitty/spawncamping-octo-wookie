{-# LANGUAGE EmptyDataDecls #-}

import Prelude
import DOM
import FFI

data BoardMove = Lft
               | Rht
               | Up
               | Dwn
               | UpLft
               | UpRht
               | DwnLft
               | DwnRht
               deriving Show

-- Get a list of all directions
allDirections :: [BoardMove]
allDirections = [Lft, Rht, Up, Dwn, UpLft, UpRht, DwnLft, DwnRht]

-- Make sure the move is within bounds.
moveOnBoard :: Int -> Int -> Bool
moveOnBoard max newLoc = (newLoc > 0) && (newLoc < (max ^ 2))

-- Find where the next square is for a given direction
-- on the board.
calcMove :: BoardMove -> Int -> Int -> Int
calcMove dir max start = case dir of
  Lft -> start - 1
  Rht -> start + 1
  Up -> start + max
  Dwn -> start - max
  UpLft -> start + max - 1
  UpRht -> start + max + 1
  DwnLft -> start - max - 1
  DwnRht -> start - max + 1

-- Get a list of the surrounding valid squares
nextSquare :: BoardMove -> Int -> Int -> Maybe (BoardMove, Int)
nextSquare dir bSize sPlc =
  let
    nextSquare = calcMove dir bSize sPlc
  in
   if moveOnBoard bSize nextSquare
   then Just (dir, calcMove dir bSize sPlc)
   else Nothing

-- Create a list that represents our board
createBoard :: Int -> [(Int, Char)]
createBoard n = [(x,y)|x <- [0.. (n ^ 2)], y <- ['e']]

-- | Get an element by its ID.
getElementById :: String -> Fay Element
getElementById = ffi "document['getElementById'](%1)"

main :: Fay ()
main = do
  board <- getElementById "game-board"
  appendChild (getElementById "game-board") $ createBoard 3
