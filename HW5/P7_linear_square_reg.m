clc; clear;
%% y = a1 * x + a0
X = [0, 2, 4, 5];
Y = [6, 8, 14, 20];

a0 = (sum(X.^2) * sum(Y) - sum(X.*Y) * sum(X)) / (size(X,2)*sum(X.^2) - sum(X)^2);
a1 = (size(X,2) * sum(X.*Y) - sum(X) * sum(Y)) / (size(X,2)*sum(X.^2) - sum(X)^2);
%% Visualize
scatter(X,Y);hold on;
x = linspace(X(1)-1, X(end)+1, 1000);
y = a1 .* x + a0;
plot(x, y, "color", "g");

%% Calculate error E
Y_hat = a1 .* X + a0;
E = sum((Y_hat - Y) .^ 2);
fprintf("Error = %4f\n", E);