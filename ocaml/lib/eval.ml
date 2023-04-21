type _ value =
  | Int : int -> int value
  | Bool : bool -> bool value

type _ expr =
  | Value : 'a value -> 'a expr
  | Eq : int expr * int expr -> bool expr
  | Plus : int expr * int expr -> int expr
  | If : bool expr * 'a expr * 'a expr -> 'a expr

let eval_value (type a) (v : a value) : a =
  match v with
  | Int x -> x
  | Bool x -> x

let rec eval : 'a. 'a expr -> 'a =
  fun (type a) (e : a expr) ->
  match e with
  | Value v -> eval_value v
  | If (c, t, e) -> if eval c then eval t else eval e
  | Eq (x, y) -> eval x = eval y
  | Plus (x, y) -> eval x + eval y
