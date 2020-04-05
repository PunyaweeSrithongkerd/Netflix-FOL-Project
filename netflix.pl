:- use_module(facts,[]).

classic_movie(X) :-
    facts:movie(X),
    facts:release_year(X,Y),
    Y =< 2013.

kid_movies(X) :-
    facts:matage(X,Y),
    Y =< 13.

maturemovie(X):-
    facts:matage(X,Y),
    Y >= 18.

type_adult_movie(X,Y):-
    maturemovie(X),
    facts:type(X,Y).

type_kid_movie(X,Y):-
    kid_movies(X),
    facts:type(X,Y).

romcom(X):-
    (facts:movie(X),
    facts:type(X,Y),
    facts:type(X,Z),
    facts:is_romance(Y),
    facts:is_comedy(Z));
    (facts:series(X),
    facts:type(X,Y),
    facts:type(X,Z),
    facts:is_romance(Y),
    facts:is_comedy(Z)).

is_anime(X):-
    facts:type(X,Y),
    facts:is_from(X, Z),
    facts:is_animation(Y),
    facts:is_japan(Z).

inspire(X,Y):-
    facts:type(X, Z),
    facts:type(Y, Z),
    facts:movie(X),
    facts:movie(Y),
    facts:release_year(X, V),
    facts:release_year(Y, W),
    (V - W) > 10.

classic_romantic_movie(X):-
    facts:movie(X),
    classic_movie(X),
    facts:type(X,Y),
    facts:is_romance(Y).

similar(M1,M2):-
    (facts:movie(M1);facts:series(M1)),
    (facts:movie(M2);facts:series(M2)),
    facts:type(M1,X),
    facts:type(M2,X).





















