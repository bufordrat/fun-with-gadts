module FindADT where

data CantFind a
  = ThrowExn
  | ReturnMaybe
  | DefaultTo a

flexibleFind :: (a -> Bool) -> CantFind a -> [a] -> Maybe a
flexibleFind pred whatToDo [] =
  case whatToDo of
    ThrowExn -> error "can't find it!"
    ReturnMaybe -> Nothing
    DefaultTo def -> Just def
flexibleFind pred whatToDo (x : xs) =
  if pred x
  then Just x
  else flexibleFind pred whatToDo xs

throwExample1 :: Maybe Int
throwExample1 = flexibleFind (> 10) ThrowExn [1..15]

throwExample2 :: Maybe Int
throwExample2 = flexibleFind (> 10) ThrowExn [1..5]

maybeExample1 :: Maybe Int
maybeExample1 = flexibleFind (> 10) ReturnMaybe [1..15]

maybeExample2 :: Maybe Int
maybeExample2 = flexibleFind (> 10) ReturnMaybe [1..5]

defaultExample1 :: Maybe Int
defaultExample1 = flexibleFind (> 10) (DefaultTo 999) [1..15]

defaultExample2 :: Maybe Int
defaultExample2 = flexibleFind (> 10) (DefaultTo 999) [1..5]
