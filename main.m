clc
clear
close all

%% Load data from Z-Tool format from grid and conveerter side

[fd0, Ydd_g, Ydq_g, Yqd_g, Yqq_g] = leggi_dati("rete.txt");
[f0_c, Ydd_c, Ydq_c, Yqd_c, Yqq_c] = leggi_dati("vsc.txt");

%% Setup impedance/Ammetance matrix and compute eigenvalues

for n=1:length(fd0)

    %Setup Matrixes per each frequency
    Z_g = inv([Ydd_g(n), Ydq_g(n); 
               Yqd_g(n), Yqq_g(n)]);
    Y_c = [Ydd_c(n), Ydq_c(n); 
            Yqd_c(n), Yqq_c(n)];

    % Open loop gain
    L(:,:,n) = Y_c*Z_g;

    % Eigenvalues computation per each frequency
    E(:,n) = eig(L(:,:,n));

end

%% Plot each bode plot and MIMO Nyquist

bode_plot_single(fd0,Ydd_c,1./Ydd_g,"dd")
bode_plot_single(fd0,Ydq_c,1./Ydq_g,"dq")
bode_plot_single(fd0,Yqd_c,1./Yqd_g,"qd")
bode_plot_single(fd0,Yqq_c,1./Yqq_g,"qq")

plot_eigenvalues_in_sequence(1:length(fd0), E);
