function bode_plot_full(fd0, Y_cs, Y_gs)

Ydd_gs = {};
Ydq_gs = {};
Yqd_gs = {};
Yqq_gs = {};

Ydd_cs = {};
Ydq_cs = {};
Yqd_cs = {};
Yqq_cs = {};

for i=1:length(Y_gs)
    Y_g = Y_gs{i};
    Ydd_g = squeeze(Y_g(1,1,:));
    Ydq_g = squeeze(Y_g(1,2,:));
    Yqd_g = squeeze(Y_g(2,1,:));
    Yqq_g = squeeze(Y_g(2,2,:));

    Ydd_gs = appendCellRow(Ydd_gs, Ydd_g);
    Ydq_gs = appendCellRow(Ydq_gs, Ydq_g);
    Yqd_gs = appendCellRow(Yqd_gs, Yqd_g);
    Yqq_gs = appendCellRow(Yqq_gs, Yqq_g);
end

for i=1:length(Y_cs)
    Y_c = Y_cs{i};
    Ydd_c = squeeze(Y_c(1,1,:));
    Ydq_c = squeeze(Y_c(1,2,:));
    Yqd_c = squeeze(Y_c(2,1,:));
    Yqq_c = squeeze(Y_c(2,2,:));
    
    Ydd_cs = appendCellRow(Ydd_cs, Ydd_c);
    Ydq_cs = appendCellRow(Ydq_cs, Ydq_c);
    Yqd_cs = appendCellRow(Yqd_cs, Yqd_c);
    Yqq_cs = appendCellRow(Yqq_cs, Yqq_c);
    
end   
    bode_plot_single(fd0,Ydd_cs,Ydd_gs,"dd")
    bode_plot_single(fd0,Ydq_cs,Ydq_gs,"dq")
    bode_plot_single(fd0,Yqd_cs,Yqd_gs,"qd")
    bode_plot_single(fd0,Yqq_cs,Yqq_gs,"qq")
end

