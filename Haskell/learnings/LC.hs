-- file:        LC.hs
-- lines beginning with "--" are comments.

main = interact wordCount
     where wordCount input = show (length input) ++ "\n"