% Esta funcion encuentra la solucion a un sistema 
% de ecuaciones representado mediante la expresion:
% A * x = b, utilizando el metodo de Jacobi de for-
% secuencial. 
%
% El metodo de Jacobi utiliza la siguiente formula:
% -> xk = 1/A(i, i) * (b(i) - suma);   
% 
% donde:
%
% -> suma = A(i, j) + xk(i)
%
% Para el cálculo de la norma, se aplica la formula 
% Euclidiana o norma 2. 
%
% Firma: xk = parte1_p2(A,b)
% 
% Entradas: 
%   A = matriz de coeficientes
%   b = vector de valores independientes
%            
% Salida:                           
%   xk = vector de incognitas
function xk = parte1_p2(A, b)
    % declaracion: vector resultante %
    xk = [];

    % calculo: dimensiones de la matriz A %
    [m, n] = size(A);

    % verificacion: matriz debe ser cuadrada %
    if (m != n)                    
        display("La matriz no es cuadrada.")
        return;

    % verificacion: matriz debe ser invertible %    
    elseif (det(A) == 0)               
        display("La matriz no es invertible.")
        return;

    % verificacion: la matriz debe ser diagnonalmente dominante %
    elseif (!diag_dom(A, m))
        display("La matriz no es diagonalmente dominante.")
        return;

    % verificacion: el vector b debe coinicidir con la matriz %
    elseif (n != size(b, 1))           
        display("El vector de valores independientes no coincide.")
        return;
    
    % si cumple las conficiones, ejecuta el metodo de jacobi %
    else
        % declaracion: vector inicial %
        x0 = zeros(m, 1);

        % asignacion: vector resultante %
        xk = x0;

        % declaracion: tolerancia %
        tol = 10^-5;

        % declaracion: error %
        err = tol + 1;

        % declaracion: numero de iteraciones realizadas %
        iter = 0;

        % iteracion: mientras el error sea mayor que la %
        % tolerancia y las iteraciones realizadas sean  %
        % menor que 1000, ejecuta la siguiente serie    %
        while(tol < err && iter < 1000)
            
            % iteracion: recorrido por cada fila de la matriz A %
            for (i = 1 : m)
        
                % declaracion: valor resultante de la serie %
                suma = 0;

                % iteracion: recorrido por cada columna de la matriz A %
                for (j = 1 : n)
                
                    % verificacion: si 'i' no es igual a 'j' realice la suma, si no, salto %
                    if (i != j)
                        % calculo: de la suma de (Aij * xki + Aij+1 * xk2)%
                        suma = suma + A(i, j) * xk(j);
                    end
                end
            
                % calculo: calculando secuencialmente del valor final xk(i) con la formula de la serie %
                xk(i) = 1/A(i, i) * (b(i) - suma);
            end 

            % calculo: error mediante la norma 2 %
            err = norm(A * xk - b); 

            % aumento del contador de iteraciones realizadas %
            ++iter;
        end
    end
end