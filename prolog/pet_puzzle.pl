% Define the three people and their pets
person(alice).
person(bob).
person(carol).

pet(cat).
pet(dog).
pet(fish).

% Define the ownership relationship
owns(alice, Pet) :- pet(Pet), Pet \= cat.
owns(bob, Pet) :- pet(Pet), Pet \= fish.
owns(carol, dog).

% A rule to solve the puzzle
solve :-
    owns(alice, AlicePet),
    owns(bob, BobPet),
    owns(carol, CarolPet),
    
    % Ensure each pet is unique
    AlicePet \= BobPet,
    BobPet \= CarolPet,
    CarolPet \= AlicePet,
    
    % Output results
    format('Alice owns the ~w.~n', [AlicePet]),
    format('Bob owns the ~w.~n', [BobPet]),
    format('Carol owns the ~w.~n', [CarolPet]).
