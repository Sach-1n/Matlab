img = [ 0 0 0 0 0 1 0 0 0 0 0;
        0 0 0 1 1 0 1 1 0 0 0;
        0 0 1 0 0 0 0 0 1 0 0;
        0 1 0 0 0 0 0 0 0 1 0;
        0 1 0 0 0 0 0 0 0 1 0;
        1 0 0 0 0 0 0 0 0 0 1;
        0 1 0 0 0 0 0 0 0 1 0;
        0 1 0 0 0 0 0 0 0 1 0;
        0 0 1 0 0 0 0 0 1 0 0;
        0 0 0 1 1 0 1 1 0 0 0;
        0 0 0 0 0 1 0 0 0 0 0; ];

subplot(1,2,1);
imshow(img);
title('Circle');

cen_img = center(img);

subplot(1,2,2);
imshow(cen_img);
title('Centred Circle');

img = imread('circle.png');
figure,imshow(img);
title('Circle');

gray = rgb2gray(img);

sob = edge(gray,'Sobel');
figure,imshow(sob);
title('Sobel Edge Detection');

cen_sob = center(sob);
figure,imshow(cen_sob);
title('Center of Image');






function cen = center(img)
[r,c] = size(img);

p = r<c;

if p == 1
    p = r;
else
    p = c;
end

for i = 1:p
img = pad(img,0);
end
ra = floor(p/2);
dim = zeros(r+2*p,c+2*p,ra);


for radius = 1:ra
    for i = 1:r+p
        for j = 1:c+p
            if img(i,j) == 1
                dim(:,:,radius) = drw_circle(dim(:,:,radius),i,j,radius);
            end
        end
    end
end

max = 0;

for radius = 1:ra
    for i = 1:r+p
        for j = 1:c+p
            if dim(i,j,radius) > max
                max = dim(i,j,radius);
                savei = i;
                savej = j;
            end
        end
    end
end

savei = savei - p;
savej = savej - p;

for i = 1:p
img = remove_pad(img);
end

img(savei,savej) = 1;
cen = img;

end

function d = drw_circle(img,ci,cj,rad)
i = ci+rad;
j = cj;
while j < cj + rad
    right_i = i;
    right_j = j+1;
    up_i = i - 1;
    up_j = j + 1;
    
    up = ((up_i - ci)^2+(up_j - cj)^2)^0.5;
    right = ((right_i - ci)^2+(right_j - cj)^2)^0.5;
    
    if abs(up-rad) < abs(right-rad)
        i = up_i;
        j = up_j;
    else
        i = right_i;
        j = right_j;
    end
    img(i,j) = img(i,j)+1;
end

while j > cj 
    left_i = i-1;
    left_j = j-1;
    up_i = i-1;
    up_j = j ;
    
    up = ((up_i - ci)^2+(up_j - cj)^2)^0.5;
    left = ((left_i - ci)^2+(left_j - cj)^2)^0.5;
    
    if abs(up-rad) < abs(left-rad)
        i = up_i;
        j = up_j;
    else
        i = left_i;
        j = left_j;
    end
    img(i,j) = img(i,j)+1;
end

while j > cj-rad  
    left_i = i;
    left_j = j - 1;
    down_i = i + 1;
    down_j = j - 1 ;
    
    down = ((down_i - ci)^2+(down_j - cj)^2)^0.5;
    left = ((left_i - ci)^2+(left_j - cj)^2)^0.5;
    
    if abs(down-rad) < abs(left-rad)
        i = down_i;
        j = down_j;
    else
        i = left_i;
        j = left_j;
    end
    img(i,j) = img(i,j)+1;
end

while j < cj  
    right_i = i + 1;
    right_j = j + 1;
    down_i = i + 1;
    down_j = j ;
    
    down = ((down_i - ci)^2+(down_j - cj)^2)^0.5;
    right = ((right_i - ci)^2+(right_j - cj)^2)^0.5;
    
    if abs(down-rad) < abs(right-rad)
        i = down_i;
        j = down_j;
    else
        i = right_i;
        j = right_j;
    end
    img(i,j) = img(i,j)+1;
end

d = img;

end

function p = pad(I,n)
    
[dr,c] = size(I);
im = zeros(dr+2,c+2);
im(:,:) = n;
for i=1:dr
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
    



