## usage: media = get_brilho_vitiligo (max_min, r1, H, r2, P)
##
##
function mancha = segmenta_vitiligo ( mancha,max, r1,r2, H, r3, P)

  ## Transforma a imagem em níveis de cinza
  grayScale = rgb2gray(mancha);
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
  bw3 = imclose(bw2, strel('disk', r2, 0));
  bw4 = imfill(bw3, 'holes');
  imshow(bw4);
  title('Imagem binarizada após tratementos morfológicos', 'fontsize', 16);
  pause;
  bw4_perim = (bwperim(bw4));
  imshow(imoverlay(mancha, bw4_perim, [1 0 0 ]));
  title('Bordas da imagem binarizada', 'fontsize', 16);
  pause;

  if(max)
	## Econtrar pontos de máximo
	mask_em = imextendedmax(Im, H);
	estado = ' máximo';
  else
	## Econtrar pontos de mínimo
	mask_em = imextendedmin(Im, H);
	estado = ' mínimo';
  end
  imshow(mask_em);
  str = strcat('Pontos de',estado, ' da imagem');
  title(str, 'fontsize', 16);
  pause;

  ## Limpar pontos encontrados
  mask_em = imclose(mask_em, strel('disk', r3, 0));
  mask_em = imopen(mask_em, strel('disk', r3, 0));
  mask_em = bwareaopen(mask_em, P);
  mask_em = imfill(mask_em, 'holes');
  imshow(mask_em);
  str = strcat('Pontos de',estado, ' da imagem após limpeza');
  title(str, 'fontsize', 16);
  pause;
  imshow(imoverlay(Im, bw4_perim | mask_em, [1 0 0]));
  title(str, 'fontsize', 16);
  pause;

  ## Fazer complemento 
  Im_c = imcomplement(Im);
  
  # Tornar pontos mínimos locais
  I_mod = imimposemin(Im_c, ~bw4 | mask_em);
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
