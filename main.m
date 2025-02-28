clc
clear

%% Load data from FD scan
load('Yqd_grid_2.mat');
load('Yqd_grid_nostable.mat');
load('Yqd_GFL_100f.mat');

%% Setup impedance/Ammetance matrix and compute eigenvalues

for n=1:length(fd0)
    % Grid Matrixes
    Zgrid_stable=inv([Yqq_g(n), Yqd_g(n); 
                      Ydq_g(n), Ydd_g(n)]);

    Ygrid_stable=([Yqq_g(n), Yqd_g(n); 
                      Ydq_g(n), Ydd_g(n)]);

    Zgrid_unstable=inv([Yqq_g_ns(n), Yqd_g_ns(n); 
                        Ydq_g_ns(n), Ydd_g_ns(n)]);

    Ygrid_unstable=([Yqq_g_ns(n), Yqd_g_ns(n); 
                      Ydq_g_ns(n), Ydd_g_ns(n)]);

    % GFL matrix
    Y_GFL=[Yqq(n) Yqd(n) 
           Ydq(n) Ydd(n)];

    % Open loop gain per each frequency stable case
    L_1(:,:,n)=Zgrid_stable*Y_GFL;
    % Open loop gain per each frequency unstable case
    L_2(:,:,n)=Zgrid_unstable*Y_GFL;

    % Eigenvalues computation per each frequency
    E_GFL(:,n) = eig(Y_GFL);
    E_grid(:,n) = eig(Ygrid_stable);
    E_loop_stable(:,n) = eig(L_1(:,:,n));
    E_loop_unstable(:,n) = eig(L_2(:,:,n));

end

%% Work area
% 1: lui calcola gli eignevalues del loop gain per ogni frequenza prima
% 2: sorting degli eig
% 3: N= Z-P del denominatore: N>0 -> Closed loop unstable, N<0-> Loop Gain
% unstable, N=0 -> Stable
% 4: il bro conta i giri attorno a -1 pero

bode_plot_single(fd0,Yqq,Yqq_g,"qq")
plot_eigenvalues_in_sequence(10:102, E_loop_unstable(:,10:102));
