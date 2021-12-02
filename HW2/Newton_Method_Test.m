clear; clc; close all;
%% Functions define
syms x y y_1;
y = -x^3 - cos(x);
y_1 = diff(y,x);
global f f_1;
f = matlabFunction(y);
f_1 = matlabFunction(y_1);

%% Main
p0 = -1;
% Plst = [p0];

p1 = newton(p0);
p2 = newton(p1);
fprintf("p1: %f\np2: %f\n", p1, p2);

%% Test
syms x1 x2 x3;
f1 = 15 * x1 + x2 ^ 2 - 4 * x3 - 13; 
f2 = x1 ^ 2 + 10 * x2 - x3 - 11;
f3 = x2 ^ 3 - 25 * x3 + 22;
% fsolve
% f = [f1,f2,f3];
% func = matlabFunction(f, 'Var', {[x1,x2,x3]});
% fsolve(func, [0,0,0])
% solve
solution = solve([f1==0,f2==0,f3==0],[x1,x2,x3]);

%% My functions
% function y = f(x)
%     y = -x^3 - cos(x);
% end
% 
% function y = f_1(x)
%     y = -3 * x^2 + sin(x);
% end

function pn = newton(pn_1)
    global f f_1;
    pn = pn_1 - f(pn_1) / f_1(pn_1);
end