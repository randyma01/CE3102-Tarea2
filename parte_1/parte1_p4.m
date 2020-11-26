% comandos de liempieza %
close all;
clear;
clc;

%---------------------------------------------------------------------%
%------- Script de Ejecucción y Tiempos del Método de Jacobi  --------%

%---------------------------------------------------------------------%
%-------------------- Paso 1: Matriz A y Vector b --------------------%

p = q = [1 : 0.1 : 25]';       % vectores p y q %
m = size(p, 1);                % entero m %

A = tridiagonal(p, q, m);      % matriz A %

m = 242;                       % entero m %
b = ones(m, 1);                % vector b %

%---------------------------------------------------------------------%
%---------------------- Paso 2: Jacobi Secuencial --------------------%

tic;                           % inicio del tiempo %
xk_s = parte1_p2(A, b);        % metodo jacobi secuencial %
t_s = toc;                     % fin del tiempo %

%display(xk_s);                 % impresión del vector resultante %

display(t_s);                  % impresión del tiempo secuencial %

%---------------------------------------------------------------------%
%---------------------- Paso 3: Jacobi Paralelo ----------------------%

tic;                           % inicio del tiempo %
xk_p = parte1_p3(A, b);        % metodo jacobi paralelo %
t_p = toc;                     % fin del tiempo %

%display(xk_p);                 % impresión del vector resultante %

display(t_p);                  % impresión del tiempo parelelo %

%---------------------------------------------------------------------%
%------------------ Paso 4: Calculo de Aceleracion  ------------------%

% Calculo de la aceleracion del metodo en paralelo %

s_p = t_s / t_p;           % formula de la aceleracion %

display(s_p);                   % impresión de la aceleracion %  

%---------------------------------------------------------------------%
%---------------------------------------------------------------------%