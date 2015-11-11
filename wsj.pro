:- include('lib.pro').

person_type(innocent).
person_type(liar).
person_type(guilty).

claim(PersonType, Claim) :- PersonType = innocent, Claim, !.
claim(PersonType, Claim) :- PersonType \= innocent, \+Claim, !.

temp_assert(Assert) :- assertz(Assert).
temp_assert(Assert) :- retract(Assert), fail.

temp_rule(Rule, 

claim2(Sol, Pos, Claim) :-
  member([Pos, _, PersonType], Sol),
  eq(PersonType = innocent, Claim).

/* Solves the logic problem in week 8 */
week8(Sol) :-
  Sol = [[left, LName, LType],
         [mid, MName, MType],
         [right, RName, RType]],
  set_eq([LName, MName, RName], [chris, dana, elliot]),
  subset([LType, MType, RType], [innocent, liar, guilty]),
  count_eq(guilty, [LType, MType, RType], NumGuilty), NumGuilty =< 1,
  count_eq(liar, [LType, MType, RType], NumLiars), NumLiars + NumGuilty >= 1,
  /* Would be nice to write simply
       claim(left, (is([_, chris, guilty]), is([mid, _, innocent]))) */
  claim2(Sol, left, (member([_, chris, guilty], Sol), MType = innocent)),
  claim2(Sol, mid, (member([_, dana, liar], Sol); RName = elliot)),
  claim2(Sol, right, (LType = innocent; MType = innocent)),
  claim2(Sol, mid, member([_, elliot, guilty], Sol)),
  claim2(Sol, right, LName = elliot).

/* Solves the logic problem in week 1 */
week1(Sol) :-
  Sol = [a:A, b:B, c:C],
  set_eq([A, B, C], [innocent, liar, guilty]),
  claim(A, A = guilty),
  claim(B, A = guilty).
