img = imread('E3-1.tif');
img_ref = imread('E3-2.tif');

hist_ref = imhist(img_ref);
final_img = histeq(img, hist_ref);

subplot(3,2,1);
imshow(img);
title('Original Image');
subplot(3,2,2);
imhist(img);

subplot(3,2,3);
imshow(img_ref);
title('Reference Image');
subplot(3,2,4);
imhist(img_ref);

subplot(3,2,5);
imshow(final_img);
title('After Specification Image');
subplot(3,2,6);
imhist(final_img);
