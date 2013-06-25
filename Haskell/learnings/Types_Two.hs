data Name = NameConstr String
data Colour = ColourConstr String

showInfos :: Name -> Colour -> String
showInfos (NameConstr name) (ColourConstr colour) =
  "Name" ++ name ++ ", Colour:" ++ colour

name = NameConstr "Robin"
colour = ColourConstr "Blue"

main = putStrLn $ showInfos name colour