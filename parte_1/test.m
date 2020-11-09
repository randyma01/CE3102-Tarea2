clear;
clc;

A = [5,1 ,1; 1, 5, 1; 1, 1, 5]
b = [7; 7; 7]

%A = [3, -1, 2; 1, 1, 0; -2, 3, -4]
%b = [3; 3; 3]

xk = [];
[m, n] = size(A)

x0 = zeros(m, 1)
xk = x0;

tol = 10^-8;
err = tol + 1;

iter = 0;

while(tol < err)

    for (i = 1 : n)
        
        suma = 0;

        for (j = 1 : m)
            if (i != j)
                suma = suma + A(i, j) * xk(j)
            end
        end
        
        suma

        xk(i) = 1/A(i, i) * (b(i) - suma)
    end
   
    %err = norm(x0 - xk)
    %x0 = xk
    err = norm(A * xk - b);
    ++iter;
end

iter

%aux = 0; 
%for (i = 1 : m)
%    for (j = 1 : m)
%        aux(j) = A(i, j)
%    end
%end


    