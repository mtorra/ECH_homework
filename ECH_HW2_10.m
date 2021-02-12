clear all
clc
% HW1 Problem 10
% Monica Torralba ECH 267

% Set Up
prob = ('This is #10');
disp(prob)

% % Plot x coordinates
[X,Y] = meshgrid(-3:0.1:3);
xs = arrayfun(@(x,y) {odefunx([],[x,y])}, X, Y);
x1s = cellfun(@(x) x(1), xs);
x2s = cellfun(@(x) x(2), xs);
streamslice(x1s, x2s, 'filled');
hold on
Z = (3/4)*X.^2 - (1/12)*X.^4 + (1/2)*X.*Y + (1/2)*Y.^2;
v1 = [9/8,9/8];
v2 = [1,1];
v3 = [10/8,10/8];
[M,c] = contour(Z,'r');
c.LineWidth = 0.5;
hold on 
[B,d] = contour(Z,v1,'k');
d.LineWidth = 2;
hold on
[C,e] = contour(Z,v2,'c');
e.LineWidth = 2;
hold on
[D,f] = contour(Z,v3,'g');
f.LineWidth = 2;

title('P10')
xlabel('x_1')
ylabel('x_2')
xticks([0 10 20 30 40 50 60])
xticklabels({'-3','-2','-1','0','1','2','3'})
yticks([0 10 20 30 40 50 60])
yticklabels({'-3','-2','-1','0','1','2','3'})
axis tight

% Input equations
function dxdt = odefunx(t,x)
    eq1 = x(2);
    eq2 = -x(1) + (1/3)*(x(1))^3 - x(2); 
    dxdt = [eq1, eq2];
end