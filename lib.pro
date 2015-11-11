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
count([_|T], N) :- count(T, N1), N is N1+1.

is_true(X) :- eq(true, X).

/* TODO - these are broken! count_true([X], 1) doesn't return X=true. */

/*
count_if(_, [], 0).
count_if(P, [H|T], N) :- call(P, H), count_if(P, T, N1), N is N1+1.
count_if(P, [H|T], N) :- \+call(P, H), count_if(P, T, N).

count_true([], 0).
count_true([H|T], N) :- H, count_true(T, N1), N is N1+1.
count_true([H|T], N) :- \+H, count_true(T, N).

count_eq(_, [], 0).
count_eq(X, [H|T], N) :- H = X, count_eq(X, T, N1), N is N1+1.
count_eq(X, [H|T], N) :- H \= X, count_eq(X, T, N).
*/

count_true([], 0) :- !.
count_true([H|T], N) :- H, count_true(T, N1), N is N1+1.
count_true([H|T], N) :- \+H, count_true(T, N).

count_eq(_, [], 0) :- !.
count_eq(X, [X|T], N) :- count_eq(X, T, N2), N is N2 + 1.
count_eq(X, [Y|T], N) :- X \= Y, count_eq(X, T, N).

set([]).
set([H|T]) :- member(H, T), !, fail.
set([_|T]) :- set(T).

remove(E, [E|T], T).
remove(E, [H|T], [H|S]) :- remove(E, T, S).
remove(_, _, _) :- !, fail.

set_eq([], []).
set_eq([H|T], S) :- remove(H, S, S1), set_eq(T, S1).

subset([], _).
subset([H|T], S) :- member(H, S), subset(T, S).

bool([]).
bool([H|T]) :- member(H, [true, fail]), bool(T).

/* TODO: return whether a solution was found */
solve(P) :- call(P, Sol), write(Sol), nl, fail.
solve(_).
