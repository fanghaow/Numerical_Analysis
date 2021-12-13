clc; clear; close all;
%% Main
main();

%% My functions
function main()
    % a Problem
    A = [3 -1 1;
        3 6 2;
        3 3 7];
    b = [1; 0; 4];
    % b Problem
%     A = [10 -1 0;
%         -1 10 -2;
%         0 -2 10];
%     b = [9; 7; 6];

    result = Jacobi_iterative(A,b);
    fprintf("Jacobi Iterative Result :");
    disp(result');
    
    result = Gauss_Seidel(A,b);
    fprintf("Gauss Seidel Result :");
    disp(result');
end

function root = Gauss_Seidel(A,b) % A = D - L - U
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A,1);
    Update_A = pinv(D) * (L + U); % (n,n)
    Update_b = pinv(D) * b; % (n,1)
    
    n = size(A,1);
    MaxIteration = 100;
    TOL = 0.001;
    oldRoot = zeros(n,1); % Init
    newRoot = zeros(n,1);
    for i = 1:MaxIteration
        for j = 1:n
            newRoot(j) = sum(newRoot' .* Update_A(j,:)) + Update_b(j);
        end
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