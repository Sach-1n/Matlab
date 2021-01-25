img = imread('blob.tif');
subplot(2,2,1);
imshow(img);
title('Original Image');

SE30 = strel('disk',30);
dia = imdilate(img,SE30);
close_img = imerode(dia,SE30);
subplot(2,2,2);
imshow(close_img);
title('Closing with SE radius 30');

SE60 = strel('disk',60);
open_img = imopen(close_img,SE60);
subplot(2,2,3);
imshow(open_img);
title('Opening with SE radius 60');

dia = imdilate(open_img,ones(3));
ero = imerode(open_img,ones(3));
boundary = dia - ero;


super_img = boundary + img;
subplot(2,2,4);
imshow(super_img);
title('Final Image');