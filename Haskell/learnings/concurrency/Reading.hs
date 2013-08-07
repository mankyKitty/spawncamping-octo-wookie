-- reading files

parse c =


main = do
  content <- readFile "./test.txt"
  stuff = parse content
