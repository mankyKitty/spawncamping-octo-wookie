import Prelude

getPlayerList :: [String] -> Maybe [String]
getPlayerList l = if null l
                  then Nothing
                  else Just l

prettyPlayers :: [String] -> String
prettyPlayers ps =  foldl (++) "" $ map (\x -> "Player: " ++ x ++ "\n") ps 

main = do
  let players = getPlayerList ["Steve", "Pete", "Jack", "Gilgamesh"] in
    case players of
      Just pl -> putStrLn $ prettyPlayers pl
      Nothing -> error "No players entered!"