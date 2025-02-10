function plot_ordered_eigenvalues(frequencies, eigenvalues)
    % INPUT:
    % frequencies  - Vettore delle frequenze in Hz (1xN)
    % eigenvalues  - Matrice (2xN) con gli autovalori già calcolati
    
    % Numero di frequenze
    N = length(frequencies);
    
    % Controllo dimensione eigenvalues
    if size(eigenvalues, 1) ~= 2 || size(eigenvalues, 2) ~= N
        error('La matrice eigenvalues deve essere di dimensione 2xN con N = lunghezza di frequencies.');
    end

    % Matrice per autovalori ordinati
    ordered_eigenvalues = zeros(2, N);
    
    % Inizializza con gli autovalori della prima frequenza
    ordered_eigenvalues(:, 1) = eigenvalues(:, 1);

    % Iterazione sulle frequenze successive per ordinare gli autovalori
    for k = 2:N
        previous_eigs = ordered_eigenvalues(:, k-1);  % Autovalori della frequenza precedente
        current_eigs = eigenvalues(:, k);  % Autovalori attuali

        % Calcola la distanza tra gli autovalori attuali e quelli precedenti
        distances = abs(current_eigs - previous_eigs'); % Matrice 2x2 delle distanze

        % Caso generale: ordina in base alla minima distanza totale
        if distances(1,1) + distances(2,2) < distances(1,2) + distances(2,1)
            ordered_eigenvalues(:, k) = current_eigs; % Mantieni l'ordine
        else
            ordered_eigenvalues(:, k) = flipud(current_eigs); % Scambia gli autovalori
        end

        % Controllo per scambi improvvisi (eigenvalue swapping)
        if k > 2
            prev_dist = norm(ordered_eigenvalues(:, k-1) - ordered_eigenvalues(:, k-2));
            curr_dist = norm(ordered_eigenvalues(:, k) - ordered_eigenvalues(:, k-1));

            % Se la distanza varia troppo, correggi lo swap
            if curr_dist > 2 * prev_dist
                ordered_eigenvalues(:, k) = flipud(ordered_eigenvalues(:, k));
            end
        end
    end

    % Plot degli autovalori ordinati nel piano complesso
    figure;
    hold on;
    grid on;
    xlabel('Re(\lambda)');
    ylabel('Im(\lambda)');
    title('Evoluzione ordinata degli autovalori rispetto alla frequenza');

    % Plotta le traiettorie degli autovalori
    plot(real(ordered_eigenvalues(1, :)), imag(ordered_eigenvalues(1, :)), '-o', 'DisplayName', 'Eigenvalue 1');
    plot(real(ordered_eigenvalues(2, :)), imag(ordered_eigenvalues(2, :)), '-o', 'DisplayName', 'Eigenvalue 2');

    legend show;
    hold off;
end
