module ComputerGADT where

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

data Computer a where
  A :: Apple -> Computer Apple
  I :: IBM -> Computer IBM
  C :: Commodore -> Computer Commodore

instance Show Apple where
  show IIc = "Apple IIc"
  show IIe = "Apple IIe"
  show IIgs = "Apple IIgs"

onlyApples :: Computer Apple -> IO ()
onlyApples (A app) =
  putStrLn $ "It's an " <> show app <> "!"

