function bode_plot_single(x,A,B,name)
fd0 = x;
GLF = A;
Grid = B;

figure
subplot(2,1,1)
semilogx(fd0, 20*log10(abs(GLF)), 'DisplayName', 'Converter')
hold on
semilogx(fd0, 20*log10(abs(Grid)), 'DisplayName', 'Grid')
hold off
xlim([0,1000])
ylabel("Magnitude dB")
xlabel("Frequency Hz")
legend
grid on
title(name + " magnitude")

subplot(2,1,2)
semilogx(fd0, angle(GLF), 'DisplayName', 'Converter')
hold on
semilogx(fd0, angle(Grid), 'DisplayName', 'Grid')
hold off
xlim([0,1000])
ylabel("Angle rad")
xlabel("Frequency Hz")
legend
grid on
title(name + " phase")
end