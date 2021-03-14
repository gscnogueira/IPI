function f = edge_improv(Im)
    H = [0 -1 0; -1 5 -1; 0 -1 0];
    f = imfilter(Im,H);
end
