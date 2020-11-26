% comandos de liempieza %
close all;
clear;
clc;

%---------------------------------------------------------------------%
%------- Script de Ejecucción en Paralelo del Método de Jacobi  ------%

%---------------------------------------------------------------------%
%--------------------- Paso 1: Matriz Tridiagonal --------------------%

p = q = [1 : 0.1 : 25]';       % vectores p y q %
m = size(p, 1);                % entero m %

A = tridiagonal(p, q, m);      % matriz A %

%---------------------------------------------------------------------%
%---------------------- Paso 2: Jacobi Paralelo ----------------------%

m = 242;                       % entero m %
b = ones(m, 1);                % vector de terminos independientes %

xk = parte1_p3(A, b);          % metodo jacobi paralelo %

display(xk);                   % impresión del vector resultante %

%---------------------------------------------------------------------%
%---------------------------------------------------------------------%