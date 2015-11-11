person(chris).
person(dana).
person(elliot).

eq(X, Y) :- X, \+ Y, !, fail.
eq(X, Y) :- \+ X, Y, !, fail.
eq(_, _).

or(X, _) :- X.
or(_, Y) :- Y.

/* op(35, xfx, eq). */
/* op(35, xfx, or). */

backtracking_assert(X) :- asserta(X).
backtracking_assert(X) :- retract(X), fail.

/* liar(Person) :- \+ honest(Person)
says(Person, Claim) :- eq(honest(Person), Claim) */
/* honest(Person) :- \+  */

/* person(Name, Position, Liar, StoleTrophy). */

check :-
  says(person(_, _, Liar, _), Claim),
  eq(Liar, Claim), !, fail.

/*
stole_trophy(person(_, _, _, X)) :- eq(X, true).
liar(person(_, _, X, _)) :- eq(X, true).

named(Name, Person) := Person = person(Name, _, _, _).
*/

/*
left(Name)
middle(Name)
right(Name)
liar(Name)
stole(Name)
*/



person(Name) :-
  assertz(

person(X, Y, _, _) :- person(

says(person(_, left, _, _), (
      person(chris, _, true),
      middle(M), M = person(_, fail, fail))).
says(person(_, middle, _, _), (
      person(dana, _, true, fail); person(elliot, right, _, _))).
says(person(_, right, _, _), (
      person(_, left, fail, fail); person(_, middle, fail, fail))).
says(person(_, middle, _, _), person(elliot, _, true, true)).
says(person(_, right, _, _), person(elliot, left, _, _)).

left(X), says(X, (\+ honest(

left(X), middle(Y), right(Z), stole_trophy(W), liar(V).


/* left(X), same(innocent(X),  */
