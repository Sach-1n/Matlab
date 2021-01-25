%(i) Converting Color to Gray Scale Image
cat = imread('cat.jpg');
subplot(1,2,1);
imshow(cat);
title('Color image');

red = zeros(2448,3264,'uint8');
green = zeros(2448,3264,'uint8');
blue = zeros(2448,3264,'uint8');

for i = 1:2448
    for j = 1:3264
    red(i,j) = cat(i,j,1);
    green(i,j) = cat(i,j,2);
    blue(i,j) = cat(i,j,3);
    end
end

gray_cat = red*0.3 + green*0.6 + blue*0.1;
subplot(1,2,2);
imshow(gray_cat);
title('Gray Scale');


%(ii) Converting Gray Scale Image to Binary Image
bin_cat = zeros(2448,3264,'int8');
sum = double(0);

for i = 1:2448
    for j = 1:3264
    sum = sum + double(gray_cat(i,j));
    end
end

avg = sum/7990272;

for i = 1:2448
    for j = 1:3264
    if gray_cat(i,j) > avg
        bin_cat(i,j) = 255;
    else
        bin_cat(i,j) = 0;
    end
    end
end
figure;
subplot(1,2,1);
imshow(gray_cat);
title('Gray Scale');

subplot(1,2,2);
imshow(bin_cat);
title('Binary Image');
    