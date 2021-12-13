clc; clear; close all;
%% Main
main();
%% My functions
function main()
    % a Problem
    A = [4 1 -1;
        -1 3 1;
        2 2 5];
    b = [5; -4; 1];
    % b Problem
%     A = [-2 1 1/2;
%         1 -2 -1/2;
%         0 1 2];
%     b = [4; -4; 0];

    result = Jacobi_iterative(A,b);
    fprintf("Result :");
    disp(result');
end

function root = Jacobi_iterative(A,b) % A = D - L - U
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A,1);
    
    n = size(A,1);
    MaxIteration = 100;
    TOL = 0.001;
    oldRoot = zeros(n,1); % Init
    newRoot = zeros(n,1);
    for i = 1:MaxIteration
        newRoot = pinv(D) * (L + U) * oldRoot + pinv(D) * b;
        fprintf("No.%d iteration: x(%d) =", i, i);
        disp(newRoot');
        if (inf_norm(oldRoot - newRoot) / inf_norm(newRoot) < TOL)
            fprintf("After %d iterations, i found the root!\n", i);
            break;
        end
        oldRoot = newRoot; % Update
    end
    root = newRoot;
    
    if (i == MaxIteration)
        fprintf("[Warn]: Maximum number of iterations exceeded\n");
    end
    fprintf("A * x - b =");
    disp((A * root - b)');
end

function ret = inf_norm(V)
    ret = max(abs(V));
end