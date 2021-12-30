clc; clear;
%% Main
% a
h = 0.1;
left = 1;
right = 2;
w0 = 0.5;
% b
% h = 0.2;
% left = 1;
% right = 3;
% w0 = 0;
lastw = w0; % init
for t = left:h:right-h
    w = lastw + h * (f(t,lastw));
    disp(w);
    lastw = w;
end
fprintf("Final approximation is: y(%d) = %f\n", right, lastw);

%% Function
function dy = f(t, y)
%     dy = y - t^2 + 1; % for debugging
%     dy = y/t - (y/t)^2; % a
    dy = 1 + y/t + (y/t)^2; % b
end