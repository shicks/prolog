:- include('lib.pro').

week1(Sol) :-
  Sol = [[ALiar, AStole], [BLiar, BStole], [CLiar, CStole]],
  bool([ALiar, AStole, BLiar, BStole, CLiar, CStole]),
  implies(AStole, ALiar),
  implies(BStole, BLiar),
  implies(CStole, CLiar),
  count_true([ALiar, BLiar, CLiar], 2),
  count_true([AStole, BStole, CStole], 1),
  ne(ALiar, AStole),
  ne(BLiar, AStole).
