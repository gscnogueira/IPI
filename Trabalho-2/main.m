
close all;
clear all;
cd ~/Code/UnB/IPI/Trabalho-2/

## Questão 1:

letras = im2double( imread('imagens/morf_test.png') );
imshow(letras, []);

## 2.1 Binarizar a imagem diretamente
binarizada = letras > graythresh(letras);
figure;
imshow(binarizada, []);
