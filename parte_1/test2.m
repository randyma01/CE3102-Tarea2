clear;
clc;

A = [5,1 ,1; 1, 5, 1; 1, 1, 5]
b = [7; 7; 7]

xk = [];
[m, n] = size(A)

aux = 0; 
for (i = 1 : m)
    for (j = 1 : m)
        aux(j) = A(i, j)
    end
end