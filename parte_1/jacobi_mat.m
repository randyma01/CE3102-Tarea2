function xk = jacobi_mat(A, b)
    xk = [];
    [m, n] = size(A);

    if (m != n)                    
        display("La matriz no es cuadrada.")
        return;
    elseif (det(A) == 0)               
        display("La matriz no es invertible.")
        return;
    elseif (!diag_dom(A, m))
        display("La matriz no es diagonalmente dominante.")
        return;
    elseif (n != size(b, 1))           
        display("El vector de valores independientes no coincide.")
        return;
    else
        x0 = zeros(m, 1);
        xk = x0;
        M = diag((diag(A)))
        N = M - A
        d = diag(M)
        Minv = diag(1./d)
        tol = 10^-8;
        err = tol + 1;

        while(tol < err)
            xk = (Minv * N * xk) + (Minv * b); 
            err = norm(A * xk - b); 
        end
    end
end

% A = [5,1 ,1; 1, 5, 1; 1, 1, 5]
% b = [7; 7; 7]

% x = jacobi(A, b)