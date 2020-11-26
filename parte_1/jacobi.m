% Esta funcion genera realiza el cálculo de la 
% formula de Jacobi. Encuentra los vectores xk
% en cada iteración
%
%
% Firma: xk = jacobi(aii,bi, suma)
% 
% Entradas: 
%   aii = matriz de coeficientes
%   bi = vector de valores independientes
%   suma = entero de la suma de la serie
%            
% Salida:                           
%   xk = vector
function xk = jacobi(aii, bi, suma)
    % calculo: xk de la formula de jacobi %
    xk = 1/aii * (bi - suma);
end