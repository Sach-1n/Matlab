img = imread('E2.tif');
subplot(5,2,1);
imshow(img);

i = double(img);
bit1 = mod(i,2);
bit2 = mod(floor(i/2),2);
bit3 = mod(floor(i/4),2);
bit4 = mod(floor(i/8),2);
bit5 = mod(floor(i/16),2);
bit6 = mod(floor(i/32),2);
bit7 = mod(floor(i/64),2);
bit8 = mod(floor(i/128),2);



subplot(5,2,2);
imshow(bit1);

subplot(5,2,3);
imshow(bit2);

subplot(5,2,4);
imshow(bit3);


subplot(5,2,5);
imshow(bit4);


subplot(5,2,6);
imshow(bit5);


subplot(5,2,7);
imshow(bit6);


subplot(5,2,8);
imshow(bit7);

subplot(5,2,9);
imshow(bit8);
