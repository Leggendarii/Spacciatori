clc
clear
% Load data from FD scan
load('Yqd_grid_2.mat');
load('Yqd_grid_nostable.mat');
load('Yqd_GFL_100f.mat');

% Performing "det" and "eig" operations
Y_qq_g = zeros(1,length(Yqq));
Y_qd_g = zeros(1,length(Yqd));
Y_dq_g = zeros(1,length(Ydq));
Y_dd_g = zeros(1,length(Ydd));

for n=1:length(fd0)
    Zgrid_stable=inv([Yqq_g(n), Yqd_g(n); 
                      Ydq_g(n), Ydd_g(n)]);
    Y_qq_g(n) = Yqq_g(n);
    Y_qd_g(n) = Yqd_g(n);
    Y_dq_g(n) = Ydq_g(n);
    Y_dd_g(n) = Ydd_g(n);

    Zgrid_unstable=inv([Yqq_g_ns(n), Yqd_g_ns(n); 
                        Ydq_g_ns(n), Ydd_g_ns(n)]);
    Y_GFL=[Yqq(n) Yqd(n) 
           Ydq(n) Ydd(n)];

    
    % % Matlab suggested GNC evaluation
    L_1(:,:,n)=Zgrid_stable*Y_GFL;
    L_2(:,:,n)=Zgrid_unstable*Y_GFL;
end

%% Test
GFL = Yqd;
Grid = Y_qd_g;
name = "qd"

bode_plot_single(fd0,Yqd,Y_qd_g,name)

% 1: lui calcola gli eignevalues del loop gain per ogni frequenza prima
% 2: sorting degli eig
% 3: N= Z-P del denominatore: N>0 -> Closed loop unstable, N<0-> Loop Gain
% unstable, N=0 -> Stable


% RHP_poles = sum(real(pole(Hsys)) > 0)
% plot_eigenvalues_in_sequence(-1000:0.1:1000, E);