clear all
close all
pkg load image

    
Im= imread("test80.jpg");
imshow(Im)
figure
Imdec=dec_int(Im,2,1);
% imshow(Imdec)
% figure
Imint=dec_int(Imdec,2,0);
imshow(Imint)
figure
Imdec2=imresize(Im,0.5,'bicubic');
% imshow(Imdec2)
% figure
Imint2=imresize(Imdec2,2,'bicubic');
imshow(Imint2)
figure
imshow(edge_improv(Imint))
figure
imshow(edge_improv(Imint2))

