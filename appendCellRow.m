function C = appendCellRow(C, varargin)
    % Converte gli input in cell array di colonne e concatena verticalmente
    C = [C; varargin(:)];
end