img = imread('skull_img.jpg');
subplot(2,2,1);
imshow(img);
title('Original Image');

% Intensity Levels 128
no_of_lvl = 128;
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

subplot(2,2,2);
imshow(newimg);
title("Intensity Levels = " + no_of_lvl);

% Intensity Levels 64
no_of_lvl = 64;
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

subplot(2,2,3);
imshow(newimg);
title("Intensity Levels = " + no_of_lvl);

% Intensity Levels 32
no_of_lvl = 32;
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

subplot(2,2,4);
imshow(newimg);
title("Intensity Levels = " + no_of_lvl);