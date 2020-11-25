% comandos de liempieza %
close all;
clear;
clc;

% carga del paquete parallel %
pkg load parallel


A = [5,1 ,1; 1, 5, 1; 1, 1, 5]
b = [7; 7; 7]

[m, n] = size(A);


x0 = zeros(m, 1);
xk = x0;
tol = 10^-5;
err = tol + 1;
iter = 0;

while(tol < err && iter < 1000)

    for (i = 1 : n)
        suma = 0;
 
        for (j = 1 : m)
            if (i != j)
                A(i, j)
                suma = suma + A(i, j) * xk(j);
            end
        end

        xk(i) = 1/A(i, i) * (b(i) - suma);
    end 
    err = norm(A * xk - b); 
    ++iter; 
end

xk