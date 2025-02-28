function plot_ordered_eigenvalues(frequencies, eigenvalues)
    % INPUT:
    % frequencies  - Vettore delle frequenze in Hz (1xN)
    % eigenvalues  - Matrice (2xN) con gli autovalori già calcolati
    
    % Numero di frequenze
    N = length(frequencies);

    %% Caso non ordinato
%     ordered_eigenvalues = eigenvalues;
% 
%     % Plot degli autovalori ordinati nel piano complesso
%     figure;
%     hold on;
%     grid on;
%     xlabel('Re(\lambda)');
%     ylabel('Im(\lambda)');
%     title('Evoluzione ordinata degli autovalori rispetto alla frequenza (disordinato)');
% 
%     % Plotta le traiettorie degli autovalori
%     h1 = plot(real(ordered_eigenvalues(1, :)), imag(ordered_eigenvalues(1, :)), '-o', 'DisplayName', 'Eigenvalue 1', 'Color',"m");
%     h2 = plot(real(ordered_eigenvalues(1, :)), -imag(ordered_eigenvalues(1, :)), '-o','Color',"m");
%     h3 = plot(real(ordered_eigenvalues(2, :)), imag(ordered_eigenvalues(2, :)), '-o', 'DisplayName', 'Eigenvalue 2','Color',"b");
%     h4 = plot(real(ordered_eigenvalues(2, :)), -imag(ordered_eigenvalues(2, :)), '-o','Color',"b");
%     h5 = plot(0, 0, 'pentagram', 'MarkerSize', 5, 'Color', "g","LineWidth",2); 
%     legend([h1, h3]);
%     hold off;
% 
%% Caso ordinato 
    ordered_eigenvalues = scambia_completamente(eigenvalues);

    % Plot degli autovalori ordinati nel piano complesso
    figure;
    hold on;
    grid on;
    xlabel('Re(\lambda)');
    ylabel('Im(\lambda)');
    title('Evoluzione ordinata degli autovalori rispetto alla frequenza (ordinato)');

    % Plotta le traiettorie degli autovalori
    h1 = plot(real(ordered_eigenvalues(1, :)), imag(ordered_eigenvalues(1, :)), '-o', 'DisplayName', 'Eigenvalue 1', 'Color',"m");
    % HP: the system GFL+Grid process just real signals in time and do not
    % produce any complex responce (example: a step in power will not
    % produce a complex voltage or current etc.) Therefore the system
    % stidied in small signal is LTI Hermitian with G(-jw)=conj(G(jw)) so
    % the transfer funcion of L(jw) should have [-inf,0] simmetrical to
    % [0,inf] domain. 
    h2 = plot(real(ordered_eigenvalues(1, :)), -imag(ordered_eigenvalues(1, :)), '-o','Color',"m");
    
    h3 = plot(real(ordered_eigenvalues(2, :)), imag(ordered_eigenvalues(2, :)), '-o', 'DisplayName', 'Eigenvalue 2','Color',"b");
    % The same here
    h4 = plot(real(ordered_eigenvalues(2, :)), -imag(ordered_eigenvalues(2, :)), '-o','Color',"b");
    h5 = plot(0, 0, 'pentagram', 'MarkerSize', 5, 'Color', "g","LineWidth",2); 
    legend([h1, h3]);
    hold off;
end
