# peg solitaire with Prolog

Peg solitaire is a game in which one is given a board with pegs filling certain positions and the aim is, using a succession of jumps, to reach another goal board position. English peg solitaire is played on a cross shaped board with 31 pegs. [Example] (https://en.wikipedia.org/wiki/Peg_solitaire)

## Program description
The program has three phases: a setting up stage in which the problem is specied, a search phase, and a solution demonstration stage.

Setting up: 
Showing a type of game in peg solitaire.

Search: 
Search a possible solution for a given game.

Demonstration of a search solution:
Showing each step as a print.


## How to run this program


type 

"[pegs]." 

in swipl terminal to load the program file.


Then,
for running different puzzles to find solution: 

type:

"peg(crossbow)."        	--> to find solution for crossbow puzzle
"peg(longbow)."        	--> to find solution for longbow puzzle
"peg(halfdead)."        	--> to find solution for half dead puzzle
"peg(almostdead)."       --> to find solution for almost dead puzzle
"peg(notquitedead)."    --> to find solution for not quite dead puzzle
"peg(full)."        		--> to find solution for full board puzzle

then it should print all the steps board by board on each state.
Also, each game will take less than 10 seconds to find solution.

## Built With

* Prolog
