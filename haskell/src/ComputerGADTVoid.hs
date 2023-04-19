module ComputerGADTVoid where

data Apple

data IBM

data Commodore

data Computer a where
  A :: Computer Apple
  I :: Computer IBM
  C :: Computer Commodore

onlyApples :: Computer Apple -> IO ()
onlyApples A =
  putStrLn $ "I'm talkin' a real Apple, as in the one \
             \that has BASIC for an OS."
