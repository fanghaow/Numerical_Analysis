clear; clc; close all;
%%
A = [1 2 3;
    2 3 4;
    3 4 6];
b = [1;-1;2];
x = [0;-7;5];
x_appro = [-0.2;-7.5;5.4]; % a
% x_appro = [-0.33;-7.9;5.8]; % b

%%
s1 = inf_norm(x, x_appro);
s2 = inf_norm(A * x_appro, b); 
fprintf("Solution infinity norm error: %f\n", s1);
fprintf("Equation infinity norm error: %f\n", s2);

%%
function res = inf_norm(v1, v2)
    res = max(abs(v1 - v2));
end