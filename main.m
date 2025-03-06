clc
clear
close all

%% Load data from Z-Tool format from grid and conveerter side

[fd0, Ydd_g, Ydq_g, Yqd_g, Yqq_g] = leggi_dati("rete.txt");
[f0_c, Ydd_c, Ydq_c, Yqd_c, Yqq_c] = leggi_dati("vsc.txt");

%% Setup impedance/Ammetance matrix and compute eigenvalues

Z_g = zeros(2,2,length(fd0));
Y_c = zeros(2,2,length(fd0));
L = zeros(2,2,length(fd0));
E = zeros(2,length(fd0));

for n=1:length(fd0)

    %Setup Matrixes per each frequency
    Z_g(:,:,n) = inv([Ydd_g(n), Ydq_g(n); 
               Yqd_g(n), Yqq_g(n)]);
    Y_c(:,:,n) = [Ydd_c(n), Ydq_c(n); 
            Yqd_c(n), Yqq_c(n)];

    % Open loop gain
    L(:,:,n) = Y_c(:,:,n)*Z_g(:,:,n);

    % Eigenvalues computation per each frequency
    E(:,n) = eig(L(:,:,n));

end

%% Plot each Bode Plots and MIMO Nyquist
Y_cs = {Y_c};
Z_gs = {Z_g};

bode_plot_full(fd0, Y_cs, Z_gs)
plot_eigenvalues_in_sequence(1:length(fd0), E, 1);
