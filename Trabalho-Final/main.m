## Aluno    : Gabriel da Silva Corvino Nogueira
## Matrícula: 180113330
## Semestre : 2020/2
## Matéria  : Introdução ao Processamento de Imagens
#####################################################

pkg load image;
close all;
clear all;

% Lê imagens de manchas de vitiligo
vitiligo1 = imread("Imagens/Vitiligo1.jpg");
vitiligo2 = imread("Imagens/Vitiligo2.jpg");
vitiligo3 = imread("Imagens/Vitiligo3.png");
vitiligo4 = imread("Imagens/Vitiligo4.png");

brilho_vitiligo = [];
brilho_pintas = [];

% Segmenta as manchas de vitiligo do resto de suas respctivas imagens
vitiligo1_seg = segmenta_vitiligo(vitiligo1, 1, 2, 10, 25, 10, 400);
vitiligo2_seg = segmenta_vitiligo(vitiligo2, 0, 30, 1, 40, 4, 200);
vitiligo3_seg = segmenta_vitiligo(vitiligo3, 1, 5, 5, 1, 5, 1700);
vitiligo4_seg = segmenta_vitiligo(vitiligo4, 0, 5, 5, 15, 1, 0);

% Lê imagens de pintas
pinta1 = imread("Imagens/Pinta1.jpg");
pinta2 = imread("Imagens/Pinta2.jpeg");
pinta3 = imread("Imagens/Pinta3.jpg");
pinta4 = imread("Imagens/Pinta4.jpg");

% Segmenta as pintas do resto de suas respctivas imagens
pinta1_seg = segmenta_pinta(pinta1, 10, 3, 4, 2000);
pinta2_seg = segmenta_pinta(pinta2, 10, 3, 4, 1250);
pinta3_seg = segmenta_pinta(pinta3, 10, 10, 4, 60);
pinta4_seg = segmenta_pinta(pinta4, 10, 5, 4, 800);


% Computa a média de intensidade dos pixeis para cada uma das
% segmentações de mancha de vitiligo feitas
medias_pixeis_vitiligo = [
						 mean(nonzeros(vitiligo1_seg))
						 mean(nonzeros(vitiligo2_seg))
						 mean(nonzeros(vitiligo3_seg))
						 mean(nonzeros(vitiligo4_seg))];

% Computa a média de intensidade dos píxeis para cada uma das
% segmentações de pintas feitas
medias_pixeis_pintas = [
						 mean(nonzeros(pinta1_seg))
						 mean(nonzeros(pinta2_seg))
						 mean(nonzeros(pinta3_seg))
						 mean(nonzeros(pinta4_seg))];

% Computa a média geral de insensidade dos píxeis para as imagens de vitiligo
media_geral_vitiligo = mean(medias_pixeis_vitiligo)

% Computa a média geral de insensidade dos píxeis para as imagens de
% pintas na pele
media_geral_pintas   = mean(medias_pixeis_pintas)
