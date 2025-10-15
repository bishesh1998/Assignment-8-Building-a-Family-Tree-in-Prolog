% Basic Facts 
male(john).
male(paul).
male(james).
male(robert).
female(mary).
female(linda).
female(susan).
female(kate).

parent(john, paul).
parent(john, mary).
parent(linda, paul).
parent(linda, mary).
parent(paul, james).
parent(paul, kate).
parent(susan, robert).

% Derived Rules 
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

cousin(X, Y) :-
  parent(A, X), parent(B, Y),
  sibling(A, B), X \= Y.

child(X, Y) :- parent(Y, X).

descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Z, X), descendant(Z, Y).

% Entry Point for Compilation 
main :-
  write('Sample Queries '), nl,
  (grandparent(john, james) -> write('John is a grandparent of James'), nl; true),
  (sibling(paul, mary) -> write('Paul and Mary are siblings'), nl; true),
  (cousin(kate, robert) -> write('Kate and Robert are cousins'), nl; true),
  halt.

:- initialization(main).
