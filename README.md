
nCDC-ASP SYSTEM:

nCDC-ASP is a framework developed by Izmirlioglu and Erdem (2018) for representing and reasoning about qualitative directional relations. nCDC-ASP uses Cardinal Directional Calculus (CDC) introduced by Skiadopulos and Koubarakis (2004,2005) to represent directional relations. This framework can solve consistency checking problems in nCDC, integrate commonsense knowledge into reasoning, handle incomplete or uncertain information, infer unknown relations between objects and find a suitable configuration of objects that fulfills the given inquiry.

Features of nCDC-ASP System:
- Reason with basic, disjunctive information
- Utilize commonsense knowledge by default CDC constraints
- Infer unknown cardinal directions between objects
- Alternative domains: Connected (Reg) or possibly disconnected (Reg*)

Original and improved formulation for deciding consistency and checking connectedness have been developed. Besides, reducing the necessary grid size has been performed for computational efficiency.




INPUT FORMAT (.lp file)

Regions are enumerated from 1 to |V|

Nine tiles are written according to below encoding:
sw: southwest  s:south  se:southeast  w:west  o:on   e:east  nw:northwest  n:north  ne:northeast


Basic CDC constraints:
relation(u,v,r)  atoms for basic CDC constraint
u: target object,  u: reference object,  r: tiles of CDC relation (according to above encoding)

Disjunctive CDC constraints:
disjrelation(u,v,i,r)  atoms for Disjunctive CDC constraint
u: target object,  u: reference object, i:index of disjunct, r: tiles of each basic relation (according to above encoding)

Default CDC constraints:
defaultrelation(u,v,r)  atoms for default CDC constraint
u: target object,  u: reference object,  r: tiles of CDC relation (according to above encoding)

Disjunctive default CDC constraints:
disjdefaultrelation(u,v,i,r)  atoms for Disjunctive default CDC constraint
u: target object,  u: reference object, i:index of disjunct, r: tiles of each basic relation (according to above encoding)




CONSISTENCY CHECKING:

1) First grid size is calculated for the problem instance:

./clingo grid_theorem1.lp  <input lp file>

OR

./clingo grid_theorem8.lp  <input lp file>      (for reduced grid size)

 
2) The user enters the grid size into "grid_enum.lp" file:  hsize and vsize atoms

3) To check consistency over possibly disconnected domain (Reg*):

./clingo grid_enum.lp original_consistency.lp  <input lp file>

OR

./clingo grid_enum.lp improved_consistency.lp  <input lp file>    (Improved ASP Program)


4) If there are disjunctive CDC constraint(s) in the network, add "disjunctive.lp"  to the command in item (3) above

5) In addition, if there are default CDC constraint(s) and/or disjunctive default CDC constraint(s) in the network, add "default.lp"  to the command

6) To check consistency over connected domain (Reg):
add "original_connected.lp"  to the relevant command above for checking connectedness
OR
add "improved_connected.lp"  to the relevant command above which is the improved program checking connectedness



INFERENCE:

To infer missing CDC relations in the network, replace "original_consistency.lp" or "improved_consistency.lp" with the "inference.lp" in the relevant command above for consistency checking. If the network is consistent, ASP output will include "inferrel(u,v,r)"  atoms to reveal the inferred CDC relations.




EXAMPLE:

See the example instance file under ASP Programs: example_instance.lp




EXAMPLE SCENARIOS:

We illustrate benefits of nCDC-ASP framework by some example scenarios. These examples show how consistency of given set of constraints can be determined, unknown relations can be inferred and a desired configuration of objects can be obtained using commonsense knowledge and reasoning under uncertainty. ASP encoding of the input network for three scenarios in Section 3.8 of the thesis are under the folder "/Example Scenarios".

scenario1.lp : Meeting scenario
scenario2.lp : Missing child scenario
scenario3.lp : Tabletop placement scenario

To find the solution of these example scenarios, run the following commands:

./clingo grid_enum.lp inference.lp improved_connected.lp scenario1.lp
./clingo grid_enum.lp inference.lp disjunctive.lp default.lp scenario2.lp
./clingo grid_enum.lp inference.lp improved_connected.lp disjunctive.lp default.lp scenario3.lp




EXPERIMENTS:

The benchmark problem instances we have created in Section 5.2  of the thesis for experimental evaluations are under the folder "/Experiments".
ASP encoding of the input for experimental evaluations  

nCDC-Handcrafted-Benchmarks.zip : ASP encoding of Handcrafted Benchmark Instances for nCDC
nCDC-Random-Benchmarks.zip : ASP encoding of Random Benchmark Instances for nCDC
LiuetalInstance-Code.zip : Instances and code for Comparison to Liu et al (2010)

