% Allergy Diagnosis

% Ali has sneezing
sneezing(ali).

% Ali has itching
itching(ali).

% Ali has allergy
allergy(ali).

patient(ali).git stust
% Some patient has itching
patient(a).
itching(a).

% Some patient does not have fever
patient(b).
no_fever(b).


% Every patient with allergy needs medicine
medicine(X) :-
    patient(X),
    allergy(X).

% Every patient with sneezing has allergy symptoms
allergy_symptom(X) :-
    patient(X),
    sneezing(X).

% If patient has allergy and needs medicine,
% then patient visits doctor
visits_doctor(X) :-
    patient(X),
    allergy(X),
    medicine(X).