% Funzione per eseguire lo scambio dei componenti se necessario
function E = scambia_completamente(E)
    [rows, cols] = size(E);
    
    % Itera sulle colonne del vettore
    for j = 2:cols  % parte dalla seconda colonna
        dist1 = distanza(E(1,j), E(1,j-1));  % distanza tra E(1,j) e E(1,j-1)
        dist2 = distanza(E(1,j), E(2,j-1));  % distanza tra E(1,j) e E(2,j-1)
        
        % Se E(1,j) è più lontano da E(1,j-1) di quanto non lo sia da E(2,j-1), allora scambia
        if dist1 > dist2
            % Scambia i valori
            temp = E(1,j);
            E(1,j) = E(2,j);
            E(2,j) = temp;
        end
    end
end