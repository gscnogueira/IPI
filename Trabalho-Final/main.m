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
imshow(original);
figure;

% Transforma a imagem em níveis de cinza
grayScale = rgb2gray(original);
imshow(grayScale);

% Aplica filtros de suavização na imagem em niveis de cinza
Im = medfilt2(grayScale);
Im = imsmooth(grayScale);
imshow(Im);

% Binariza a imagem por limiar
bw = im2bw(Im, graythresh(Im));
imshow(bw);

% Limpar imagem e achar os perímetros
bw2 = imfill(bw, 'holes');
imshow(bw2);
bw3 = imopen(bw2, strel('disk', 3, 0));
imshow(bw3);
bw4 = bwareaopen(bw3, 40);
imshow(bw4);
bw5 = imclose(bw4, strel('disk', 10, 0));
imshow(bw5);
bw5_perim = (bwperim(bw5));
imshow(imoverlay(original, bw5_perim, [1 0 0 ]));

% Isolar mancha;
nova = grayScale;
nova(bw5==0) = 0;
imshow(nova);

% Tirar a média dos pixeis
media = mean(nonzeros(nova));
media
