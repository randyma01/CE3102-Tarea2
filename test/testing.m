close all;
clear;
clc;

%---------------------------------------------------------%
%------------- Prueba 1: Funcion Tridiagonal -------------%

%pp = [5, 3, 4, 2, 3, 2]';   % vector pp %
%qp = [4, 1, 1, 1, 2, 0]';   % vector qp %
%mp = size(pp, 1);           % entero mp % 

%Ap = tridiagonal(pp, qp, mp);  % matriz A %
%Ap

%---------------------------------------------------------%
%------------- Prueba 2: Funcion Tridiagonal -------------%

%p = q = [1 : 0.1 : 25]';     % vectores p y q %
%m =  size(p, 1);             % entero m %
%m = 242

%A = tridiagonal(p, q, m)     % matriz A %

%---------------------------------------------------------%
%----- Prueba 3: Funcion Tridiagonal + Metodo Jacobi -----%

%p = q = [1 : 0.1 : 25]';       % vectores p y q %
%m = size(p, 1);                % entero m %

%A = tridiagonal(p, q, m);      % matriz A %
%b = ones(242, 1);              % vector de terminos independientes %

%jacobi = parte1_p2(A, b);      % metodo jacobi %