

% The original ASP subprogram for checking connectedness


% Adjacency of occupied cells

adjacent(K,X,Y,X,Y+1) :- occupy(K,X,Y), occupy(K,X,Y+1).
adjacent(K,X,Y,X,Y-1) :- occupy(K,X,Y), occupy(K,X,Y-1).
adjacent(K,X,Y,X+1,Y) :- occupy(K,X,Y), occupy(K,X+1,Y).
adjacent(K,X,Y,X-1,Y) :- occupy(K,X,Y), occupy(K,X-1,Y).


% Recursive definition of transitive closure of adjacency

connected(K,X,Y,X,Y) :- occupy(K,X,Y).

connected(K,X1,Y1,X3,Y3) :- connected(K,X1,Y1,X2,Y2), adjacent(K,X2,Y2,X3,Y3).


% Any two cells of a region must be connected to each other

:- not connected(K,X1,Y1,X2,Y2), occupy(K,X1,Y1), occupy(K,X2,Y2), region(K).
