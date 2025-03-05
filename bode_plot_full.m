function bode_plot_full(fd0, Y_c, Y_g)

Ydd_g = squeeze(Y_g(1,1,:));
Ydq_g = squeeze(Y_g(1,2,:));
Yqd_g = squeeze(Y_g(2,1,:));
Yqq_g = squeeze(Y_g(2,2,:));

Ydd_c = squeeze(Y_c(1,1,:));
Ydq_c = squeeze(Y_c(1,2,:));
Yqd_c = squeeze(Y_c(2,1,:));
Yqq_c = squeeze(Y_c(2,2,:));


bode_plot_single(fd0,Ydd_c,Ydd_g,"dd")
bode_plot_single(fd0,Ydq_c,Ydq_g,"dq")
bode_plot_single(fd0,Yqd_c,Yqd_g,"qd")
bode_plot_single(fd0,Yqq_c,Yqq_g,"qq")
end