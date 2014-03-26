{-# LANGUAGE ForeignFunctionInterface #-}
module MainWrapper where
import GameOne (main)
foreign export ccall "haskell_main" main :: IO ()