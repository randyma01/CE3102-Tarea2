% comandos de liempieza %
close all;
clear;
clc;

%---------------------------------------------------------------------%
%------- Script de Ejecucción Secuencial del Método de Jacobi  -------%

%---------------------------------------------------------------------%
%--------------------- Paso 1: Matriz Tridiagonal --------------------%

p = q = [1 : 0.1 : 25]';       % vectores p y q %
m = size(p, 1);                % entero m %

A = tridiagonal(p, q, m);      % matriz A %

%---------------------------------------------------------------------%
%---------------------- Paso 2: Jacobi Secuencial --------------------%

m = 242;                       % entero m %
b = ones(m, 1);                % vector b %

xk = parte1_p2(A, b);          % metodo jacobi secuencial %

display(xk);                   % impresión del vector resultante %

%---------------------------------------------------------------------%
%---------------------------------------------------------------------%