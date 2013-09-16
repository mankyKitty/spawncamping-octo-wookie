-- Trying to recreate what I lost :(

import System.Environment
import System.IO

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

main = 
  do
    [from] <- getArgs
    fr <- B.readFile from
    print $ ((map BC.words) . BC.lines) fr