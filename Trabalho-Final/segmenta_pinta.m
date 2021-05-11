## Aluno    : Gabriel da Silva Corvino Nogueira
## Matrícula: 18011333
## Semestre : 2020/2
## Matéria  : Introdução ao Processamento de Imagens
#####################################################

function mancha = segmenta_pinta (pinta, r1, H, r2, P)

  ## Transforma a imagem em níveis de cinza
  grayScale = rgb2gray(pinta);
  imshow(grayScale);
  title('Imagem em níveis de cinza', 'fontsize', 16);
  pause;

  ## Aplica filtros de suavização na imagem em niveis de cinza
  Im = grayScale;
  Im = medfilt2(Im);
  Im = imsmooth(Im);
  imshow(Im);
  title('Imagem em níveis de cinza suavizada', 'fontsize', 16);
  pause;

  ## Binariza a imagem por limiar
  bw = im2bw(Im, graythresh(Im));
  imshow(bw);
  title('Imagem binarizada por limiar', 'fontsize', 16);
  pause;

  ## Limpar imagem e achar os perímetros
  bw2 = imopen(bw, strel('disk', r1, 0));
  bw3 = imclose(bw2, strel('disk', r1, 0));
  imshow(bw3);
  title('Imagem binarizada após tratementos morfológicos', 'fontsize', 16);
  pause;
  bw3_perim = (bwperim(bw3));
  imshow(imoverlay(pinta, bw3_perim, [1 0 0 ]));
  title('Bordas da imagem binarizada', 'fontsize', 16);
  pause;

  ## Encontra pontos de mínimo
  mask_em = imextendedmin(Im, H) ;
  imshow(mask_em);
  title('Pontos de mínimo da imagem', 'fontsize', 16);
  pause;

  ## Limpar pontos encontrados
  mask_em = imclose(mask_em, strel('disk', r2, 0));
  mask_em = imfill(mask_em, 'holes');
  mask_em = bwareaopen(mask_em, P);
  imshow(mask_em);
  title('Pontos de mínimo da imagem após limpeza', 'fontsize', 16);
  pause;
  imshow(imoverlay(Im, bw3_perim | mask_em, [1 0 0]));
  title('Pontos de mínimo da imagem após limpeza', 'fontsize', 16);
  pause;

  ## Fazer o complemento
  Im_c = imcomplement(Im);

  # Tornar pontos mínimos locais
  I_mod = imimposemin(Im_c, ~bw3 | mask_em);
  imshow(I_mod);
  title('Pontos de mínimo locais estabelecidos na imagem', 'fontsize', 16);
  pause;
  
  
  ## Watershed
  wsh = (watershed(I_mod));
  imshow(label2rgb( wsh ));
  title('Segmentação watershed', 'fontsize', 16);
  pause;

  ## Isolar mancha
  mancha = grayScale;
  mancha(wsh != maior_regiao(wsh))=0;
  imshow(mancha);
  title('Mancha Retirada da imagem', 'fontsize', 16);
  pause;
  
endfunction
