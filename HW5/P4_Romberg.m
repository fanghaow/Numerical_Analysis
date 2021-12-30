clc; clear;
%%
H = [2, 1.5, 3, exp(1)]; % interval length
X = [-1, -0.75, 1, exp(1)]; % interval left
h = H(4);
x = X(4);
R11 = h/2 * (f(x) + f(x+h));
R21 = h/4 * (f(x) + 2*f(x+h/2) + f(x+h));
R31 = h/8 * (f(x) + 2*(f(x+h/4)+f(x+h/2)+f(x+3*h/4)) + f(x+h));

R22 = R21 + 1/3*(R21 - R11);
R32 = R31 + 1/3*(R31 - R21);

R33 = R32 + 1/15*(R32 - R22);

%% Functions
function y = f(x)
%     y = cos(x) ^ 2; % a
%     y = x * log(x+1); % b
%     y = sin(x)^2 - 2*x*sin(x) + 1; % c
    y = 1 / (x*log(x)); % d
end