mortal(X) :- person(X).

person(socrates).
person(plato).
person(aristotle).

mortal_report:-
  write('Known mortals are:'),nl,
  mortal(X),
  write(X),nl,
  fail.

harder(a,1).
harder(c,X).

location(apple, kitchen).
location(mixer, kitchen).
location('ice cream', kitchen).
location(rice, pantry).

edible(apple).
edible('ice cream').
edible(rice).

list_things(Place) :-
  location(X, Place),
  tab(2),
  write(X),
  nl,
  fail.
list_things(AnyPlace).

not(X) :- \+ X.
