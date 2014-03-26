-- Othello Implementation in Haskell
<<<<<<< HEAD
=======
import Prelude
>>>>>>> c33c1ad4e24b9976ebd5a34d179fe4602a2644ad
import Data.List

data BoardMove = Lft
               | Rht
               | Up
               | Dwn
               | UpLft
               | UpRht
               | DwnLft
               | DwnRht
               deriving (Show,Eq)

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
  Lft    -> start - 1
  Rht    -> start + 1
<<<<<<< HEAD
  Up     -> start + max
  Dwn    -> start - max
  UpLft  -> start + max - 1
  UpRht  -> start + max + 1
  DwnLft -> start - max - 1
  DwnRht -> start - max + 1
=======
  Up     -> start - max
  Dwn    -> start + max
  UpLft  -> start - max - 1
  UpRht  -> start - max + 1
  DwnLft -> start + max - 1
  DwnRht -> start + max + 1
>>>>>>> c33c1ad4e24b9976ebd5a34d179fe4602a2644ad

-- Get a list of the surrounding valid squares
nextSquare :: BoardMove -> Int -> Int -> Maybe (BoardMove, Int)
nextSquare dir bSize sPlc =
  let
    nextSquare = calcMove dir bSize sPlc
  in
   if moveOnBoard bSize nextSquare
   then Just (dir, calcMove dir bSize sPlc)
   else Nothing

-- Check all surrounding squares to see if any can be flipped
neighbours :: Int -> Int -> [Maybe (BoardMove, Int)]
neighbours bSize sPlc = filter (\y -> y /= Nothing) $ [(nextSquare x bSize sPlc) | x <- allDirections]

-- Create a list that represents our board
createBoard :: Int -> [(Int, Char)]
createBoard n = [(x,y)|x <- [0.. (n ^ 2)], y <- ['e']]
