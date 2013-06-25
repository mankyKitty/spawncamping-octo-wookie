-- file helloNamed.hs
-- hello world with input omg!

main = do
  print "What is your name?"
  name <- getLine
  print ("Hello " ++ name ++ "!")