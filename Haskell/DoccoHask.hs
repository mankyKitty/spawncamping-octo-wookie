-- Testing Literate Haskell with Docco
-- ===================================

-- _This_ is me testing how well the Docco Haskell integration works. Hopefully
-- this will work out in my favour and I can use it to [blog](https://mankyKitty.github.io)
-- about.

mySum n [] = n
-- *Inline Comments* ? HOW DOES IT WORK?!
mySum n (x:xs) = mySum (n + x) xs

