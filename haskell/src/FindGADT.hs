module FindGADT where

import Data.Kind (Type)

-- agda here
-- data CantFind : Set -> Set -> Set where
--   ThrowExn : { a : Set } -> CantFind a a
--   ReturnMaybe : { a : Set } -> CantFind a (Maybe a)
--   DefaultTo : { a : Set } -> a -> CantFind a a

data CantFind :: Type -> Type -> Type where
  ThrowExn :: CantFind a a
  ReturnMaybe :: CantFind a (Maybe a)
  DefaultTo :: a -> CantFind a a

flexibleFind :: (a -> Bool) -> CantFind a b -> [a] -> b
flexibleFind pred whatToDo [] =
  case whatToDo of
    ThrowExn -> error "can't find it!"
    ReturnMaybe -> Nothing
    DefaultTo def -> def
flexibleFind pred whatToDo (x : xs) =
  if pred x
  then
    case whatToDo of
      ThrowExn -> x
      ReturnMaybe -> Just x
      DefaultTo _ -> x
  else flexibleFind pred whatToDo xs

throwExample1 :: Int
throwExample1 = flexibleFind (> 10) ThrowExn [1..15]

throwExample2 :: Int
throwExample2 = flexibleFind (> 10) ThrowExn [1..5]

maybeExample1 :: Maybe Int
maybeExample1 = flexibleFind (> 10) ReturnMaybe [1..15]

maybeExample2 :: Maybe Int
maybeExample2 = flexibleFind (> 10) ReturnMaybe [1..5]

defaultExample1 :: Int
defaultExample1 = flexibleFind (> 10) (DefaultTo 999) [1..15]

defaultExample2 :: Int
defaultExample2 = flexibleFind (> 10) (DefaultTo 999) [1..5]
