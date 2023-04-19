module ComputerThreeTypes where

data Computer
  = A Apple
  | I IBM
  | C Commodore

data Apple
  = IIc
  | IIe
  | IIgs

data IBM
  = XT
  | AT
  | PCjr

data Commodore
  = C64
  | C128

onlyApples :: Apple -> IO ()
onlyApples _ =
  putStrLn "bring back the Apple IIc, Macs are trash"
