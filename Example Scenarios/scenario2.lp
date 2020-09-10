

% Spatial objects in the scenario  (Possibly disconnected regions in 2D space)
% 1: parents   2:child   3:food    4:bank   5:pool   6:pet store  7:movie   8:bedesten  9:grocery store  10:truck

region(1..10).


alltiles(sw).  alltiles(s).  alltiles(se).  alltiles(w).  alltiles(o).
alltiles(e).  alltiles(nw).  alltiles(n).  alltiles(ne).


% Define network of constraints in nCDC

relation(1,3,o).
relation(3,8,nw).  relation(3,8,n).  relation(3,8,ne).
relation(1,8,n).
relation(3,6,nw).  relation(3,6,ne).

relation(7,8,s).  relation(7,8,se).

relation(8,5,w).  relation(8,5,nw).
relation(8,6,sw).  relation(8,6,w).
relation(4,7,n).  relation(4,7,ne).
relation(5,4,sw).  relation(5,4,nw).

relation(5,6,sw).

relation(5,7,n).

relation(9,6,se).   relation(9,6,e).
relation(9,4,ne).

disjrelation(2,5,1,s).
disjrelation(2,5,2,w).

defaultrelation(2,10,o).

disjdefaultrelation(10,7,1,e).
disjdefaultrelation(10,7,2,n).
disjdefaultrelation(10,7,3,ne).

disjdefaultrelation(10,5,1,s).
disjdefaultrelation(10,5,2,se).

