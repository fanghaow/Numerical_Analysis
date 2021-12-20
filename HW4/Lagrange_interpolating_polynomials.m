clc; clear; close all;
%% Main
main();
%% My functions
function main()
    % TODO, choose the Prob;em for solving
    problem = 1; % a
    % problem = 2; % b
    if (problem == 1)
        % a.
        x = [0, 0.3, 0.6];
        fx = exp(2. * x) .* cos(3 .* x);
    else
        % b.
        x = [2.0, 2.4, 2.6];
        fx = sin(log(x));
    end
    
    symf = lagrange_interpolte(x, fx);
    fprintf("Polynomials :\n");
    poly = matlabFunction(symf);
    disp(poly);
    X = linspace(x(1), x(end), 1000);
    if (problem == 1)
        Y = exp(2. * X) .* cos(3 .* X);
    else
        Y = sin(log(X));
    end
    polyY = poly(X);
    plot(X,Y,'color','g'); hold on;
    plot(X,polyY,'color','b'); hold on;
    
    if (problem == 1)
        ERR = 0.1138;
    else
        ERR = 0.0009458; 
    end
    upY = Y + ERR;
    downY = Y - ERR;
    plot(X,upY,'color','r'); hold on;
    plot(X,downY,'color','r'); hold on;
    legend("Ground Truth", "Polynomials", "Up edge", "Down edge");
end

function polynomials = lagrange_interpolte(X, Fx)
    % input
    % X : (1,n+1)
    % Fx: (1,n+1)
    n = size(X,2) - 1;
    syms x y;
    for i = 1 : n+1
        Xi = X;
        Xi(i) = [];
        if (i == 1)
            y = Fx(i) * prod(x - Xi) ./ prod(X(i) - Xi);
            continue;
        end
        y = y + Fx(i) * prod(x - Xi) ./ prod(X(i) - Xi);
    end
    y = simplify(y);
    polynomials = y;
end