/* Basic library methods. */

ne(X, Y) :- X, Y, !, fail.
ne(X, Y) :- \+X, \+Y, !, fail.
ne(_, _).

eq(X, Y) :- X, \+Y, !, fail.
eq(X, Y) :- \+X, Y, !, fail.
eq(_, _).

implies(X, Y) :- X, \+Y, !, fail.
implies(_, _).

count([], 0).
count([_|T], N) :- count(T, N1), N is N1+1, !.

count_true([], 0).
count_true([X|T], N) :- X, count_true(T, N1), N is N1+1, !.
count_true([X|T], N) :- \+X, count_true(T, N), !.

set([]).
set([H|T]) :- member(H, T), !, fail.
set([_|T]) :- set(T).

remove(E, [E|T], T).
remove(E, [H|T], [H|S]) :- remove(E, T, S).
remove(_, _, _) :- !, fail.

set_eq([], []).
set_eq([H|T], S) :- remove(H, S, S1), set_eq(T, S1).

bool([]).
bool([H|T]) :- member(H, [true, fail]), bool(T).

/* TODO: return whether a solution was found */
solve(P) :- call(P, Sol), write(Sol), nl, fail.
solve(_).
