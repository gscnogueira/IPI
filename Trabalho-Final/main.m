## Aluno    : Gabriel da Silva Corvino Nogueira
## Matrícula: 180113330
## Semestre : 2020/2
## Matéria  : Introdução ao Processamento de Imagens
#####################################################

pkg load image;
close all;
clear all;

cd ~/Code/UnB/IPI/Trabalho-Final/

% le imagem original
original = imread("Imagens/Figura3.jpg");
imshow(original);figure;

% Transforma a imagem em níveis de cinza
grayScale = rgb2gray(original);
imshow(grayScale);

% Aplica filtros de suavização na imagem em niveis de cinza
Im = medfilt2(grayScale);
Im = imsmooth(grayScale);
imshow(Im);

% Binariza a imagem
bw = im2bw(Im, graythresh(Im));
imshow(bw);
bw2 = imfill(bw, 'holes');
imshow(bw2);
bw3 = imopen(bw2, ones(5,5));
imshow(bw3);
bw4 = bwareaopen(bw3, 40);
imshow(bw4);

bw4_perim = (bwperim(bw4));
imshow(imoverlay(original, bw4_perim, [1 0 0 ]));

