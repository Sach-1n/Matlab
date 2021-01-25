img = imread('23.png');
imshow(img);
title('ORIGINAL IMAGE');

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

[row,col] = size(r);

r_wm = logical(bitand(r,1));
g_wm = logical(bitand(g,2));
b_wm = logical(bitand(b,3));

figure;
subplot(1,3,1);
imshow(r_wm);
title('RED Component 1st LSB');

subplot(1,3,2);
imshow(g_wm);
title('GREEN Component 1st LSB');

subplot(1,3,3);
imshow(b_wm);
title('BLUE Component 1st LSB');

wm1 = r_wm;
wm2 = logical(bitand(r,2));
wm3 = logical(bitand(r,3));

figure;
subplot(1,3,1);
imshow(wm1);
title('RED Component 1st LSB');

subplot(1,3,2);
imshow(wm2);
title('RED Component 2nd LSB');

subplot(1,3,3);
imshow(wm3);
title('RED Component 3rd LSB');

waterM = img(:,:,1);
for i = 1:row
    for j = 1:col
        temp = 2^2 * wm3(i,j) + 2 * wm2(i,j) + wm3(i,j);
        waterM(i,j) = 32 * temp;
    end
end

figure;
imshow(waterM);
title('Combining all 3 LSB of RED');
