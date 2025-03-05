function plot_ordered_eigenvalues(frequencies, eigenvalues, critical_visible)
    % INPUT:
    % frequencies  - Vettore delle frequenze in Hz (1xN)
    % eigenvalues  - Matrice (2xN) con gli autovalori già calcolati
    % critical_visible - 0/1 value che fa vedere o no il punto -1

    % Numero di frequenze
    N = length(frequencies);

%% Caso ordinato 
    ordered_eigenvalues = scambia_completamente(eigenvalues);

    % Plot degli autovalori ordinati nel piano complesso
    figure;
    hold on;
    grid on;
    xlabel('Re(\lambda)');
    ylabel('Im(\lambda)');
    title('Eigenvalues of MIMO open loop L(S)');

    % Plotta le traiettorie degli autovalori
    h1 = plot(real(ordered_eigenvalues(1, :)), imag(ordered_eigenvalues(1, :)), '-o', 'DisplayName', 'Eigenvalue 1 [0,+\inf]', 'Color',"r");
    % HP: the system GFL+Grid process just real signals in time and do not
    % produce any complex responce (example: a step in power will not
    % produce a complex voltage or current etc.) Therefore the system
    % stidied in small signal is LTI Hermitian with G(-jw)=conj(G(jw)) so
    % the transfer funcion of L(jw) should have [-inf,0] simmetrical to
    % [0,inf] domain. 
    h2 = plot(real(ordered_eigenvalues(1, :)), -imag(ordered_eigenvalues(1, :)), '-o','DisplayName', 'Eigenvalue 1 [-inf,0]','Color',"b");
    
    h3 = plot(real(ordered_eigenvalues(2, :)), imag(ordered_eigenvalues(2, :)), '-o', 'DisplayName', 'Eigenvalue 2 [0,+inf]','Color',"y");
    % The same here
    h4 = plot(real(ordered_eigenvalues(2, :)), -imag(ordered_eigenvalues(2, :)), '-o','DisplayName', 'Eigenvalue 2 [-inf,0]','Color',"g");
    if critical_visible == 1
        h5 = plot(-1, 0, 'pentagram', 'MarkerSize', 5, 'Color', "m","LineWidth",2); 
    end
    legend([h2, h1, h4, h3]);
    hold off;
end
