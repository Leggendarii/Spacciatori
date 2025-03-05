clc
clear
close all

%% Setup Known Transfer functions
select = input("Pres 1 for stable case or 0 for unstable:");

if select == 0
    G11 = tf(1, [1 -1]);
    G12 = tf(2, [1 -2]);
    G21 = tf(3, [1 -3]);
    G22 = tf(4, [1 -4]);
else
    G11 = tf(1, [1 1]);
    G12 = tf(2, [1 2]);
    G21 = tf(3, [1 3]);
    G22 = tf(4, [1 4]);
end

H = [1 1; 1 1];

G = [G11 G12; G21 G22];
looped = feedback(G,H);
disp("The MIMO Transfer function once feedback looped is table oer not? (0: unstable, 1:stable)")
isstable(looped)

figure(1)
nyqmimo(G) % A function founded online that computes the Nyquist of the matalb transfer-functions
title("Test Outer method 1")

%% Setup impedance/Ammetance matrix and compute eigenvalues
f = logspace(-1, 2, 100);
[H, w_out] = freqresp(G, f);

for n=1:length(f)
    Loop(:,n) = eig(H(:,:,n));
    Loop_det(:,n) = det(eye(2)+H(:,:,n));
end

%% Work area
% 1: lui calcola gli eignevalues del loop gain per ogni frequenza prima
% 2: sorting degli eig
% 3: N= Z-P del denominatore: N>0 -> Closed loop unstable, N<0-> Loop Gain
% unstable, N=0 -> Stable
% 4: il bro conta i giri attorno a -1 pero

plot_eigenvalues_in_sequence(1:100, Loop(:,1:100), 1);

%% Test of stability via determinant
figure
plot(real(Loop_det), imag(Loop_det),"r")
hold on
plot(real(Loop_det), -imag(Loop_det),"b")
plot(0, 0, 'pentagram', 'MarkerSize', 5, 'Color', "g","LineWidth",2); 
title("Nyquist on determinant of the closed loop")
xlabel('Re(\lambda)');
ylabel('Im(\lambda)');
grid on