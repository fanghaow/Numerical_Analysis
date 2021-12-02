clear; clc; close all;
%% Functions define
global f jacob;
syms x1 x2 x3;
% a.
f1 = x1 ^ 2 + x2 - 37; % x(2) = 4.3509   18.4912  -19.8421
f2 = x1 - x2 ^ 2 -5;
f3 = x1 + x2 + x3 - 3;
% b.
% f1 = 3 * x1 - cos(x2 * x3) - 0.5; % x(2) = 0.5002    0.2508   -0.5174
% f2 = 4 * x1 ^ 2 - 625 * x2 ^ 2 + 2 * x2  - 1;
% f3 = exp(-x1 * x2) + 20 * x3 + (10 * pi - 3) / 3;
jacobian = [diff(f1,x1), diff(f1,x2), diff(f1,x3);
    diff(f2,x1), diff(f2,x2), diff(f2,x3);
    diff(f3,x1), diff(f3,x2), diff(f3,x3)];
f = matlabFunction([f1;f2;f3]);
jacob = matlabFunction(jacobian);

%% Main
p0 = [0;0;0];
MaxIteration = 100;
Tolerance = 10^-10;
oldP = p0;
for i = 1:MaxIteration
    fprintf("[No.%d Iteration]: F(", i); disp(oldP'); fprintf(") = ");
    disp(F(oldP)');
    if max(abs(F(oldP))) < Tolerance % using infinity norm to stop!
        fprintf("It costs me %d iterations to find the root:\n", i);
        disp(oldP');
        break;
    end
    newP = NewTon(oldP);
    oldP = newP;
end

%% My functions
function Y = F(X)
    global f;
    Y = f(X(1),X(2),X(3));
end
function M = Jacob(X)
    global jacob;
    M = jacob(X(1),X(2)); % (i)
%     M = jacob(X(1),X(2),X(3)); % (ii)
end
function Xk = NewTon(Xk_1)
    Xk = Xk_1 - pinv(Jacob(Xk_1)) * F(Xk_1);
end