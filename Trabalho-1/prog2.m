clear all
close all
pkg load image
Car=imread("car.png");
Crowd=imread("crowd.png");
Uni=imread("university.png");

% 2.1) Testar o realce power-law (correção gamma) com pelos menos 2 valores diferentes maiores que um  e 2 valores diferentes menores que um, para cada imagem (justifique porque a decisão de utilizar valores positivos ou negativos no relatório). Mostrar o melhor resultado para cada imagem.

realceCar1=imadjust(Car, [],[], 4);
realceCar2=imadjust(Car, [],[], 1.5);
realceCar3=imadjust(Car, [],[], 0.5);
realceCar4=imadjust(Car, [],[], 0.1);

realceCrowd1=imadjust(Crowd, [],[], 4);
realceCrowd2=imadjust(Crowd, [],[], 1.5);
realceCrowd3=imadjust(Crowd, [],[], 0.5);
realceCrowd4=imadjust(Crowd, [],[], 0.1);

realceUni1=imadjust(Uni, [],[], 4);
realceUni2=imadjust(Uni, [],[], 1.5);
realceUni3=imadjust(Uni, [],[], 0.5);
realceUni4=imadjust(Uni, [],[], 0.1);
% imshow(Car);
% figure;
% imshow(realceCar1);
% figure;
% imshow(realceCar2);
% figure;
% imshow(realceCar3);
% figure;
% imshow(realceCar4);

% imshow(Crowd);
% figure;
% imshow(realceCrowd1);
% figure;
% imshow(realceCrowd2);
% figure;
% imshow(realceCrowd3);
% figure;
% imshow(realceCrowd4);

% imshow(Uni);
% figure;
% imshow(realceUni1);
% figure;
% imshow(realceUni2);
% figure;
% imshow(realceUni3);
% figure;
% imshow(realceUni4);

%2.2) Equalizar as três imagens, mostrar o resultado das três imagens. E de uma delas mostrar o histograma e CDF (função de distribuição acumulada) antes e depois da equalização.

Crowdeq=im2uint8(histeq(Crowd) );
% imshow(Crowd); figure;
% imshow(Crowdeq);

% pause; close all;

Unieq=im2uint8(histeq(Uni));
% imshow(Uni); figure;
% imshow(Unieq);

% pause; close all;

Careq=im2uint8(histeq(Car));
% imshow(Car); figure;
% imshow(Careq);

n1=length(Car(:));
[nk1, rk1] = imhist(Car);
ps1 = nk1/n1;

for i = 1:length(ps1)
    sk1(i) = sum(ps1(1:i));
end

stem(sk1)
pause;


n2=length(Careq(:));
[nk2, rk2] = imhist(Careq);
ps2 = nk2/n2;
for i = 1:length(ps2)
    sk2(i) = sum(ps2(1:i));
end

stem(sk2)




