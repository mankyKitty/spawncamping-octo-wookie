type Name = String
type Colour = String

showInfos :: Name -> Colour -> String
showInfos name colour = "Name: " ++ name ++ ", Colour: " ++ colour

name :: Name
name = "Robin"

colour :: Colour
colour = "Blue"

main = putStrLn $ showInfos colour name
