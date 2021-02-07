% HW1 Problem 7
% Monica Torralba ECH 267

% Set Up
A = [0 -1;1 2];

% Eigenvectors in V & Eigenvalues in D
[V,D] = eig(A)
[V,J] = jordan(A)

% Plot x coordinates
tiledlayout(1,2)
nexttile
[X1,X2] = meshgrid(-5:0.5:5);
xs = arrayfun(@(x,y) {odefunx([],[x,y])}, X1, X2);
x1s = cellfun(@(x) x(1), xs);
x2s = cellfun(@(x) x(2), xs);
h = streamslice(x1s, x2s, 'filled');
set(h,'Color','r');
xlabel('x_1')
ylabel('x_2')
axis tight equal;

% Plot z coordinates
nexttile
[Z1,Z2] = meshgrid(-5:0.5:5);
zs = arrayfun(@(x,y) {odefunz([],[x,y])}, X1, X2);
z1s = cellfun(@(x) x(1), zs);
z2s = cellfun(@(x) x(2), zs);
streamslice(z1s, z2s, 'filled')
xlabel('z_1')
ylabel('z_2')
axis tight equal;

% Compute Z1 & Z2
function dzdt = odefunz(t,z)
    % complex eigenvalues: from jordan matrix (a + Bi): [a, -B, B, a]
%     Jr = [1 -1.4142; 1.4142 1];
%     dzdt(1) = Jr(1,1)*z(1)+Jr(1,2)*z(2);
%     dzdt(2) = Jr(2,1)*z(1)+Jr(2,2)*z(2);
%     real eigenvalues:
    D = [1 0; 0 1];
    dzdt(1) = D(1,1)*z(1)+D(1,2)*z(2);
    dzdt(2) = D(2,1)*z(1)+D(2,2)*z(2);
end

% Compute X1 & X2
function dxdt = odefunx(t,x)
    A = [0 -1;1 2];
    dxdt(1) = A(1,1)*x(1)+A(1,2)*x(2);
    dxdt(2) = A(2,1)*x(1)+A(2,2)*x(2);
end



