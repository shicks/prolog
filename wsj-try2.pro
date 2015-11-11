eq(X, Y) :- X, \+ Y, !, fail.
eq(X, Y) :- \+ X, Y, !, fail.
eq(_, _).

check :-
  says(Name, Claim),
  eq(liar(Name), Claim), !, fail.
check.

:- dynamic(stole/1).

stole(_) :- fail.
liar(P) :- stole(P).

claim(X) :- asserta(X).
claim(X) :- retract(X), fail.
