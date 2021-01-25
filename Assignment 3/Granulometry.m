img = imread('wood.tif');
subplot(2,3,1);
imshow(img);
title('Original Image');

SE5 = strel('disk',5);


open_img = imopen(img,SE5);
smooth_img = imclose(open_img,SE5);

subplot(2,3,2);
imshow(smooth_img);
title('Smooth Image');

SE10 = strel('disk',10);

open_img = imopen(img,SE10);
subplot(2,3,3);
imshow(open_img);
title('Image opened with radius 10');

SE20 = strel('disk',20);

open_img = imopen(img,SE20);
subplot(2,3,4);
imshow(open_img);
title('Image opened with radius 20');

SE25 = strel('disk',25);

open_img = imopen(img,SE25);
subplot(2,3,5);
imshow(open_img);
title('Image opened with radius 25');

SE30 = strel('disk',30);

open_img = imopen(img,SE30);
subplot(2,3,6);
imshow(open_img);
title('Image opened with radius 30');