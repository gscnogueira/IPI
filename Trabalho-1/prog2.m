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

% 2.1 Testar o realce power-law (correção gamma) com pelos menos 2 valores diferentes maiores que um  e 2 valores diferentes menores que um, para cada imagem (justifique porque a decisão de utilizar valores positivos ou negativos no relatório). Mostrar o melhor resultado 

% definindo 4 valores de coeficiente gamma para a aplicação das técnicas power-law:

% gamma>1:
gamma1=4;
gamma2=1.5;
% gamma<1:
gamma3=0.5;
gamma4=0.1;


% Aplica os 4 coeficientes diferentes na imagem car.png

realceCar1=imadjust(Car, [],[],gamma1);

subplot(1,2,1)
imshow(Car);
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(realceCar1)
str=sprintf('Correção gamma ({\\gamma} = %.1f)',gamma1);
title(str, 'fontsize', 14,'interpreter', 'tex');


realceCar2=imadjust(Car, [],[],gamma2);
pause

subplot(1,2,2)
imshow(realceCar2)
title(sprintf("correção gamma ({\\gamma} = %.1f)",gamma2), 'fontsize', 14);

realceCar3=imadjust(Car, [],[],gamma3);
pause

subplot(1,2,2)
imshow(realceCar3)
title(sprintf("correção gamma ({\\gamma} = %.1f)",gamma3), 'fontsize', 14);

realceCar4=imadjust(Car, [],[],gamma4);
pause

subplot(1,2,2)
imshow(realceCar4)
title(sprintf("correção gamma ({\\gamma} = %.1f)",gamma4), 'fontsize', 14);
pause

% Aplica os 4 coeficientes diferentes na imagem crowd.png

realceCrowd1=imadjust(Crowd, [],[], gamma1);

subplot(1,2,1)
imshow(Crowd);
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(realceCrowd1)
str=sprintf('Correção gamma ({\\gamma} = %.1f)',gamma1);
title(str, 'fontsize', 14,'interpreter', 'tex');


realceCrowd2=imadjust(Crowd, [],[], gamma2);
pause

subplot(1,2,2)
imshow(realceCrowd2)
title(sprintf("Correção gamma ({\\gamma} = %.1f)",gamma2), 'fontsize', 14);

realceCrowd3=imadjust(Crowd, [],[], gamma3);
pause

subplot(1,2,2)
imshow(realceCrowd3)
title(sprintf("Correção gamma ({\\gamma} = %.1f)",gamma3), 'fontsize', 14);

realceCrowd4=imadjust(Crowd, [],[], gamma4);
pause

subplot(1,2,2)
imshow(realceCrowd4)
title(sprintf("Correção gamma ({\\gamma} = %.1f)",gamma4), 'fontsize', 14);
pause

% Aplica os 4 coeficientes diferentes na imagem university.png

realceUni1=imadjust(Uni, [],[], gamma1);

subplot(1,2,1)
imshow(Uni);
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(realceUni1)
str=sprintf('Correção gamma ({\\gamma} = %.1f)',gamma1);
title(str, 'fontsize', 14,'interpreter', 'tex');


realceUni2=imadjust(Uni, [],[], gamma2);
pause

subplot(1,2,2)
imshow(realceUni2)
title(sprintf("Correção gamma ({\\gamma} = %.1f)",gamma2), 'fontsize', 14);

realceUni3=imadjust(Uni, [],[], gamma3);
pause

subplot(1,2,2)
imshow(realceUni3)
title(sprintf("Correção gamma ({\\gamma} = %.1f)",gamma3), 'fontsize', 14);

realceUni4=imadjust(Uni, [],[], gamma4);
pause

subplot(1,2,2)
imshow(realceUni4)
title(sprintf("Correção gamma ({\\gamma} = %.1f)",gamma4), 'fontsize', 14);
pause


% 2.2) Equalizar as três imagens, mostrar o resultado das três imagens. E de uma delas mostrar o histograma e CDF (função de distribuição acumulada) antes e depois da equalização.

Crowdeq=im2uint8(histeq(Crowd) );

subplot(1,2,1)
imshow(Crowd)
title("Imagem original", 'fontsize', 14);
subplot(1,2,2);
imshow(Crowdeq);
title("Imagem equalizada", 'fontsize', 14);
pause;

Unieq=im2uint8(histeq(Uni));

subplot(1,2,1)
imshow(Uni)
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(Unieq);
title("Imagem equalizada", 'fontsize', 14);
pause;

Careq=im2uint8(histeq(Car));

subplot(1,2,1)
imshow(Car)
title("Imagem original", 'fontsize', 14);
subplot(1,2,2)
imshow(Careq);
title("Imagem equalizada", 'fontsize', 14);
pause;

% calcula CDF para imagem original

n1=length(Car(:)); 
[nk1, rk1] = imhist(Car);
ps1 = nk1/n1;

for i = 1:length(ps1)
    sk1(i) = sum(ps1(1:i));
end

subplot(2,2,2);
imhist(Car);
title('Histograma','fontsize', 14)
subplot(2,2,4);
stem(sk1)
title('CDF (função de distribuição acumulada)','fontsize', 14)
xlabel('r_k')
ylabel('F(r_k)')

pause;


% calcula CDF para imagem equalizada

n2=length(Careq(:));
[nk2, rk2] = imhist(Careq);
ps2 = nk2/n2;
for i = 1:length(ps2)
    sk2(i) = sum(ps2(1:i));
end

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




