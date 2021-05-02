## Aluno    : Gabriel da Silva Corvino Nogueira
## Matrícula: 180113330
## Semestre : 2020/2
## Matéria  : Introdução ao Processamento de Imagens
#####################################################

pkg load image;
close all;
clear all;

## Questão 1:

letras = im2double( imread('imagens/morf_test.png') );
imshow(letras, []);
pause;

## 2.1 Binarizar a imagem diretamente

binarizada = letras > graythresh(letras);
figure;
imshow(binarizada, []);
pause;

## 2.2 Reduzir variações no fundo da imagem

# Aplica suavização morfológica na imagem

function suavizada = suaviza (Im, d)
  abertura = imopen(Im, strel('square', d));
  fechamento = imclose(Im, strel('square', d));
  suavizada = abertura + fechamento - 1;
endfunction

Im = suaviza(letras, 2); imshow(Im, []);
pause;

# Aplicação da transformação bottom-hat
Im = imbothat(Im, strel('disk', 10, 0));

# A imagem é invertida
Im = 1 - Im;

# Erosão e Dilatação são aplicadas na imagem
Im = imerode(Im, strel('square', 3 ));
Im = imdilate(Im, strel('square', 2 ));
imshow(Im, []);
pause;

# Binariza a imagem
binarizada = Im > graythresh(Im);

# Mostra a imagem
imshow(binarizada,[]);
pause;
close all;


