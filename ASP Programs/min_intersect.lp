

% Mimimize the number of overlapping objects

overlap(K,L) :- K>L, occupy(K,X,Y), occupy(L,X,Y).

:~ overlap(K,L). [1@2,K,L]
