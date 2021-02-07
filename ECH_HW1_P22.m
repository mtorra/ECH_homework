% HW 1Problem 22

A = [-2 0 0;
    2 -1 0;
    0 1 0];

B = [0 0 0; 
    0 0 0; 
    0 0 0];

C = [1 0 0];

D = [0 0 0];

SYS = ss(A, B, C, D);

x0 = [1 0 0];

[Y,T,X] = initial(SYS, x0);

X(:,1)
size(X,1)

t = 1:1:196;
plot(t, X(:,1))
hold on
plot(t, X(:,2))
hold on
plot(t, X(:,3))
hold off

