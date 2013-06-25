-- take all elements of a BinTree
-- up to some Depth

import Data.List

data BinTree a = Empty
               | Node a (BinTree a) (BinTree a)
               deriving (Eq,Ord)

treeTakeDepth _ Empty = Empty
treeTakeDepth 0 _ = Empty
treeTakeDepth n (Node x left right) =
  let
    nl = treeTakeDepth (n-1) left
    nr = treeTakeDepth (n-1) right
  in
   Node x nl nr

main = print $ takeTreeDepth 4 nullTree