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

/* Solves the logic problem in week 8 */
week8(Sol) :-
  Sol = [[LName, LLiar, LStole],
         [MName, MLiar, MStole],
         [RName, RLiar, RStole]],
  bool([LLiar, LStole, MLiar, MStole, RLiar, RStole]),
  member([chris, CLiar, CStole], Sol),
  member([dana, DLiar, DStole], Sol),
  member([elliot, ELiar, EStole], Sol),
  count_true([LStole, MStole, RStole], NumStole),
  NumStole =< 1,
  implies(LStole, LLiar),
  implies(MStole, MLiar),
  implies(RStole, RLiar),
  ne(LLiar, (CStole, \+MLiar)),
  ne(MLiar, ((DLiar, \+DStole); RName = elliot)),
  ne(RLiar, (\+LLiar; \+MLiar)),
  ne(MLiar, EStole),
  ne(RLiar, LName = elliot).

/* Solves the logic problem in week 1 */
week1_prev(Sol) :-
  Sol = [[ALiar, AStole], [BLiar, BStole], [CLiar, CStole]],
  bool([ALiar, AStole, BLiar, BStole, CLiar, CStole]),
  implies(AStole, ALiar),
  implies(BStole, BLiar),
  implies(CStole, CLiar),
  count_true([ALiar, BLiar, CLiar], 2),
  count_true([AStole, BStole, CStole], 1),
  ne(ALiar, AStole),
  ne(BLiar, AStole).

week1(Sol) :-
  Sol = [a:A, b:B, c:C],
  set_eq([A, B, C], [innocent, liar, stole]),
  eq(A = innocent, A = stole),
  eq(B = innocent, A = stole).

/* TODO: return whether a solution was found */
solve(P) :- call(P, Sol), write(Sol), nl, fail.
solve(_).
