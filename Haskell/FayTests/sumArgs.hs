import Data.Maybe
import Data.Char

maybeReadJunk :: Read a => String -> Maybe a
maybeReadJunk s = case reads s of
  [(x,"")] -> Just x
  _ -> Nothing

getList str = maybeReadJunk $
              "[" ++ (map
                      (\x -> if (isNumber x)
                             then x
                             else ',')
                      str)
              ++ "]"

askUserStuff :: IO [Integer]
askUserStuff = do
  putStrLn "Enter a list of numbers (separated by spaces):"
  input <- getLine
  let maybeList = getList input in
    case maybeList of
      Just l -> return l
      Nothing -> error "YOU FAIL!"

main :: IO ()
main = do
  list <- askUserStuff
  print $ sum list