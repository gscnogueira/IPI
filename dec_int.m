function f = dec_int(Im, n,op)
    [h,w,d] = size(Im);
    if(op)
        f=Im(1:n:h,1:n:w,:);
    else
        new=uint8(zeros(h*n, w*n, d));
        d=n-1;
        [x, y]=deal(1,1);
        for i=1:h
            y=1;
            for j=1:w
                new(x:x+d, y:y+d,1)=Im(i,j,1);
                new(x:x+d, y:y+d,2)=Im(i,j,2);
                new(x:x+d, y:y+d,3)=Im(i,j,3);
                y+=n;
            end
            x+=n;
        end
        f = new;
    end
end
