## Aluno    : Gabriel da Silva Corvino Nogueira
## Matrícula: 180113330
## Semestre : 2020/2
## Matéria  : Introdução ao Processamento de Imagens
#####################################################

close all;
clear all;

pkg load image;

%% Lê a imagem "cookies.tif"
original = im2double( imread("imagens/cookies.tif") );
imshow(original, []);
pause;

%% Binariza a imagem
limiar = graythresh(original);
figure;
mask = im2bw(original, limiar); imshow(mask, []);
pause;

% Elimina por completo biscoito mordido
ES = strel('disk', 60, 0);
mask = imerode(mask, ES); imshow(mask, []);
pause;
								%
% Recupera a forma inicial do biscoito que não foi mordido
mask = imdilate(mask, ES); imshow(mask,[]);
pause;

% Inverter mascara binária para que o fundo da imagem final seja branco
mask = 1 - mask; imshow(mask);
pause;

% Aplica mascara binária na imagem original
final = imadd(mask, original);

% Mostra imagem resultante 
imshow(final);
pause;
close all;
