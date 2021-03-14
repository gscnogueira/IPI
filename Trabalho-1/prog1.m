clear all
close all
pkg load image

    
Im= imread("test80.jpg");
Im2=dec_int(Im, 2,1);
Im3=dec_int(Im2,2,0);
imshow(Im)
pause;
imshow(Im2)
pause;
imshow(Im3)
