function bool = diag_dom(A, m)
    bool = 0;

    for (i = 1 : m)
        ed = abs(A(i, i));
        suma = sum(abs(A(i, :))) - ed;

        if (suma < ed)
            bool = 1;
            continue;
        else
            bool = 0;
            break;
        end
    end
end