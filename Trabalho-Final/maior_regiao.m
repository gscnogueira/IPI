% Retorna o 'label' da maior região encontrada a partir da segmentação
% watershed, sem contar com o fundo.

function regiao = maior_regiao (wsh)
  ocr = wsh(:);
  labels = unique(ocr);
  count = histc(ocr, labels);
  sorted = sort(count, 'descend');
  regiao = find(count == sorted(2)) - 1;
endfunction
