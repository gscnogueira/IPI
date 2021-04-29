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

# Aplica suavização morfológica na imagem

function suavizada = suaviza (Im, d)
  abertura = imopen(Im, strel('square', d));
  fechamento = imclose(Im, strel('square', d));
  suavizada = abertura + fechamento - 1;
endfunction

Im = suaviza(letras, 2); imshow(Im, []);

# Aplicação da transformação bottom-hat
Im = imbothat(Im, strel('disk', 10, 0)); imshow(Im, []);

# A imagem é invertida
Im = 1 - Im; imshow(Im, []);

# Erosão e Dilatação são aplicadas na imagem
Im = imerode(Im, strel('square', 3 )); imshow(Im, []);
Im = imdilate(Im, strel('square', 2 )); imshow(Im, []);

# Binariza a imagem
binarizada = Im > graythresh(Im);

# Mostra a imagem
imshow(binarizada,[]);


