% Esta funcion genera realiza el cálculo de la 
% formula de Jacobi. Encuentra los vectores xk
% en cada iteración
%
% Firma: xk = jacobi(aii,bi, suma)
% 
% Entradas: 
%   A = matriz de coeficientes
%   b = vector de valores independientes
%   xk = vector resultante
%   m = dimension de matriz A
%   r = indices de la matriz A
%            
% Salida:                           
%   y = vector
function y = jacobi (A, b, xk, m, r)
        
    % declaracion: valor resultante de la serie %
    suma = 0;
    
    % iteracion: recorrido por cada columna de la matriz A %
    for (j = 1 : m)

        % verificacion: si 'i' no es igual a 'j' realice la suma, si no, salto %
        if (r != j)

            % calculo: de la suma de (Aij * xki + Aij+1 * xk2)%
            suma = suma + A(r, j) * xk(j);
        end
    end
    
    % calculo: calculando secuencialmente del valor final xk(i) con la formula de la serie %
    y = 1/A(r, r) * (b(r) - suma);
end