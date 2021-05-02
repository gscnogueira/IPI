## Aluno    : Gabriel da Silva Corvino Nogueira
## Matrícula: 180113330
## Semestre : 2020/2
## Matéria  : Introdução ao Processamento de Imagens
#####################################################

close all;
clear all;
pkg load image;

% Lê imagem "img_cells.jpg"
original = imread("imagens/img_cells.jpg"); imshow(original)
pause;

% Binariza imagem original
figure;
bin = im2bw(original, graythresh(original)); imshow(bin );
pause;

% Preenche espaços desconectados
bin2 = bwareaopen(bin, 80); imshow(bin2);
pause;

% inverte a imagem para realizar preenchimento de buracos
bin2 = 1 - bin2;

% Realiza preenchimento de buracos
bin3 = imfill(bin2, 'holes');

% Imagem é invertida novamente
bin3 = 1 - bin3;
imshow(bin3);
pause;

% Computa a segmentação watershed para a imagem binarizada
wsh = watershed(bin3); imshow(wsh);
pause;


% mostra resultado da segmentação 
mask = ~wsh;
overlay1 = imoverlay(original, mask,[1 0 0]);
imshow(overlay1);
pause;

% Aplica transformada de distância
dist = bwdist(bin3); imshow(dist,[]);
pause;

% Inverte a imagem
dist = 1 - dist; imshow(dist,[]);
pause;

% Computa a segmentação watershed para a transformada de distância
wsh = watershed(dist); imshow(wsh);
pause;

% mostra resultado da segmentação 
mask = ~wsh;
overlay2 = imoverlay(original, mask,[1 0 0] );
imshow(overlay2);
pause;
close all;
