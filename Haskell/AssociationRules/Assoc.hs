module Main where

import qualified Data.List as List
import Text.Show.Pretty (ppShow)

ts = [["Mango", "Onion", "Nintendo", "Key-chain", "Eggs", "Yo-yo"], 
      ["Doll", "Onion", "Nintendo", "Key-chain", "Eggs", "Yo-yo"], 
      ["Mango", "Apple", "Key-chain", "Eggs"], 
      ["Mango", "Umbrella", "Corn", "Key-chain", "Yo-yo"],
      ["Corn", "Onion", "Onion", "Key-chain", "Ice-cream", "Eggs"]]

removeLowFreqPairs :: (Eq a) => Int -> [(a,a,Int)] -> [(a,a,Int)]
removeLowFreqPairs a = filter (\(_,_,n) -> n >= a)

flattenList :: [[a]] -> [a]
flattenList = foldl1 (++)

createPairs :: [a] -> [(a,a)]
createPairs (x:y:[]) = (x,y):[]
createPairs (x:y:xs) = (x,y):(createPairs xs) 

aggregateTransactions :: (Ord a) => [[a]] -> Int -> [(a,Int)]
aggregateTransactions items minFreq = (removeLowFreq . countItemFreq . sortThenGroup . flattenList) items
  where
    sortThenGroup = (List.group . List.sort)
    countItemFreq = map (\all@(x:_) -> (x, length all))
    removeLowFreq = filter (\(_,n) -> n >= minFreq)

-- accumulateUniquePairs :: (Eq a) => [(a,a)] -> [(a,a)] -> [(a,a)]
-- accumulateUniquePairs acc [] = acc
-- accumulateUniquePairs acc ((a,b):xs) = if alreadyAccd
--                                        then accumulateUniquePairs acc xs
--                                        else accumulateUniquePairs ((a,b):acc) xs
--   where
--     alreadyAccd = or [(a,b) `elem` acc, (b,a) `elem` acc]
    
-- getUniquePairs :: (Eq a) => [(a,a)] -> [(a,a)]
-- getUniquePairs = accumulateUniquePairs []
                       
getUniquePairs :: (Eq a) => [(a,a)] -> [(a,a)]
getUniquePairs = foldl (alreadyAccd) []
  where 
    alreadyAccd acc (a,b) = if (b,a) `elem` acc || (a,b) `elem` acc
                            then acc
                            else (a,b):acc

pairOccurFreq :: (Eq a) => [[a]] -> (a,a) -> (a,a,Int)
pairOccurFreq txns (a,b) = (a,b,(sum $ map pairInTxn txns))
  where
    pairInTxn t = if a `elem` t && b `elem` t
                  then 1
                  else 0

itemCombinations :: (Eq a) => [(a,b)] -> [[(a, a)]]
itemCombinations a = (map (createPairs . runMeh) . getItems) a
  where 
    runMeh x = ((x:) . List.intersperse x . filter (\y -> x /= y)) itemsOnly
    getItems = map fst
    itemsOnly = getItems a

buildAssocRules :: (Eq a,Ord a) => [[a]] -> Int -> [(a,a,Int)]
buildAssocRules transactions minFreq = (removeLowFreqPairs minFreq
                                        . map (pairOccurFreq transactions) 
                                        . getUniquePairs
                                        . flattenList
                                        . itemCombinations
                                       ) aggregated
  where 
    aggregated = aggregateTransactions transactions minFreq
                                       
main = 
  let rules = ppShow $ buildAssocRules ts 3 in
  putStrLn rules