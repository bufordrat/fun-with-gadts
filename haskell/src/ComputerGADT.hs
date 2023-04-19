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
