(* alias a="dune exec ./main.exe" *)

(* ---- Basic Types ---- *)
let my_int : int = 42
let my_float : float = 3.14
let my_string : string = "OCaml is cool"
let my_bool : bool = true
let my_char : char = 'A'

(* ---- Functions ---- *)
let add x y = x + y
let square x = x * x

(* ---- Tuples ---- *)
let point : float * float = (1.5, 2.5)

(* ---- Lists ---- *)
let numbers = [1; 2; 3; 4; 5]
let doubled = List.map (fun x -> x * 2) numbers

(* ---- Pattern Matching ---- *)
let describe_number n =
  match n with
  | 0 -> "zero"
  | 1 -> "one"
  | _ -> "many"

(* ---- Option Type ---- *)
let safe_div a b =
  if b = 0 then None else Some (a / b)

(* ---- Record Type ---- *)
type person = {
  name : string;
  age : int;
}

let p1 = { name = "Alice"; age = 30 }

(* ---- Variant Type ---- *)
type shape =
  | Circle of float
  | Rectangle of float * float

let area s =
  match s with
  | Circle r -> 3.1415 *. r *. r
  | Rectangle (w, h) -> w *. h

(* ---- Module Example ---- *)
module Math = struct
  let add x y = x + y
  let sub x y = x - y
end

(* ---- Main Entry Point ---- *)
let () =
  print_endline "=== OCaml Demo ===";
  Printf.printf "my_int: %d\n" my_int;
  Printf.printf "my_float: %.2f\n" my_float;
  Printf.printf "my_string: %s\n" my_string;
  Printf.printf "my_bool: %b\n" my_bool;
  Printf.printf "my_char: %c\n" my_char;
  Printf.printf "point: (%.1f, %.1f)\n" (fst point) (snd point);

  print_endline "\n-- Lists --";
  List.iter (fun n -> Printf.printf "%d " n) doubled;
  print_newline ();

  print_endline "\n-- Pattern Matching --";
  print_endline (describe_number 1);
  print_endline (describe_number 42);

  print_endline "\n-- Option Type --";
  (match safe_div 10 2 with
  | Some r -> Printf.printf "10 / 2 = %d\n" r
  | None -> print_endline "Division by zero!");

  (match safe_div 10 0 with
  | Some r -> Printf.printf "10 / 0 = %d\n" r
  | None -> print_endline "Division by zero!");

  print_endline "\n-- Record --";
  Printf.printf "%s is %d years old.\n" p1.name p1.age;

  print_endline "\n-- Variant and Function --";
  Printf.printf "Area of circle (r=3): %.2f\n" (area (Circle 3.0));
  Printf.printf "Area of rect (3x4): %.2f\n" (area (Rectangle (3.0, 4.0)));

  print_endline "\n-- Module --";
  Printf.printf "5 + 2 = %d\n" (Math.add 5 2);
  Printf.printf "5 - 2 = %d\n" (Math.sub 5 2);

  print_endline "\n-- Function Call --";
  Printf.printf "square of 5 = %d\n" (square 5);
  Printf.printf "add 10 + 20 = %d\n" (add 10 20);

  print_endline "\nDone!";
