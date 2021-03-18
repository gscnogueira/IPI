% author: Gabriel S. C. Nogueira
% e-mail: gab.nog94@gmail.com
% github: https://github.com/nosgueira

clear all
close all
clc
% carrega pacote image no octave, caso necessário, comentar;
pkg load image

    
Im= imread("test80.jpg");


% Mostra imagem original e imagem reduzida
subplot(1,2,1)
imshow(Im)
title(sprintf('Imagem original (%dx%d px)',size(Im)(1),size(Im)(2)), 'FontSize',14)
Imdec=dec_int(Im,2,1);
subplot(1,2,2)
imshow(Imdec)
title(sprintf( 'Imagem reduzida (%dx%d px)',size(Imdec)(1), size(Imdec)(2) ), 'FontSize', 14)

pause


% Imagem reduzida é interpolada
Imint=dec_int(Imdec,2,0);

%Mostra imagem interpolada e imagem reduzida
subplot(1,2,1)
imshow(Imint)
title(sprintf( 'Imagem interpolada (%dx%d px)',size(Imint)(1), size(Imint)(2) ), 'FontSize',14)

pause


% Mostra imagem original ao lado da imagem interpolada
subplot(1,2,2)
imshow(Im)
title(sprintf( 'Imagem original (%dx%d px)',size(Im)(1), size(Im)(2) ), 'FontSize',14)
pause


% realiza redução bicúbica na imagem original
Imdec2=imresize(Im,0.5,'bicubic');

% Mostra imagem original ao lado da imagem que sofreu redução bicúbica
subplot(1,2,1)
imshow(Im)
title(sprintf( 'Imagem original (%dx%d px)',size(Im)(1), size(Im)(2) ), 'FontSize',14)
subplot(1,2,2)
imshow(Imdec2)
title(sprintf('Imagem reduzida (redução bicúbica) (%dx%d px)',size(Imdec2)(1) ,size(Imdec2)(2)), 'FontSize',14)

pause


% realiza interpolação bicúbica na imagem que sofreu redução bicúbica
Imint2=imresize(Imdec2,2,'bicubic');


% Mostra imagem que sofreu interpolação bicúbica ao lado da imagem que sofreu redução bicúbica
subplot(1,2,1)
imshow(Imint2)
title(sprintf('Imagem interpolada (interpolação bicúbica) (%dx%d px)',size(Imint2)(1) ,size(Imint2)(2)), 'FontSize',14)
pause


% Mostra imagem que sofreu interpolação bicúbica ao lado da imagem original
subplot(1,2,2)
imshow(Im)
title(sprintf( 'Imagem original (%dx%d px)',size(Im)(1), size(Im)(2) ), 'FontSize',14)
pause

% Aplica filtro de aguçamento na primeira imagem interpolada
ImintAgu=edge_improv(Imint,0.3);

% Compara a imagem antes e depois do filtro de aguçamento ser aplicado
subplot(1,2,1)
imshow(Imint)
title(sprintf( 'Imagem interpolada (%dx%d px)',size(Imint)(1), size(Imint)(2) ), 'FontSize',14)
subplot(1,2,2)
imshow(ImintAgu)
title(sprintf( 'Imagem interpolada após aguçamento (%dx%d px)',size(ImintAgu)(1), size(ImintAgu)(2) ), 'FontSize',14)
pause

% Aplica filtro de aguçamento na imagem que sofreu interpolação bicúbica
Imint2Agu=edge_improv(Imint2,1);

% Compara a imagem antes e depois do filtro de aguçamento ser aplicado
subplot(1,2,1)
imshow(Imint2)
title(sprintf( 'Imagem interpolada (interpolação bicúbica)(%dx%d px)',size(Imint2)(1), size(Imint2)(2) ), 'FontSize',14)
subplot(1,2,2)
imshow(Imint2Agu)
title(sprintf( 'Imagem interpolada (interpolação bicúbica) após aguçamento (%dx%d px)',size(Imint2Agu)(1), size(Imint2Agu)(2) ), 'FontSize',14)
pause

% Aplica novo método de interpolação à imagem reduzida por dec_int
% (o processo realizado pela função better_dec_int pode demorar em torno de um minuto)

Imint3= better_dec_int(Imdec,2,0);
subplot(1,2,1)
imshow(Imdec)
title(sprintf( 'Imagem reduzida (%dx%d px)',size(Imdec)(1), size(Imdec)(2) ), 'FontSize', 14)


subplot(1,2,2)

imshow(Imint3)
title(sprintf( 'Imagem interpolada por meio de novo método (%dx%d px)',size(Imint3)(1), size(Imint3)(2) ), 'FontSize', 14)

 pause;

close all;
