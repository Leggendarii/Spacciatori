
% Load data from FD scan
load('Yqd_grid_2.mat');
load('Yqd_grid_nostable.mat');
load('Yqd_GFL_100f.mat');

% Performing "det" and "eig" operations
for n=1:length(fd0)
    Zgrid_stable=inv([Yqq_g(n) Yqd_g(n) 
                      Ydq_g(n) Ydd_g(n)]);
    Zgrid_unstable=inv([Yqq_g_ns(n) Yqd_g_ns(n) 
                        Ydq_g_ns(n) Ydd_g_ns(n)]);
    Y_GFL=[Yqq(n) Yqd(n) 
           Ydq(n) Ydd(n)];

    
    % % Matlab suggested GNC evaluation
    L_1(:,:,n)=Zgrid_stable*Y_GFL;
    L_2(:,:,n)=Zgrid_unstable*Y_GFL;
end

%% Test
RHP_poles = sum(real(pole(Hsys)) > 0)
plot_eigenvalues_in_sequence(-1000:0.1:1000, E);