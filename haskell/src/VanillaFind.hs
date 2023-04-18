module VanillaFind where

import Data.List (find)

example1 :: Maybe Int
example1 = find (> 10) [1..15]

example2 :: Maybe Int
example2 = find (> 10) [1..5]
