clear all
close all
pkg load image

function  f = dec_int(Im, n)
   [h,w,d] = size(Im);
 f=Im(1:n:h, 1:n:w, :);
endfunction


Im= imread("test80.jpg");
Im2=dec_int(Im, 2);
imshow(Im)
figure;
imshow(Im2)







