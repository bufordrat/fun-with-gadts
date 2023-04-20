module Basic where

-- plain vanilla example
-- data NormalSum a b
--   = Zeroary
--   | Unary a
--   | Binary a b
--   deriving (Show, Eq)

-- same example using GADT syntax
-- data NormalSum a b where
--   Zeroary :: NormalSum a b
--   Unary :: a -> NormalSum a b
--   Binary :: a -> b -> NormalSum a b
--   deriving (Show, Eq)

-- whoa, NOT SO NORMAL ANYMORE
data NormalSum b c where
  Zeroary :: NormalSum a Char
  Unary :: String -> NormalSum a String
  Binary :: Int -> Bool -> NormalSum Int Bool

