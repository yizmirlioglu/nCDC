
% The first ASP program for checking consistency of basic CDC networks

xcoord(0..M-1) :- hsize(M).
ycoord(0..N-1) :- vsize(N).


% Below we find, directional relation is specified for which pair of regions

existrelation(K,L) :- relation(K,L,J).

reference(L) :- existrelation(K,L).
target(K) :- existrelation(K,L).



% Find bounds of regions in x and y dimensions (Minimum Bounding Rectangle)

infx(K,M) :- M=#min{X,Y: occupy(K,X,Y)}, region(K).
supx(K,M) :- M=#max{X,Y: occupy(K,X,Y)}, region(K).
infy(K,M) :- M=#min{Y,X: occupy(K,X,Y)}, region(K).
supy(K,M) :- M=#max{Y,X: occupy(K,X,Y)}, region(K).



% Generate cells for all regions

1{occupy(K,X,Y): xcoord(X), ycoord(Y)} :- region(K).



%  Check condition (C1): whether generated regions have the cells required by Directional relations 

:- relation(K,L,n), {occupy(K,X,Y): Y>Y2, X<=X2, X>=X1}0, existrelation(K,L), supy(L,Y2), supx(L,X2), infx(L,X1), region(K), region(L).

:- relation(K,L,s), {occupy(K,X,Y): Y<Y1, X<=X2, X>=X1}0, existrelation(K,L), infy(L,Y1), supx(L,X2), infx(L,X1), region(K), region(L).

:- relation(K,L,e), {occupy(K,X,Y): X>X2, Y<=Y2, Y>=Y1}0, existrelation(K,L), supx(L,X2), infy(L,Y1), supy(L,Y2), region(K), region(L).

:- relation(K,L,w), {occupy(K,X,Y): X<X1, Y<=Y2, Y>=Y1}0, existrelation(K,L), infx(L,X1), infy(L,Y1), supy(L,Y2), region(K), region(L).

:- relation(K,L,nw), {occupy(K,X,Y): X<X1, Y>Y2}0, existrelation(K,L), infx(L,X1), supy(L,Y2), region(K), region(L).

:- relation(K,L,sw), {occupy(K,X,Y): X<X1, Y<Y1}0, existrelation(K,L), infx(L,X1), infy(L,Y1), region(K), region(L).

:- relation(K,L,ne), {occupy(K,X,Y): X>X2, Y>Y2}0, existrelation(K,L), supx(L,X2), supy(L,Y2), region(K), region(L).

:- relation(K,L,se), {occupy(K,X,Y): X>X2, Y<Y1}0, existrelation(K,L), supx(L,X2), infy(L,Y1), region(K), region(L).

:- relation(K,L,o), {occupy(K,X,Y): Y<=Y2, Y>=Y1, X<=X2, X>=X1}0, existrelation(K,L), infx(L,X1), supx(L,X2), infy(L,Y1), supy(L,Y2), region(K), region(L).



% Check condition (C2): Eliminate invalid cells

:- not relation(K,L,n), 1{occupy(K,X,Y): Y>Y2, X<=X2, X>=X1}, existrelation(K,L), supy(L,Y2), supx(L,X2), infx(L,X1), region(K), region(L).

:- not relation(K,L,s), 1{occupy(K,X,Y): Y<Y1, X<=X2, X>=X1}, existrelation(K,L), infy(L,Y1), supx(L,X2), infx(L,X1), region(K), region(L).

:- not relation(K,L,e), 1{occupy(K,X,Y): X>X2, Y<=Y2, Y>=Y1}, existrelation(K,L), supx(L,X2), infy(L,Y1), supy(L,Y2), region(K), region(L).

:- not relation(K,L,w), 1{occupy(K,X,Y): X<X1, Y<=Y2, Y>=Y1}, existrelation(K,L), infx(L,X1), infy(L,Y1), supy(L,Y2), region(K), region(L).

:- not relation(K,L,nw), 1{occupy(K,X,Y): X<X1, Y>Y2}, existrelation(K,L), infx(L,X1), supy(L,Y2), region(K), region(L).

:- not relation(K,L,sw), 1{occupy(K,X,Y): X<X1, Y<Y1}, existrelation(K,L), infx(L,X1), infy(L,Y1), region(K), region(L).

:- not relation(K,L,ne), 1{occupy(K,X,Y): X>X2, Y>Y2}, existrelation(K,L), supx(L,X2), supy(L,Y2), region(K), region(L).

:- not relation(K,L,se), 1{occupy(K,X,Y): X>X2, Y<Y1}, existrelation(K,L), supx(L,X2), infy(L,Y1), region(K), region(L).

:- not relation(K,L,o), 1{occupy(K,X,Y): Y<=Y2, Y>=Y1, X<=X2, X>=X1}, existrelation(K,L), infx(L,X1), supx(L,X2), infy(L,Y1), supy(L,Y2), region(K), region(L).



#show occupy/3.
