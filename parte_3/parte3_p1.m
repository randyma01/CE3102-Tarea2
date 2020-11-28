% comandos de limpieza %
close all;
clear;
clc;

% Implementacion del Metodo Iterativo para Aproximar   %
% la PseudoInversa de una Matriz, basado en el Metodo  %
% de la Secante para hallar el cero de una funcion no  %
% lineal, en GNU Octave.                               %

% declaracion: matriz A con ceros %
A = zeros(45, 30);
 
% iteracion: llenando la matriz A con la formula: %
% A(i, j) = i^2 + j^2                             %
for (i = 1 : 45)
    for (j = 1 : 30)
        A(i, j) = i^2 + j^2;
    end
end

% declaracion: valores de alpha_1 y alpha_2 %
alpha_1 = 5 * 10^-10;
alpha_2 = 2 * 10^-11;

% asignacion: valores iniciales %
x0 = alpha_1 * A';
x1 = alpha_2 * A';

% declaracion: tolerancia %
tol = 10^-5;

% declaracion: error %
err = tol + 1;

% iteracion: mientras el error sea mayor que la %
% tolerancia, halla la pesudiinversa con la     %
% formula dada                                  %
while (tol < err)
    
    % calculo: formula de la pseudoinversa %
    xk = x0 + x1 - x0 * A * x1;

    % asignacion: nuevos valores de la iteracion %
    x0 = x1;
    x1 = xk;

    % calculo: error mediante la norma de frobenius%
    err = norm(A * xk * A - A, 'fro');
end

% impresion de la pseudoinversa y el error %
A
err
xk

