
type 'a t = 'a list * 'a  list
 
let empty : 'a t = 
  ([], [])
 
let from_list l = 
  ([], l)
 
let to_list (ls, rs) = 
  List.rev ls @ rs
 
let go_right = function 
  | (ls, h :: tl) -> (h :: ls, tl)
  | x -> x 
 
let go_left = function
  | (h :: tl, rs) -> (tl, h :: rs)
  | z -> z
 
let insert a = function 
  | (ls, rs) -> (ls, a :: rs)
 
let delete = function
  | (ls, _ :: rs) -> (ls, rs)
  | z -> z
 
let replace a = function 
  | (ls, _ :: rs) -> (ls, a :: rs)
  | z -> z
