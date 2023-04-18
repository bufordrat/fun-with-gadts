module Stringable where

data Stringable where
  Stringable :: { value :: a , showValue :: a -> String } -> Stringable

printStringable :: Stringable -> IO ()
printStringable (Stringable v showV) = putStrLn (showV v)
