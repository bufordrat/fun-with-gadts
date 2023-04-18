module Vec where

import Data.Kind (Type)

data Nat where
  Zero :: Nat
  Succ :: Nat -> Nat

data Vec :: Nat -> Type -> Type where
  Empty :: Vec 'Zero a
  (:>) :: a -> Vec n a -> Vec ('Succ n) a
