% This is an example of a generalized Nyquist plot of a MIMO system
% Author: Mohamed Belkhayat
% First Generate a frequency vector from 0.001 Hz to 1000 Hz

s=1i*2*pi*logspace(-3,3,1000);

% generate a 2x2 MIMO transfer function. Note this is an example (2.7) in
% Maciejowski, Multivariable Feedback Design

for k=1:1000;
   
    G11s(k)=s(k)-1;G12s(k)=s(k);
    G21s(k)=-6;G22s(k)=s(k)-2;
    den(k)=1.25*(s(k)+1).*(s(k)+2);
    G=[G11s(k), G12s(k);G21s(k), G22s(k)]/den(k);
    
    % Generate the eigen loci, there should be 2, and they should connect when plotted!
    
    E(:,k)=eig(G);
end

% plot the imaginary vs the real part

figure(1)
plot(real(E(2,:)),imag(E(2,:)))
hold on
plot(real(E(2,:)),-imag(E(2,:)),'r')
hold off