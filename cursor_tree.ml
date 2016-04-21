
type 'a tree = E | N of 'a tree * 'a * 'a tree

type 'a path =
  | Root
  | Left  of 'a * 'a tree * 'a path
  | Right of 'a tree * 'a * 'a path
 
type 'a cursor = 'a tree * 'a path

exception Top

exception Bottom
 
let make_tree : 'a tree * 'a * 'a tree -> 'a tree =
  fun (l, v, r) -> N (l, v, r)
 
let move_left : 'a cursor -> 'a cursor = fun (tree, path) ->
  match tree with
  | E -> raise Bottom
  | N (l, v, r) -> (l, Left (v, r, path))
 
let move_right : 'a cursor -> 'a cursor = fun (tree, path) ->
  match tree with
  | E -> raise Bottom
  | N (l, v, r) -> (r, Right (l, v, path))
 
let move_up : 'a cursor -> 'a cursor = fun (tree, path) ->
  match path with
  | Root -> raise Top
  | Left (v, r, tail) -> (make_tree (tree, v, r), tail)
  | Right (l, v, tail) -> (make_tree (l, v, tree), tail)
 
let of_tree : 'a tree -> 'a cursor = function
  | E -> failwith "of_tree"
  | N (l, v, r) as n -> (n, Root)
 
let rec to_tree : 'a cursor -> 'a tree = function
  | (t, Root) -> t
  | (l, Left (v, r, path)) ->
    to_tree (make_tree (l, v, r), path)
  | (r, Right (l, v, path)) ->
    to_tree (make_tree (l, v, r), path)
 
let replace : 'a cursor -> 'a tree -> 'a cursor =
  fun c t ->
    match c with
    | _, Root -> (t, Root)
    | (_, Left (v, r, path)) -> (t, Left (v, r, path))
    | (_, Right (l, v, path)) ->  (t, Right (l, v, path))
 
let delete : 'a cursor -> 'a cursor =  fun c -> replace c E
