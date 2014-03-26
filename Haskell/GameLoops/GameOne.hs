-- My first attempt at a game loop in yeee haskell

module GameOne where

import Graphics.UI.SDL

main = withInit [InitEverything] $ do --withInit calls quit us.
  screen <- setVideoMode 640 480 32 [SWSurface]
  hello <- loadBMP "/Users/manky/Pictures/hello.bmp"
  
  blitSurface hello Nothing screen Nothing
  
  Graphics.UI.SDL.flip screen
  
  delay 2000