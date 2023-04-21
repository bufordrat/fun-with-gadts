type 'a maybe = 'a option

type (_, _) cantfind =
  | ThrowExn : ('a, 'a) cantfind
  | ReturnMaybe : ('a, 'a maybe) cantfind
  | DefaultTo : 'a -> ('a, 'a) cantfind

let rec flexible_find
 : type a b. (a -> bool) -> (a, b) cantfind -> a list -> b =
  fun pred what_to_do lst ->
  match lst with
  | [] -> begin
      match what_to_do with
      | ThrowExn -> failwith "No matching item found"
      | ReturnMaybe -> None
      | DefaultTo x -> x
    end
  | x :: xs ->
    if pred x
    then begin
        match what_to_do with
        | ThrowExn -> x
        | ReturnMaybe -> Some x
        | DefaultTo _ -> x
      end
    else flexible_find pred what_to_do xs

