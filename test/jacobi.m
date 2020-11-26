function xk = jacobi(A, b, xk)
    i = 0;
    i = 0;
    suma = 0;
    if (i != j)
        suma = suma + A(i, j) * xk(j);
    end
    xk(i) = 1/A(i, i) * (b(i) - suma);
end