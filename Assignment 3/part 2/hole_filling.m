% 9.15
img = zeros(10,7);
for i = 1:10
   if i==3||i==4||i==7||i==8||i==9
      img(i,2) = 1; 
   end
   if i==2||i==5||i==6||i==9
      img(i,3) = 1; 
   end
   if i==2||i==9
      img(i,4) = 1; 
   end
   if i==3||i==4||i==5||i==6||i==9
      img(i,5) = 1; 
   end
   if i==7||i==8
      img(i,6) = 1; 
   end
end

subplot(3,3,1);
imshow(img);
title('Image');

cimg=1-img;

subplot(3,3,2);
imshow(cimg);
title('Complement of Image');

se = [[0,1,0];[1,1,1];[0,1,0]];
subplot(3,3,3);
imshow(se);
title('Structuring Element');

X0 = zeros(10,7);
X0(3,3) = 1;
X1 = zeros(10,7);

subplot(3,3,4);
imshow(X0);
title('X0');

s = 5;

for i = 1:8
    temp = myDilation(X0,se);
    X1 = double(cimg&temp);
    X0 = X1;
    if i == 1||i == 2||i == 6||i == 8
    subplot(3,3,s);
    s = s+1;
    imshow(X1);
    title(['X',num2str(i)]);
    end

end

temp =  X1|img;
subplot(3,3,9);
imshow(temp);
title('X U A');

% 9.16
img = imread('circle.tif');
figure;
subplot(1,2,1);
imshow(img);
title('Image ');

pimg = pad(img,1);
pimg(1,1) = 0;
pimg(1,2) = 0;
pimg(2,1) = 0;
fpimg = imfill(pimg,'hole');
fimg = remove_pad(fpimg);

subplot(1,2,2);
imshow(fimg);
title('Hole Filled Image ');


function d = myDilation(I,s)
    [r,c] = size(I);
    dil_I = I;
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
                                    dil_I(ii,jj) = 1;
                                end
                            end
            
                        end
                    end
            end
            
        end
    end
    d = dil_I;
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

