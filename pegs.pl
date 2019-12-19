/*
each of this funciton runs different puzzles
*/
peg(X) :- X == crossbow, solution_top([31,32,34,35,41,42,43,44,45,53],[3]).
peg(X) :- X == longbow, solution_top([20,30,31,41,33,43,35,45,26,36,52,53,54,63],[3]).
peg(X) :- X == halfdead, solution_center([20,22,23,24,30,34,35,40,41,42,43,44,45,52,54,62,64],[33]).
peg(X) :- X == almostdead, solution_center([22,23,24,34,35,42,43,44],[33]).
peg(X) :- X == notquitedead, solution_center([2,3,4,12,14,20,21,22,23,24,25,26,30,32,35,36,40,41,42,43,44,45,46,52,54,62,64],[33]).
peg(X) :- X == full, solution_center([2,3,4,12,13,14,20,21,22,23,24,25,26,30,31,32,34,35,36,40,41,42,43,44,45,46,52,53,54,62,63,64],[33]).


/*
these are hard-coded pagoda functions
*/
pagoda(simple, 13, 1).
pagoda(simple, 31, 1).
pagoda(simple, 33, 1).
pagoda(simple, 35, 1).
pagoda(simple, 53, 1).

pagoda(strong, 3, 21).
pagoda(strong, 13, 13).
pagoda(strong, 23, 8).
pagoda(strong, 20, -8).
pagoda(strong, 21, 8).
pagoda(strong, 25, 8).
pagoda(strong, 26, -8).
pagoda(strong, 30, 5).
pagoda(strong, 31, 5).
pagoda(strong, 33, 5).
pagoda(strong, 35, 5).
pagoda(strong, 36, 5).
pagoda(strong, 40, -3).
pagoda(strong, 41, 3).
pagoda(strong, 43, 3).
pagoda(strong, 45, 3).
pagoda(strong, 46, -3).
pagoda(strong, 53, 2).
pagoda(strong, 54, 3).
pagoda(strong, 63, 1).

pagoda(center, 13, 1).
pagoda(center, 20, -1).
pagoda(center, 21, 1).
pagoda(center, 23, 1).
pagoda(center, 25, 1).
pagoda(center, 26, -1).
pagoda(center, 31, 2).
pagoda(center, 33, 2).
pagoda(center, 35, 2).
pagoda(center, 40, -1).
pagoda(center, 41, 1).
pagoda(center, 43, 1).
pagoda(center, 45, 1).
pagoda(center, 46, -1).
pagoda(center, 53, 1).

pagoda(rotate, 2, -1).
pagoda(rotate, 4, -1).
pagoda(rotate, 12, 1).
pagoda(rotate, 13, 2).
pagoda(rotate, 14, 1).
pagoda(rotate, 31, 1).
pagoda(rotate, 32, 1).
pagoda(rotate, 33, 2).
pagoda(rotate, 34, 1).
pagoda(rotate, 35, 1).
pagoda(rotate, 52, 1).
pagoda(rotate, 53, 2).
pagoda(rotate, 54, 1).
pagoda(rotate, 62, -1).
pagoda(rotate, 64, -1).



/*

these are print functions
*/
prints(67,_,_,_).
prints(N,A,C,G) :- not(outrange(N)), onboard(N), member(N,G), write(' O '), Tn is N+1, prints(Tn,A,C,G).
prints(N,A,C,G) :- member(N,C), member(N,A), write(' X '), nl, Tn is N+1, prints(Tn,A,C,G).
prints(N,A,C,G) :- member(N,C), not(member(N,A)), write(' - '), nl, Tn is N+1, prints(Tn,A,C,G).
prints(N,A,C,G) :- not(outrange(N)), onboard(N), not(member(N,A)), write(' - '), Tn is N+1, prints(Tn,A,C,G).
prints(N,A,C,G) :- not(outrange(N)), not(onboard(N)), write(' - '), Tn is N+1, prints(Tn,A,C,G).
prints(N,A,C,G) :- not(outrange(N)), onboard(N), member(N,A), write(' X '), Tn is N+1, prints(Tn,A,C,G).
prints(N,A,C,G) :- Tn is N+1, prints(Tn,A,C,G).

printsgoal(67,_,_).
printsgoal(N,C,G) :- member(N,G), write(' X '), Tn is N+1, printsgoal(Tn,C,G).
printsgoal(N,C,G) :- not(outrange(N)), member(N,C), write(' - '), nl, Tn is N+1, printsgoal(Tn,C,G).
printsgoal(N,C,G) :- not(outrange(N)), write(' - '), Tn is N+1, printsgoal(Tn,C,G).
printsgoal(N,C,G) :- Tn is N+1, printsgoal(Tn,C,G).

/*
this function attach an element to infront of list
*/
pushFront(Item, List, [Item|List]).

/*
this function removes an item from list
*/
remove(X, [X|T], T).
remove(X, [H|T], [H|R]) :- remove(X, T ,R).


/*
this function checks if a position is on board
*/
onboard(N) :- 
    2 =< N, N =< 4;
    12 =< N, N =< 14;
    20 =< N, N =< 26;
    30 =< N, N =< 36;
    40 =< N, N =< 46;
    52 =< N, N =< 54;
    62 =< N, N =< 64.

/*
this function checks if a postion is in the range of 7-9.
*/    
outrange(N) :- 
    7 =< N, N =< 9;
    17 =< N, N =< 19;
    27 =< N, N =< 29;
    37 =< N, N =< 39;
    47 =< N, N =< 49;
    57 =< N, N =< 59;
    67 =< N.

/*
this 4 jump functions is called under jump function to search 4 ways 
*/
jump_up(Start, Jumped, End) :-
    Jumped is Start-10,
    End is Start-20,
    onboard(Start),
    onboard(Jumped),
    onboard(End).

jump_down(Start, Jumped, End) :-
    Jumped is Start+10,
    End is Start+20,
    onboard(Start),
    onboard(Jumped),
    onboard(End).

jump_right(Start, Jumped, End) :-
    Jumped is Start+1,
    End is Start+2,
    onboard(Start),
    onboard(Jumped),
    onboard(End).

jump_left(Start, Jumped, End) :-
    Jumped is Start-1,
    End is Start-2,
    onboard(Start),
    onboard(Jumped),
    onboard(End).

/*
this jump function checks 4 ways of possible moves
*/
jump(Start, Jumped, End) :- jump_right(Start, Jumped, End).
jump(Start, Jumped, End) :- jump_left(Start, Jumped, End).
jump(Start, Jumped, End) :- jump_up(Start, Jumped, End).
jump(Start, Jumped, End) :- jump_down(Start, Jumped, End).


/*
this function returns a valid move
*/
solitaire_move(SB,(Start,End),[End|SB2]) :-
    remove(Start, SB, SB1),
    jump(Start,Jumped,End),
    remove(Jumped,SB1,SB2),
    not(member(End,SB2)).


solitaire_steps2(GB,[],GB).
solitaire_steps2(SB,[Mv|Moves],GB) :-
    solitaire_move(SB,Mv,SB1),
    solitaire_steps2(SB1,Moves,GB), !.



/*
this function prints solutions to screen for puzzles that has a goal in center (poistion 33)
*/
solution_center(GB,GB).
solution_center(SB,GB) :-
    prints(0, SB, [6,16,26,36,46,56], GB), nl, nl, write("===================="), nl,
    solitaire_steps_center(SB, Movelist, [], GB),
    show_steps(SB, Movelist, GB),
    printsgoal(0, [6,16,26,36,46,56], GB), nl, nl, write("===================="), nl.


/*
this function prints solutions to screen for puzzles that has a goal in upper part (poistion 3)
*/
solution_top(GB,GB).
solution_top(SB,GB) :-
    prints(0, SB, [6,16,26,36,46,56], GB), nl, nl, write("===================="), nl,
    solitaire_steps_top(SB, Movelist, [], GB),
    show_steps(SB, Movelist, GB),
    printsgoal(0, [6,16,26,36,46,56], GB), nl, nl, write("===================="), nl.

/*
this function prints the solution of the puzzle step by step by printing each state.
*/
show_steps(SB, [(Start,End)|Moves], GB) :-
    remove(Start, SB, SB1),
    jump(Start, Jumped, End),
    remove(Jumped, SB1, SB2),
    pushFront(End, SB2, SB3),
    prints(0, SB3, [6,16,26,36,46,56], GB), nl, nl, write("===================="), nl,
    show_steps(SB3, Moves, GB).
show_steps(_, [], _).


/*
this function returns a list of valid moves for the puzzle that has a goal in center (position 33)
*/
solitaire_steps_center(GB,[],_,GB). 
solitaire_steps_center(SB,[Mv|Moves], History, GB) :-
    solitaire_move(SB, Mv, SB2),
    indep(Mv,History),
    findall((Pagoda, Weight), (member(Pagoda,[center,rotate]), weight(Pagoda, SB2, Weight)), WeightList),
	check_weight(full, WeightList),
    solitaire_steps_center(SB2, Moves, [Mv|History], GB), !.

/*
this function returns a list of valid moves for the puzzle that has a goal in upper part (poistion 3)
*/
solitaire_steps_top(GB,[],_,GB). 
solitaire_steps_top(SB,[Mv|Moves], History, GB) :-
    solitaire_move(SB, Mv, SB2),
    indep(Mv,History),
    findall((Pagoda, Weight), (member(Pagoda,[strong]), weight(Pagoda, SB2, Weight)), WeightList),
	check_weight(longbow, WeightList),
    solitaire_steps_top(SB2, Moves, [Mv|History], GB), !.

/*
this function returns the current pagoda weight of a board
*/
weight(_, [], 0).
weight(P, [Position|Rest], ReturnWeight) :-
    (pagoda(P, Position, PagodaWeight); PagodaWeight = 0),!,
    weight(P, Rest, WeightRest),
    ReturnWeight is WeightRest + PagodaWeight.

/*
this function returns the weight of different pagoda function
*/

goalWeight(longbow, strong, 21).
goalWeight(crossbow, strong, 21).
goalWeight(nqd, center, 2).
goalWeight(nqd, strong, 5).
goalWeight(nqd, simple, 1).
goalWeight(nqd, rotate, 2).
goalWeight(full, center, 2).
goalWeight(full, strong, 5).
goalWeight(full, simple, 1).
goalWeight(full, rotate, 2).


/*
this function checks if the current pagoda weight of board is larger or smaller than goal weight.
*/

check_weight(_,[]).
check_weight(G,[(Pagoda,PagodaWeight)|Rest]) :- 
    goalWeight(G,Pagoda,WeightGoal),
    WeightGoal =< PagodaWeight, 
    check_weight(G,Rest).


/*
this function checks if a move is independent from the list of history moves
*/
indep(_, []).
indep(Mv, [H|_]) :- overlap(Mv, H), !. 
indep(Mv, [H|T]) :- lexorder(Mv, H), indep(Mv, T).


/*
this function checks if two moves are overlapped
*/
overlap((Start,End),(Start2,End2)) :- 
    jump(Start, Jumped, End),
    jump(Start2, Jumped2, End2),
    (member(Start, [Start2, Jumped2, End2]) ; 
    member(Jumped, [Start2, Jumped2, End2]) ; 
    member(End, [Start2, Jumped2, End2])).
/*
this function orders given moves
*/
lexorder((S1, _),(S2, _)) :- S1 =< S2.
