clear; clc; close all;
%% Main process
Bisection(0, 1, @func1);
Bisection(0.2, 0.3, @func2);
Bisection(1.2, 1.3, @func2);

%% Bisection
function Bisection(left, right, f)
    i = 1;
    MaxIteration = 100;
    Tolerance = 10 ^ -5;
    xList = [];
    yList = [];
    currX = (left + right) / 2;
    currY = f(currX);

    for i = 1 : MaxIteration
        fprintf("[No.%d Iteration]: f(%f) = %f\n", i, currX, currY);
        xList(i) = currX;
        yList(i) = currY;
        
        if abs(currY) < Tolerance
            fprintf("It costs me %d iterations to find the root\n", i);
            break;
        end
        
        if currY / f(left) > 0
            left = currX;
        else
            right = currX;
        end
        
        currX = (left + right) / 2;
        currY = f(currX);

    end
    
    fprintf("Final root is %f, and f(%f) = %f\n", currX, currX, currY);
    figure();
    subplot(1,2,1);
    plot(xList);title("midpoints of X");xlabel("Iteration");ylabel("X");
    subplot(1,2,2);
    plot(yList);title("midpoints of Y");xlabel("Iteration");ylabel("Y");
end
    
%% Mathmatic function
function y = func1(x)
    y = exp(x) - x ^ 2 + 3 * x - 2;
end

function y = func2(x)
    y = x * cos(x) - 2 * x ^ 2 + 3 * x - 1;
end
