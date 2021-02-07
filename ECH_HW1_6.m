% HW1 Problem 6
% Monica Torralba ECH 267

% eq1 = x1_dot
% eq2 = x2_dot
% x = x1
% y = x2

% Set Up
syms x y;
prob = ('This is Part (6)');
disp(prob)
eq1 = (x-y)*((x^2)+(y^2)-1);
eq2 = (x+y)*((x^2)+(y^2)-1);
eqns = [eq1 == 0,eq2 == 0];

% Solve Equilibrium Points
[P] = vpasolve(eqns);
X = P.x
Y = P.y
EQP = [X,Y]

% Compute Jacobian Matrix
J = jacobian([eq1,eq2],[x,y]);

% Evaluate Jacobian for each equilibrium point
for i = 1:size(EQP,1);
    i
    point = EQP(i,:)
    j_eval = subs(J,{x,y},{point})
    lambda = eig(j_eval)
end

