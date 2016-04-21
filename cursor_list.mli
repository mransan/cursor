(** Cursor type for list 
 *)

(** {2 Types} *) 

type 'a t = 'a list * 'a list

(** {2 Creators} *) 

val empty : 'a t

val from_list : 'a -> 'b list * 'a

(** {2 Manipulators} *) 

val go_right : 'a list * 'a list -> 'a list * 'a list

val go_left : 'a list * 'a list -> 'a list * 'a list

val insert : 'a -> 'b * 'a list -> 'b * 'a list

val delete : 'a * 'b list -> 'a * 'b list

val replace : 'a -> 'b * 'a list -> 'b * 'a list

(** {2 Transformation} *) 

val to_list : 'a list * 'a list -> 'a list
