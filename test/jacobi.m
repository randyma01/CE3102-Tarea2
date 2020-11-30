function xk = jacobi (A, b, xk, m, r)
    for( i = 1 : m)
        suma = 0;
        for (j = 1 : m)
            if (i != j)
                suma = suma + A(i, j) * xk(j);
            end
        end
        
    end
    xk(r) = 1/A(r, r) * (b(r) - suma);
end