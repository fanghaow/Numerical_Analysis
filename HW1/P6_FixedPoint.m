clear; clc; close all;
%% Initialization
global formula; % Used to choose different type of g(x)

%% Main process
formula = 1;
FixedPoint(1, @func1);
formula = 2;
FixedPoint(1, @func1);

formula = 1;
FixedPoint(1, @func2);
formula = 2;
FixedPoint(1, @func2);
formula = 3;
FixedPoint(1, @func2);

%% Fixed Point
function FixedPoint(p0, g)
    i = 1;
    MaxIteration = 100;
    Tolerance = 10 ^ -5;
    pList = [];
    newP = g(p0);

    for i = 1 : MaxIteration
        pList(i) = p0;
        fprintf("[No.%d Iteration]: pn = %f\n", i, newP);
        if abs(newP - p0) < Tolerance
            pList(i) = newP;
            fprintf("It costs me %d iterations to find the root\n", i);
            break;
        end
        
        p0 = newP;
        newP = g(p0);
        
    end

    fprintf("Final root is %f, and g(%f) = %f\n", newP, p0, newP);
    figure();
    plot(pList);title("midpoints of pn");xlabel("Iteration");ylabel("pn");

end
    
%% Mathmatic function
function y = func1(x) % 2 * sin(pi * x) + x; 
    global formula;
    if formula == 1
        y = 1 + asin(x / 2) / pi;% 1.206
    elseif formula == 2
        y = 2 + asin(-x / 2) / pi; % 1.681
    end
end

function y = func2(x) % 3 * x ^ 2 - exp(x);
    global formula;
    if formula == 1
        y = -(exp(x) / 3) ^ 0.5; % -0.45
    elseif formula == 2
        y = exp(x) / 3 / x; % 0.91
    elseif formula == 3 
        y = log(3 * x ^ 2); % 3.73
    end
end