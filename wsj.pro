:- include('lib.pro').

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
week1(Sol) :-
  Sol = [a:A, b:B, c:C],
  set_eq([A, B, C], [innocent, liar, stole]),
  eq(A = innocent, A = stole),
  eq(B = innocent, A = stole).
