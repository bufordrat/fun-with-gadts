module ComputerThreeTypes where

data Computer
  = A Apple
  | I IBM
  | C Commodore
  deriving (Show, Eq)

data Apple
  = IIc
  | IIe
  | IIgs
  deriving (Show, Eq)

data IBM
  = XT
  | AT
  | PCjr
  deriving (Show, Eq)

data Commodore
  = C64
  | C128
  deriving (Show, Eq)

onlyApples :: Apple -> IO ()
onlyApples _ =
  putStrLn "bring back the Apple IIc, Macs are trash"
