o_img = imread('me.jpg');

r = o_img(:,:,1);
g = o_img(:,:,2);
b = o_img(:,:,3);

img = 0.3*r + 0.6*g + 0.1*b;
imshow(img);
title('Original Image');


no_of_lvl = input('Write the Desired Intensity Levels : ');
add = floor(255/(no_of_lvl - 1));

lvl = zeros(1,no_of_lvl);
for i = 2:no_of_lvl
    lvl(i) = lvl(i-1) + add;
end

[row, col] = size(img);
temp = zeros(1,no_of_lvl);
newimg = uint8(zeros(row,col)); 

for i = 1:row
    for j = 1:col
    for k = 1:no_of_lvl
        mi = double(img(i,j));
        temp(k) = abs(lvl(k) - mi);
        if k == 1
            min = temp(k);
            save = 1;
        end
        if  (temp(k) < min) == 1
                min = temp(k);
                save = k;
        end
    end
    pix = uint8(lvl(save));
    newimg(i,j) = pix;
    end
end

figure,imshow(newimg);
title("Intensity Levels = " + no_of_lvl);
