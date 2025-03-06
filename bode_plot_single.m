function bode_plot_single(x,A,B,name)
fd0 = x;
% GFL = A;
% Grid = B;

figure
subplot(2,1,1)
for i=1:length(A)
GFL = A{i};
semilogx(fd0, 20*log10(abs(GFL)), 'DisplayName', sprintf('Converter(%d)',i))
if i==1
  hold on
end
end
for i=1:length(B)
Grid = B{i};
semilogx(fd0, 20*log10(abs(Grid)), 'DisplayName', sprintf('Grid (%d)',i))
end
hold off
xlim([0,max(x)])
%xlim auto,
ylabel("Magnitude dB")
xlabel("Frequency Hz")
legend
grid on
title(name + " magnitude")

subplot(2,1,2)
for i=1:length(A)
GFL = A{i};
semilogx(fd0, angle(GFL), 'DisplayName', sprintf('Converter(%d)',i))
if i==1
  hold on
end
end
for i=1:length(B)
Grid = B{i};
semilogx(fd0, angle(Grid), 'DisplayName', sprintf('Grid (%d)',i))
end
hold off
xlim([0,max(x)])
%xlim auto;
ylabel("Angle rad")
xlabel("Frequency Hz")
legend
grid on
title(name + " phase")
end
