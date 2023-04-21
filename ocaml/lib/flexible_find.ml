type 'a maybe = 'a option

type (_, _) cantfind =
  | ThrowExn : ('a, 'a) cantfind
  | ReturnMaybe : ('a, 'a maybe) cantfind
  | DefaultTo : 'a -> ('a, 'a) cantfind

let rec flexible_find
 : type a b. (a -> bool) -> (a, b) cantfind -> a list -> b =
 fun pred if_not_found list ->
  match list with
  | [] ->
    (match if_not_found with
    | ThrowExn -> failwith "No matching item found"
    | ReturnMaybe -> None
    | DefaultTo x -> x)
  | x :: xs ->
    if pred x
    then (
      match if_not_found with
      | ThrowExn -> x
      | ReturnMaybe -> Some x
      | DefaultTo _ -> x)
    else flexible_find pred if_not_found xs
