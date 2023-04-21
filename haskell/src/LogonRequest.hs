module LogonRequest where

import Data.Kind (Type)

data Incomplete
data Complete

data Option :: Type -> Type -> Type where
  Absent :: Option a Incomplete
  Present :: a -> Option a b

get :: Option a Complete -> a
get (Present x) = x

type Username = String
newtype UserID = UserID Integer
data Permissions = Admin | OrdinaryUser

useridCheck :: UserID -> Permissions -> Bool
useridCheck (UserID 1) Admin = True
useridCheck (UserID 1) OrdinaryUser = True
useridCheck (UserID 2) OrdinaryUser = True
useridCheck _ _ = False

data LogonRequest status =
  LogonRequest { username :: Username
               , userid :: Option UserID status
               , permissions :: Option Permissions status }

requestCheck :: LogonRequest Complete -> Bool
requestCheck (LogonRequest _ (Present uid) (Present perm)) =
  useridCheck uid perm
