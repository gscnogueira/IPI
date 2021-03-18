% author: Gabriel S. C. Nogueira
% e-mail: gab.nog94@gmail.com
% github: https://github.com/nosgueira

% Aplica filtro de aguçamento na imagem Im com intensidade int

function f = edge_improv(Im, int)
    H = [0 -1 0; -1 4 -1; 0 -1 0];
    f = Im+int*imfilter(Im,H);
end
