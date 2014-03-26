-- A Binary Tree in Haskell
-- This is rude...

-- Imports
import Data.List

-- Types
-- data BinTree a = Empty
--                | Node a (BinTree a) (BinTree a)
--                deriving (Show)

data BinTree a = Empty
               | Node a (BinTree a) (BinTree a)
               deriving (Eq,Ord)

instance (Show a) => Show (BinTree a) where
  show t = "< " ++ replace '\n' "\n: " (treeshow "" t)
    where
      -- treeshow pref Tree
      --   shows a tree and starts each line with pref
      -- We don't display the Empty tree
      treeshow pref Empty = ""
      -- Leaf
      treeshow pref (Node x Empty Empty) =
        (pshow pref x)
      -- Right Branch is Empty
      treeshow pref (Node x left Empty) =
        (pshow pref x) ++ "\n" ++
        (showSon pref "`--" "  " left)

      -- Left Branch is Empty
      treeshow pref (Node x Empty right) =
        (pshow pref x) ++ "\n" ++
        (showSon pref "`--" "  " right)

      -- Tree with left and right children
      treeshow pref (Node x left right) =
        (pshow pref x) ++ "\n" ++
        (showSon pref "|--" "| " left) ++ "\n" ++
        (showSon pref "`--" "  " right)

      -- shows a tree using some prefixes to make it nice
      showSon pref before next t =
        pref ++ before ++ treeshow (pref ++ next) t

      -- pshow replaces "\n" by "\n"++pref
      pshow pref x = replace '\n' ("\n" ++ pref) (show x)

      -- replaces one char by another string
      replace c new string =
        concatMap (change c new) string
        where
          change c new x
            | x == c = new
            | otherwise = x:[] -- "x"
      
treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                      (treeFromList (filter (>x) xs))

values = [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]

nullTree = Node 0 nullTree nullTree

treeTakeDepth _ Empty = Empty
treeTakeDepth 0 _ = Empty
treeTakeDepth n (Node x left right) =
  let
    nl = treeTakeDepth (n-1) left
    nr = treeTakeDepth (n-1) right
  in
   Node x nl nr

iTree = Node 0 (dec iTree) (inc iTree)
  where
    dec (Node x l r) = Node (x-1) (dec l) (dec r)
    inc (Node x l r) = Node (x-1) (inc l) (inc r)

-- Apply a function to each node
treeMap :: (a -> b) -> BinTree a -> BinTree b
treeMap f Empty = Empty
treeMap f (Node x left right) = Node (f x)
                                (treeMap f left)
                                (treeMap f right)

infTreeTwo :: BinTree Int
infTreeTwo = Node 0
             (treeMap (\x -> x-1) infTreeTwo)
             (treeMap (\x -> x+1) infTreeTwo)


-- main = print $ treeFromList [7,2,4,8]
-- main = print $ treeTakeDepth 4 nullTree
main = print $ treeTakeDepth 4 infTreeTwo
