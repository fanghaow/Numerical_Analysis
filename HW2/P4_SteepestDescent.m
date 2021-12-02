clear; clc; close all;
%% Functions define
global f dg;
syms x1 x2 x3; 
% a.
f1 = 15 * x1 + x2 ^ 2 - 4 * x3 - 13; 
f2 = x1 ^ 2 + 10 * x2 - x3 - 11;
f3 = x2 ^ 3 - 25 * x3 + 22;
% b.
% f1 = 10 * x1 - 2 * x2 ^ 2 + x2 - 2 * x3 - 5;
% f2 = 8 * x2 ^ 2 + 4 * x3 ^ 2  - 9;
% f3 = 8 * x2 * x3 + 4;
g = f1 ^ 2 + f2 ^ 2 + f3 ^ 2;
DELTA_g = [diff(g,x1); diff(g,x2); diff(g,x3)];
f = matlabFunction([f1;f2;f3]);
dg = matlabFunction(DELTA_g);

%% Main
p0 = [1;1;1]; % (i) 1.0380    1.0803    0.9303
% p0 = [-8.44;-7.94;-19.1438]; % (i) -8.4414    -7.9401    -19.1438
% p0 = [1;0;-1]; % (ii) 0.2102    0.3598   -1.4070
% p0 = [1;0;1]; % (ii) 0.8407   -0.3583    1.4079
% p0 = [0;-1;1]; % (ii) 0.8998   -0.9967    0.5079
% p0 = [0;1;-1]; % (ii) 0.4962    0.9967   -0.5076
MaxIteration = 100;
Tolerance = 0.05;
oldP = p0;
for i = 1:MaxIteration
    fprintf("[No.%d Iteration]: F(", i); disp(oldP'); fprintf(") = ");
    disp(F(oldP)');
    if max(abs(F(oldP))) < Tolerance % using infinity norm to stop!
        fprintf("It costs me %d iterations to find the root:\n", i);
        disp(oldP');
        break;
    end
    newP = Descent(oldP);
    oldP = newP;
end

%% My functions
function Y = F(X)
    global f;
    Y = f(X(1),X(2),X(3));
end
function M = DG(X)
    global dg;
    M = dg(X(1),X(2),X(3));
end
function Xk = Descent(Xk_1)
    alpha = 0.001;
    Xk = Xk_1 - alpha * DG(Xk_1);
end