
% Load data from FD scan
load('Yqd_grid_2.mat');
load('Yqd_grid_nostable.mat');
load('Yqd_GFL_100f.mat');

% Performing "det" and "eig" operations
clear M_1 M_2 N_1 N_2
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
    % GNC method (if)
    M_1(n)=det(eye(2)+Zgrid_stable*Y_GFL);
    M_2(n)=det(eye(2)+Zgrid_unstable*Y_GFL);
    % Eigenlocus method (only if)
    N_1(:,n)=eig(eye(2)+Zgrid_stable*Y_GFL);
    N_2(:,n)=eig(eye(2)+Zgrid_unstable*Y_GFL);
end


% Plotting section
L_1s=idfrd(L_1,fd0,0);
L_1uns=idfrd(L_2,fd0,0);

% Matlab method
figure
nyquist(L_1s)
hold on;
nyquist(L_1uns)
legend('Stable case', 'Unstable case')

% GNC
figure;
plot(real(M_1), imag(M_1), 'r', 'LineWidth', 1.5, 'MarkerSize', 8); 
hold on
plot(real(M_2), imag(M_2), 'b', 'LineWidth', 1.5, 'MarkerSize', 8); 
plot([min(real(M_1))-1, max(real(M_1))+1], [0, 0], 'k--'); % Eje X
plot([0, 0], [min(imag(M_1))-1, max(imag(M_1))+1], 'k--'); % Eje Y
% quiver(real(M_1(1:end-1)), imag(M_1(1:end-1)), diff(real(M_1)), diff(imag(M_1)), 0, 'r', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
% quiver(real(M_2(1:end-1)), imag(M_2(1:end-1)), diff(real(M_2)), diff(imag(M_2)), 0, 'b', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
plot(0, 0, 'cx', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('Parte Real');
ylabel('Parte Imaginaria');
title('GNC of the two cases');
legend('Stable case', 'Unstable case')
grid on;

% Eigenlocus -STABLE-
figure;
plot(real(N_1(1,:)), imag(N_1(1,:)), 'g', 'LineWidth', 1.5, 'MarkerSize', 8); 
hold on
plot(real(N_1(2,:)), imag(N_1(2,:)), 'm', 'LineWidth', 1.5, 'MarkerSize', 8); 
plot([min(real(N_1(1,:)))-1, max(real(N_1(1,:)))+1], [0, 0], 'k--'); % Eje X
plot([0, 0], [min(imag(N_1(1,:)))-1, max(imag(N_1(1,:)))+1], 'k--'); % Eje Y
% quiver(real(N_1(1,1:end-1)), imag(N_1(1,1:end-1)), diff(real(N_1(1,:))), diff(imag(N_1(1,:))), 0, 'g', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
% quiver(real(N_1(2,1:end-1)), imag(N_1(2,1:end-1)), diff(real(N_1(2,:))), diff(imag(N_1(2,:))), 0, 'm', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
plot(-1, 0, 'cx', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('Parte Real');
ylabel('Parte Imaginaria');
title('Eigenlocus stable case');
legend('Lambda 1', 'Lambda 2')
grid on;

% Eigenlocus -UNSTABLE-
figure;
plot(real(N_2(1,:)), imag(N_2(1,:)), 'g', 'LineWidth', 1.5, 'MarkerSize', 8); 
hold on
plot(real(N_2(2,:)), imag(N_2(2,:)), 'm', 'LineWidth', 1.5, 'MarkerSize', 8); 
plot([min(real(N_2(1,:)))-1, max(real(N_2(1,:)))+1], [0, 0], 'k--'); % Eje X
plot([0, 0], [min(imag(N_2(1,:)))-1, max(imag(N_2(1,:)))+1], 'k--'); % Eje Y
% quiver(real(N_2(1,1:end-1)), imag(N_2(1,1:end-1)), diff(real(N_2(1,:))), diff(imag(N_2(1,:))), 0, 'g', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
% quiver(real(N_2(2,1:end-1)), imag(N_2(2,1:end-1)), diff(real(N_2(2,:))), diff(imag(N_2(2,:))), 0, 'm', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
plot(-1, 0, 'cx', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('Parte Real');
ylabel('Parte Imaginaria');
title('Eigenlocus unstable case');
legend('Lambda 1', 'Lambda 2')
grid on;
