module ComputerBasic where

data Computer
  = Apple
  | IBM
  | Commodore

onlyApples :: Computer -> IO ()
onlyApples Apple =
  putStrLn "bring back the Apple IIc, Macs are trash"
onlyApples _ = error "input must be an Apple"
