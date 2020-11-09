function bool = diag_dom(A, m)

    % declaracion: valor resultante %
    bool = 0;

    % iteracion: recorrido de la matriz, mientras %
    % se verifica por filas que la matriz sea     %
    % diagonalmente dominante                     %
    for (i = 1 : m)
    
        % declaracion: elemento de la diagonal %
        ed = abs(A(i, i));
        
        % declaracion: suma de los elementos de una %
        % fila excluyendo el elemento diagonal      %
        suma = sum(abs(A(i, :))) - ed;
        
        % verificacion: siempre que el elemento diagonal %
        % sea mayor sigue, en caso contrario se sale del %
        % del ciclo                                      %
        if (suma < ed)
            bool = 1;
            continue;
        else
            bool = 0;
            break;
        end
    end
end