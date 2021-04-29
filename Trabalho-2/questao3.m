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

% Binariza imagem original
figure;
bin = im2bw(original, graythresh(original)); imshow(bin );

% Preenche espaços desconectados
bin2 = bwareaopen(bin, 80); imshow(bin2);

% inverte a imagem para realizar preenchimento de buracos
bin2 = 1 - bin2; imshow(bin2);

% Realiza preenchimento de buracos
bin3 = imfill(bin2, 'holes'); imshow(bin3);

% Imagem é invertida novamente
bin3 = 1 - bin3;
imshow(bin3);

% Computa a segmentação watershed para a imagem binarizada
wsh = watershed(bin3); imshow(wsh);


% mostra resultado da segmentação 
mask = im2bw(~wsh, graythresh(wsh));
imshow(imoverlay(original, mask,[1 0 0] ));

% Aplica transformada de distância
dist = bwdist(bin3); imshow(dist,[]);

% Inverte a imagem
dist = 1 - dist; imshow(dist,[]);

% Computa a segmentação watershed para a transformada de distância
wsh = watershed(dist); imshow(wsh);

% mostra resultado da segmentação 
mask = im2bw(~wsh, graythresh(wsh));
imshow(imoverlay(original, mask,[1 0 0] ));
