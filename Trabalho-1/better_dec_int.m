% author: Gabriel S. C. Nogueira
% e-mail: gab.nog94@gmail.com
% github: https://github.com/nosgueira

% Diminui a imagem por um fator n, caso op!=0
% Interpola a imagem por um fator n, caso op==0

function f = better_dec_int(Im, n, op)
    [h,w,l] = size(Im);
    if(op)
        f=Im(1:n:h,1:n:w,:);
    else
        new=uint8(zeros(h*n, w*n, l));
        d=n-1;
        [x, y]=deal(1,1);
        for i=1:h
            y=1;
            for j=1:w
                for k=1:l
                    new(x,y,k)=Im(i,j,k);
                    new(x,y+1:y+d,k)=mean(Im(i,j:min(j+1,w),k));
                    new(x+1:x+d,y,k)=mean(Im(i:min(i+1,h),j,k));
                    new(x+1:x+d,y+1:y+d,k)=mean(Im(i:min(i+1,h),j:min(j+1,w),k)(:));
                end 
                y+=n;
            end
            x+=n;
        end
        f = new;
    end
end

