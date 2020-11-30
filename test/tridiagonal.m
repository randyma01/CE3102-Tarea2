% Esta funcion genera una matriz tridiagonal, a partir
% de dos vectores (p y q) que cumple ciertas caracteristicas,
% las cuales son: 
%
% -> diagonal superior = vector q
% -> diagonal principal = formula*
% -> diagnoal inferior = vector p
%
% formula * = 2 x (p(i) + q(i)) 
%
% Firma: xk = tridiagonal(p,q, m)
% 
% Entradas: 
%   p = matriz de coeficientes
%   q = vector de valores independientes
%   m = número entero positivo mayor o igual a 3 
%            
% Salida:                           
%   A = matriz tridiagonal
function A = tridiagonal(p, q, m)

    % calculo: dimensiones del vector de p %
    [m_p, n_p] = size(p);

    % calculo: dimensiones del vector de q %
    [m_q, n_q] = size(q);

    % verificacion: m debe ser positivo y mayor e igual que 3 %
    if (m < 3)
        display("M debe ser positivo y, mayor o igual que 3.")
        return;

    % verificacion: el tamano de los vectores p y q deben ser iguales %
    elseif (m_p != m_q)
        display("Los tamaños de los vectores p y q deben ser iguales.")    
    
    % verificacion: el tamano de los vectores p y q deben coincidir iguales a m %
    elseif (m_p != m)
        display("El tamaño de de los vectores p y q deben concoindir con el valor de m.")

    % si cumple las conficiones, ejecuta la construccion de la matriz%
    else
        
        % declaracion: matriz temporal con diagonal superior del vector q %
        mat_q = diag(q, 1);

        % declaracion: matriz temporal con diagonal inferior del vector p %
        mat_p = diag(p, -1);

        % declaracion: matriz A resultante de al suma de las matrices mat_q y mat_p %
        % diganonal principal con valores de 0%
        A = mat_p + mat_q;

        % asignacion: valor (1, 1) de la matriz A %
        A(1, 1) = 2 * q(1); 

        % asignacion: valor (m, m) de la matriz A %
        A(end, end) = 2 * p(m);

        % valores de la diagonal %
        % iteracion: recorrido de la matriz % 

        % iniciando despues de la posicion A(1, 1) %
        for (i = 2 : m)
            % reccoriddo por columnas %
            for (j = 1 : m)
                % cuando sea un elemento diagonal %
                if (i == j)
                    % calculo: elemento diagonal segun la formula %
                    A(i, j) = 2 * (p(j) * q(j));
                end
            end
        end
        %A
    end
end