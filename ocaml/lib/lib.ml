let message = "GADTs ahoy!"

type void = |

type (_,_) rat =
  | Giraffe : int -> (_,int) rat
  | Armadillo : (string,_) rat

