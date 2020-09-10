

% Spatial objects in the scenario  (Connected regions in 2D space)
% 1:Girl  2:coffee store   3:book store   4:cafeteria  5:boutique   6:father

region(1..6).


alltiles(sw).  alltiles(s).  alltiles(se).  alltiles(w).  alltiles(o).
alltiles(e).  alltiles(nw).  alltiles(n).  alltiles(ne).


% Define network of constraints in nCDC

relation(2,1,sw).  relation(2,1,s).  relation(2,1,se).

relation(3,2,w).  relation(3,2,nw).

relation(2,4,s).  relation(2,4,o).

relation(4,3,o).  relation(4,3,e).  relation(4,3,n).  relation(4,3,ne).

relation(5,3,sw).  relation(5,3,w).

relation(6,4,sw).

relation(6,5,nw).

