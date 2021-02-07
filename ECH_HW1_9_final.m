% HW1 Problem 9
% Monica Torralba ECH 267

% eq1 = x1_dot
% eq2 = x2_dot
% x(1) = x1
% x(2) = x2

% Set Up
prob = ('This is Part (3)');
disp(prob)

% Plot x coordinates
[X1,X2] = meshgrid(-1:0.5:1);
xs = arrayfun(@(x,y) {odefunx([],[x,y])}, X1, X2);
x1s = cellfun(@(x) x(1), xs);
x2s = cellfun(@(x) x(2), xs);
h = streamslice(x1s, x2s, 'filled');
set(h,'Color','r');
title('P9-3')
xlabel('x_1')
ylabel('x_2')
axis tight equal;

% Input equations
function dxdt = odefunx(t,x)
    eq1 = x(1) - x(1)*x(2);
    eq2 = 2*x(1)^2 - x(2);
    dxdt = [eq1, eq2];
end