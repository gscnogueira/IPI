## Aluno    : Gabriel da Silva Corvino Nogueira
## Matrícula: 180113330
## Semestre : 2020/2
## Matéria  : Introdução ao Processamento de Imagens
#####################################################

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

## 2.2 Reduzir variações no fundo da imagem
