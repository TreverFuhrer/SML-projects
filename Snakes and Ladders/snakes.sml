(* Snakes & Ladders *)

val board = [0,0,3,0,0,~2,0,4,0,0,0,~3,0,0,5,0,0,0,~4,0,2,0,0,~2,0,0,3,0,0,0];

val finalIndex = List.length board - 1;

val g = Random.rand (42, 99);

fun play pos =
    if pos >= finalIndex then
        ( print ("You reached/passed " ^ Int.toString finalIndex ^
        " at position " ^ Int.toString pos ^ ". Game over!\n")
    ; () )
    else
        let
            val _ = print "Press RETURN to roll the die...\n";
            val _ = TextIO.inputLine TextIO.stdIn;
            val die = Random.randRange (1,6) g;
            val _ = print ("You rolled " ^ Int.toString die ^ ".\n");
            val moved = pos + die

            val adj = (List.nth (board, moved)) handle Subscript => 0
            val newPos0 = moved + adj
            val newPos = if newPos0 < 0 then 0 else newPos0
            val _ =
                if adj > 0 then
                    print ("Ladder! Up +" ^ Int.toString adj ^
                           " to " ^ Int.toString newPos ^ ".\n")
                else if adj < 0 then
                    print ("Snake! Down " ^ Int.toString adj ^
                           " to " ^ Int.toString newPos ^ ".\n")
                else
                    print ("No snake or ladder. At " ^ Int.toString newPos ^ ".\n")
        in
            play newPos
        end;

val _ = print "=== Snakes & Ladders ===\n";
val _ = print ("Board squares: 0" ^ Int.toString finalIndex ^ "\n");
val _ = print "Start at 0. Reach or pass the final square to win.\n";
val _ = play 0;