module Basic where

data NormalSum a b
  = Zeroary
  | Unary a
  | Binary a b

data GADTSyntax a b where
  ZeroaryGS :: GADTSyntax a b
  UnaryGS :: a -> GADTSyntax a b
  BinaryGS :: a -> b -> GADTSyntax a b

data ActualGADT c d where
  ZeroaryAG :: ActualGADT a Char
  UnaryAG :: String -> ActualGADT a String
  BinaryAG :: Int -> Bool -> ActualGADT Int Bool

defaultBoolList :: ActualGADT a Char -> Char
defaultBoolList ZeroaryAG = 'a'
