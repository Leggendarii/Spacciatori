function [f0_g, Ydd_g, Ydq_g, Yqd_g, Yqq_g] = leggi_dati(file_name)

T_g = readtable(file_name, 'Delimiter', '\t', 'ReadVariableNames', true, 'VariableNamingRule', 'preserve', 'NumHeaderLines', 0);
T_g.Properties.VariableNames = {'f', 'Ciao_2_dd', 'Ciao_2_dq', 'Ciao_2_qd', 'Ciao_2_qq'};

%% Conversione in matrice

cell_g = table2cell(T_g);


complexMatrix_g = cell2mat(cellfun(@(x) eval(x), cell_g, 'UniformOutput', false));


f0_g = complexMatrix_g(:,1)';
Ydd_g = complexMatrix_g(:,2)';
Ydq_g = complexMatrix_g(:,3)';
Yqd_g = complexMatrix_g(:,4)';
Yqq_g = complexMatrix_g(:,5)';

end