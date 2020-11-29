% comandos de liempieza %
close all;
clear;
clc;

pkg load parallel

p = q = [1 : 0.1 : 25]';       
m = size(p, 1);               
A = tridiagonal(p, q, m);      

m = 242;                      
b = ones(m, 1); 

b_mat = diag(b);



tic;                          
xk_ = pararrayfun(nproc, @parte1_p2, A, b, "Vectorized", true, "ChunksPerProc", 10);
t_p = toc;                    


display(t_p);                  


while (tolerancia y error y esas cosas)

    for( i = 0: filas )

        fila de a = A(i)
        
        ffuncion => suma + A(i, j) * xk(j);

        resultado_suma = parrayfun(bla, @ffuncion, fila de A, xk....)

        ffuncio 2 => xk(i) = 1/A * (b - suma);

        resulrado_xk = parrayfun(bla, @ffuncion2 , elemento de A, elemebto de B, resultado_suma

    end

end