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

% Computa a média de intensidade dos pixels para cada uma das
% segmentações de mancha de vitiligo feitas
medias_pixels_vitiligo = [
						 mean(nonzeros(vitiligo1_seg))
						 mean(nonzeros(vitiligo2_seg))
						 mean(nonzeros(vitiligo3_seg))
						 mean(nonzeros(vitiligo4_seg))];

% Computa a média de intensidade dos pixels para cada uma das
% segmentações de pintas feitas
medias_pixels_pintas = [
						 mean(nonzeros(pinta1_seg))
						 mean(nonzeros(pinta2_seg))
						 mean(nonzeros(pinta3_seg))
						 mean(nonzeros(pinta4_seg))];


% Computa a média geral de insensidade dos pixels para as imagens de vitiligo
media_geral_vitiligo = mean(medias_pixels_vitiligo);

% Computa a média geral de insensidade dos pixels para as imagens de
% pintas na pele
media_geral_pintas   = mean(medias_pixels_pintas);


% Gera matrizes de coocorrência de níveis de cinza nas imagens
% (ignorando pixels com o valor 0)
glcm_vitiligo1 = graycomatrix(vitiligo1_seg, 256,  1, [0,45, 90, 135]);
glcm_vitiligo2 = graycomatrix(vitiligo2_seg, 256,  1, [0,45, 90, 135]);
glcm_vitiligo3 = graycomatrix(vitiligo3_seg, 256,  1, [0,45, 90, 135]);
glcm_vitiligo4 = graycomatrix(vitiligo4_seg, 256,  1, [0,45, 90, 135]);

glcm_pinta1 = graycomatrix(pinta1_seg, 256,  1, [0,45, 90, 135]);
glcm_pinta2 = graycomatrix(pinta2_seg, 256,  1, [0,45, 90, 135]);
glcm_pinta3 = graycomatrix(pinta3_seg, 256,  1, [0,45, 90, 135]);
glcm_pinta4 = graycomatrix(pinta4_seg, 256,  1, [0,45, 90, 135]);

% Computa descritores de Haralick para cada uma das matrizes
haralick_vitiligo = [get_haralick_features(glcm_vitiligo1)];
haralick_vitiligo = [haralick_vitiligo get_haralick_features(glcm_vitiligo2)];
haralick_vitiligo = [haralick_vitiligo get_haralick_features(glcm_vitiligo3)];
haralick_vitiligo = [haralick_vitiligo get_haralick_features(glcm_vitiligo4)];


% Computa descritores de Haralick para cada uma das matrizes
haralick_pintas = [get_haralick_features(glcm_pinta1)];
haralick_pintas = [haralick_pintas get_haralick_features(glcm_pinta2)];
haralick_pintas = [haralick_pintas get_haralick_features(glcm_pinta3)];
haralick_pintas = [haralick_pintas get_haralick_features(glcm_pinta4)];

% Computa média de cada um dos descritores para os dois grupos
media_haralick_vitiligo = [mean(haralick_vitiligo(1,:))
						   mean(haralick_vitiligo(2,:))
						   mean(haralick_vitiligo(3,:))];

media_haralick_pintas =   [mean(haralick_pintas(1,:))
						   mean(haralick_pintas(2,:))
						   mean(haralick_pintas(3,:))];


% Mostra resultados
medias_pixels_vitiligo
media_geral_vitiligo

medias_pixels_pintas
media_geral_pintas

haralick_vitiligo
media_haralick_vitiligo

haralick_pintas
media_haralick_pintas
