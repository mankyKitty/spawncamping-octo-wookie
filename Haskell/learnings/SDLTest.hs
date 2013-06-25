import Graphics.UI.SDL as SDL

main :: IO ()
main = do
  SDL.init [SDL.InitEverything]
  SDL.setVideoMode 640 480 32 []
  SDL.setCaption "Video Test!" "video test"
  eventLoop
  SDL.quit
  print "done"
  where 
    eventLoop = SDL.waitEventBlocking >>= checkEvent
    checkEvent (KeyUp _) = return ()
    checkEvent _ = eventLoop