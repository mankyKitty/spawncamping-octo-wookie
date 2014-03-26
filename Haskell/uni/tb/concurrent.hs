-- Attempt to grok some algorithms I need to implement.

import Control.Concurrent
import Control.Concurrent.MVar

reader putLine putEOF takeCount = 
  do ls <- fmap lines (readFile "input.txt")
     mapM putLine ls
     putEOF
     n <- takeCount
     print n
     
writer takeLine putCount = loop 0     
  where loop n = do l <- takeLine
                    case l of
                      Just x -> do putStrLn x
                                   loop (n+1)
                      Nothing -> putCount n

main =
  do lineVar <- newEmptyMVar
     countVar <- newEmptyMVar
     
     let takeLine = takeMVar lineVar
         putLine = putMVar lineVar . Just
         putEOF = putMVar lineVar Nothing
         takeCount = takeMVar countVar
         putCount = putMVar countVar
         
     forkIO $ writer takeLine putCount
     reader putLine putEOF takeCount