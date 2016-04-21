(** Cursor type for Binary tree *)

(** {2 Types} *)

type 'a tree = E | N of 'a tree * 'a * 'a tree

type 'a path =
    Root
  | Left of 'a * 'a tree * 'a path
  | Right of 'a tree * 'a * 'a path

type 'a cursor = 'a tree * 'a path

exception Top

exception Bottom

(** {2 Creators} *)

val make_tree : 'a tree * 'a * 'a tree -> 'a tree

(** {2 Manipulators} *) 

val move_left : 'a cursor -> 'a cursor

val move_right : 'a cursor -> 'a cursor

val move_up : 'a cursor -> 'a cursor

val of_tree : 'a tree -> 'a cursor

val to_tree : 'a cursor -> 'a tree

val replace : 'a cursor -> 'a tree -> 'a cursor

val delete : 'a cursor -> 'a cursor
