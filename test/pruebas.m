close all;
clear;
clc;

pkg load parallel

%vector_x = [0:9];
%vector_z = [10:19];

%para_1 = pararrayfun(nproc, @myfun, vector_x, "Vectorized", true, "ChunksPerProc", 1)

%para_2 = pararrayfun(nproc, @myfun2, vector_x, vector_z, "Vectorized", true, "ChunksPerProc", 1)

%para_3 = pararrayfun(nproc, @myfun3, vector_x, num, "Vectorized", true, "ChunksPerProc", 1)

%for (i = 1 : size(A,1))
%    para_4 = pararrayfun(nproc, @myfun4, A(i, :), b', suma, "Vectorized", true, "ChunksPerProc", 1)
%end


%p = q = [1 : 0.1 : 25]';       % vectores p y q %
%ty = size(p, 1);                % entero m %
%A = tridiagonal(p, q, ty);      % matriz A %

%d = 242;                       % entero m %
%b = ones(d, 1);                % vector b %

A = [5,1 ,1; 1, 5, 1; 1, 1, 5]; 
b = [7; 7; 7];                  

tic
[m, n] = size(A);               
xk = zeros(m, 1);               

tol = 10^-5;                    
err = tol + 1;

iter = 0;

while (tol < err && iter < 1000)
    
    %xk = jacobi(A, b, xk, m, 1:4)
    f_jacobi = @(r) jacobi(A, b, xk, m, r);
    
    xk = pararrayfun(nproc, f_jacobi, 1 : m)';

    err = norm(A * xk - b); 

    iter = iter +1;
end
xk
t_s = toc;                     % fin del tiempo %

display(t_s);                  % impresión del tiempo secuencial %
