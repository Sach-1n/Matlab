
% Figure 9.13
img = ones(5,10);
img(1,4) = 0;
img(2,4) = 0;
img(1,10) = 0;
img(2,10) = 0;


subplot(2,2,1);
imshow(img);
title('Orignal Image');

se = ones(3);
subplot(2,2,2);
imshow(se);
title('Structuring Element 3x3');

p_img = pad(img,0);
p_eimg = myErosion(p_img,se);
eimg = remove_pad(p_eimg);
subplot(2,2,3);
imshow(eimg);
title('Erosion of Image');

boundary = img-eimg;
subplot(2,2,4);
imshow(boundary);
title('Boundary of Image');

% Figure 9.14
img = imread('man.tif');
figure;
subplot(1,2,1);
imshow(img);
title('Orignal Image');

eimg = myErosion(img,se);
bound = img - eimg;

subplot(1,2,2);
imshow(bound);
title('Boundary of Image');

function d = myErosion(I,s)
    [r,c] = size(I);
    ero_I = I;
    [rs,cs] = size(s);
    r_mid = floor((rs+1)/2);
    c_mid = floor((cs+1)/2);
    for i = 1:r
        for j = 1:c
            if I(i,j) == 1
                    for is = 1:rs
                        for js = 1:cs
                            if s(is,js) == 1
                                ii = i + is - r_mid;
                                jj = j + js - c_mid;
                                if ii>0 && ii<=r && jj>0 && jj<=c
                                    
                                    if I(ii,jj) == 0
                                        ero_I(i,j) = 0;
                                        break;
                                    end
                                end
                            end
            
                        end
                    end
            end
            
        end
    end
    d = ero_I;
end

function p = pad(I,n)
    
[r,c] = size(I);
im = zeros(r+2,c+2);
im(:,:) = n;
for i=1:r
   for j=1:c
      im(i+1,j+1) = I(i,j); 
   end
end

p = im;
end

function p = remove_pad(I)
    
[r,c] = size(I);
im = zeros(r-2,c-2);
x=1;
for i=2:r-1
    y=1;
   for j=2:c-1
      im(x,y) = I(i,j);
      y = y+1;
   end
   x = x+1;
end

p = im;
end
