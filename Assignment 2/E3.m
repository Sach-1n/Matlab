i1 = imread('E3-1.tif');
i2 = imread('E3-2.tif');
i3 = imread('E3-3.tif');
i4 = imread('E3-4.tif');

eq_i1 = histeq(i1);
eq_i2 = histeq(i2);
eq_i3 = histeq(i3);
eq_i4 = histeq(i4);

subplot(4,3,1);
imshow(i1);
subplot(4,3,4);
imshow(i2);
subplot(4,3,7);
imshow(i3);
subplot(4,3,10);
imshow(i4);

subplot(4,3,2);
imshow(eq_i1);
subplot(4,3,5);
imshow(eq_i2);
subplot(4,3,8);
imshow(eq_i3);
subplot(4,3,11);
imshow(eq_i4);

subplot(4,3,3);
imhist(eq_i1);
subplot(4,3,6);
imhist(eq_i2);
subplot(4,3,9);
imhist(eq_i3);
subplot(4,3,12);
imhist(eq_i4);