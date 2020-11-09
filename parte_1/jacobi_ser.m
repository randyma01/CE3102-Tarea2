function xk = jacobi_ser(A, b)
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
        tol = 10^-8;

        % declaracion: vector de error %
        err = tol + 1;

        % declaracion: numero de iteraciones realizadas %
        iter = 0;

       % iteracion: mientras el error sea mayor que la %
        % tolerancia se ejecuta la siguiente serie      %
        while(tol < err)
            
            % iteracion: recorrido por cada fila de la matriz A %
            for (i = 1 : n)
        
                % declaracion: valor resultante de la serie %
                suma = 0;

                % iteracion: calculo de la suma %
                for (j = 1 : m)
                
                    % verificacion: si 'i' no es igual a 'j' realice la suma, si no, salto %
                    if (i != j)
                        % calculo: de la suma de (Aij * xki + Aij+1 * xk2)%
                        suma = suma + A(i, j) * xk(j);
                    end
                end
            
                % calculo: calculando el valor final xk(i) con la formula de la serie%
                xk(i) = 1/A(i, i) * (b(i) - suma);
            end 

            % calculo del error absoluto mediante la norma 2 %
            err = norm(A * xk - b); 

            % aumento del contador de iteraciones realizadas %
            ++iter; 
        end
    end

    iter
end

% A = [5,1 ,1; 1, 5, 1; 1, 1, 5]
% b = [7; 7; 7]

% x = jacobi_ser(A, b)