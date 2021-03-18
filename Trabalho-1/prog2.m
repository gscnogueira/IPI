% author: Gabriel S. C. Nogueira
% e-mail: gab.nog94@gmail.com
% github: https://github.com/nosgueira


clear all
close all
clc
pkg load image

Car=imread("car.png");
Crowd=imread("crowd.png");
Uni=imread("university.png");


% define 4 valores de coeficiente gamma para a aplicação das técnicas power-law:

% gamma>1:
gamma1=4;
gamma2=1.5;
% gamma<1:
gamma3=0.5;
gamma4=0.1;


% Aplica os 4 coeficientes diferentes na imagem car.png

realceCar1=imadjust(Car, [],[],gamma1);
realceCar2=imadjust(Car, [],[],gamma2);
realceCar3=imadjust(Car, [],[],gamma3);
realceCar4=imadjust(Car, [],[],gamma4);

% Mostra melhor resultado obtido ao lado a imagem original
subplot(1,2,1)
imshow(Car);
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(realceCar2)
str=sprintf('Correção gamma ({\\gamma} = %.1f)',gamma2);
title(str, 'fontsize', 14,'interpreter', 'tex');
pause


% Aplica os 4 coeficientes diferentes na imagem crowd.png
realceCrowd1=imadjust(Crowd, [],[], gamma1);
realceCrowd2=imadjust(Crowd, [],[], gamma2);
realceCrowd3=imadjust(Crowd, [],[], gamma3);
realceCrowd4=imadjust(Crowd, [],[], gamma4);

% Mostra melhor resultado obtido ao lado a imagem original
subplot(1,2,1)
imshow(Crowd);
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(realceCrowd3)
str=sprintf('Correção gamma ({\\gamma} = %.1f)',gamma3);
title(str, 'fontsize', 14,'interpreter', 'tex');
pause

% Aplica os 4 coeficientes diferentes na imagem university.png
realceUni1=imadjust(Uni, [],[], gamma1);
realceUni2=imadjust(Uni, [],[], gamma2);
realceUni3=imadjust(Uni, [],[], gamma3);
realceUni4=imadjust(Uni, [],[], gamma4);

% Mostra melhor resultado obtido ao lado a imagem original
subplot(1,2,1)
imshow(Uni);
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(realceUni3)
str=sprintf('Correção gamma ({\\gamma} = %.1f)',gamma3);
title(str, 'fontsize', 14,'interpreter', 'tex');
pause

% A função im2uint8 é utilizada em código abaixo, pois a implementação da função histeq() feita pelo GNU Octave retorna uma matriz de números reais entre 0 e 1.

% Equaliza a imagem crowd.png
Crowdeq=im2uint8(histeq(Crowd) );

% Mostra a imagem equalizada ao lado da imagem original
subplot(1,2,1)
imshow(Crowd)
title("Imagem original", 'fontsize', 14);
subplot(1,2,2);
imshow(Crowdeq);
title("Imagem equalizada", 'fontsize', 14);
pause;

% Equaliza a imagem university.png
Unieq=im2uint8(histeq(Uni));

% Mostra a imagem equalizada ao lado da imagem original
subplot(1,2,1)
imshow(Uni)
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(Unieq);
title("Imagem equalizada", 'fontsize', 14);
pause;

% Equaliza a imagem car.png
Careq=im2uint8(histeq(Car));

% Mostra a imagem equalizada ao lado da imagem original
subplot(1,2,1)
imshow(Car)
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(Careq);
title("Imagem equalizada", 'fontsize', 14);
pause;

% calcula CDF para imagem car.png
n1=length(Car(:)); 
[nk1, rk1] = imhist(Car);
ps1 = nk1/n1;

for i = 1:length(ps1)
    sk1(i) = sum(ps1(1:i));
end

% Mostra imagem car.png juntamente com seu respectivo histograma e CDF
subplot(2,2,2);
imhist(Car);
title('Histograma','fontsize', 14)
subplot(2,2,4);
stem(sk1)
title('CDF (função de distribuição acumulada)','fontsize', 14)
xlabel('r_k')
ylabel('F(r_k)')

pause;


% calcula CDF para imagem car.png equalizada
n1=length(Car(:)); 

n2=length(Careq(:));
[nk2, rk2] = imhist(Careq);
ps2 = nk2/n2;
for i = 1:length(ps2)
    sk2(i) = sum(ps2(1:i));
end

% Mostra imagem car.png equalizada juntamente com seu respectivo histograma e CDF
subplot(1,2,1)
imshow(Careq)
title('Imagem equalizada','fontsize', 14)
subplot(2,2,2);
imhist(Careq);
title('Histograma','fontsize', 14)
subplot(2,2,4);
stem(sk2)
title('CDF (função de distribuição acumulada)','fontsize', 14)
xlabel('r_k')
ylabel('F(r_k)')
pause;




