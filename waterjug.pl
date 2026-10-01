% Water Jug Problem
% Jug A = 4 liters
% Jug B = 3 liters
% Goal = 2 liters in either jug

solve :-
    dfs([(0,0)], [(0,0)]).

dfs([(A,B)|_], _) :-
    (A =:= 2 ; B =:= 2),
    format('Goal reached: (~w, ~w)~n', [A,B]).

dfs([(A,B)|Rest], Visited) :-
    move(A, B, NA, NB, Action),
    \+ member((NA,NB), Visited),
    format('(~w,~w) -> ~w -> (~w,~w)~n',
           [A,B,Action,NA,NB]),
    dfs([(NA,NB)|Rest], [(NA,NB)|Visited]).

% Fill Jug A
move(_, B, 4, B, 'Fill A').

% Fill Jug B
move(A, _, A, 3, 'Fill B').

% Empty Jug A
move(_, B, 0, B, 'Empty A').

% Empty Jug B
move(A, _, A, 0, 'Empty B').

% Pour A into B
move(A, B, NA, NB, 'Pour A -> B') :-
    Transfer is min(A, 3-B),
    Transfer > 0,
    NA is A-Transfer,
    NB is B+Transfer.

% Pour B into A
move(A, B, NA, NB, 'Pour B -> A') :-
    Transfer is min(B, 4-A),
    Transfer > 0,
    NA is A+Transfer,
    NB is B-Transfer.