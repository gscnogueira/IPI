% Aplica filtro de aguçamento na imagem Im
function f = edge_improv(Im, a)
    H = [0 -1 0; -1 4 -1; 0 -1 0];
    f = Im+a*imfilter(Im,H);
end
