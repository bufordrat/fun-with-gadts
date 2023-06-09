-- Thanks to Nathan Mull for writing this!

module Find where

open import Data.Maybe
open import Data.Bool
open import Data.List

data CantFind : Set → Set → Set where
  returnMaybe : {a : Set} → CantFind a (Maybe a)
  defaultTo  : {a : Set} → a → CantFind a a

flexibleFind : {a b : Set} → (a → Bool) → CantFind a b → List a → b
flexibleFind pred returnMaybe [] = nothing
flexibleFind pred (defaultTo x) [] = x
flexibleFind pred whatToDo (x ∷ xs) with pred x
flexibleFind pred returnMaybe (x ∷ xs) | true = just x
flexibleFind pred (defaultTo _) (x ∷ xs) | true = x
... | false = flexibleFind pred whatToDo xs

data FindCase : Set where
  maybeReturn : FindCase
  defaultReturn : FindCase

returns : FindCase → Set → Set
returns maybeReturn a = Maybe a
returns defaultReturn a = a → a

depFind : {a : Set} → (c : FindCase) → (a → Bool) → List a → returns c a
depFind maybeReturn pred [] = nothing
depFind defaultReturn pred [] default = default
depFind whatToDo pred (x ∷ xs) with pred x
depFind maybeReturn pred (x ∷ xs) | true = just x
depFind defaultReturn pred (x ∷ xs) | true = λ _ → x
... | false = depFind whatToDo pred xs

findMaybe : {a : Set} → (a → Bool) → List a → Maybe a
findMaybe {a} = depFind {a} maybeReturn

findDefault : {a : Set} → (a → Bool) → List a → a → a
findDefault {a} = depFind {a} defaultReturn
