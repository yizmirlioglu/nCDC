

% Spatial objects in the scenario  (Connected regions in 2D space)
% 1:printer  2:folder  3:monitor  4:keyboard  5:notebook  6:mouse
% 7:pencil   8:eraser  9:fan   10:book   11:cup


region(1..11).


alltiles(sw).  alltiles(s).  alltiles(se).  alltiles(w).  alltiles(o).
alltiles(e).  alltiles(nw).  alltiles(n).  alltiles(ne).


% Define network of constraints in nCDC

relation(1,5,nw).   relation(1,5,n).   relation(1,5,ne).
relation(10,5,e).
relation(4,10,e).
relation(1,3,sw).   relation(1,3,w).   relation(1,3,nw).

disjrelation(9,2,1,n).
disjrelation(9,2,2,nw).   disjrelation(9,2,2,n).
disjrelation(9,2,3,n).  disjrelation(9,2,3,ne).

relation(6,9,sw).

disjrelation(2,3,1,se).   disjrelation(2,3,1,e).
disjrelation(2,3,2,se).

relation(11,2,s).
relation(11,6,e).   relation(11,6,se).


% Default Relations

defaultrelation(3,4,nw).   defaultrelation(3,4,n).   defaultrelation(3,4,ne).
defaultrelation(6,4,e).
defaultrelation(7,5,o).
defaultrelation(8,5,o).

disjdefaultrelation(8,7,1,w).
disjdefaultrelation(8,7,2,e).


