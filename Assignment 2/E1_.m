img = imread('E1.tif');
subplot(2,2,1);
imshow(img);
title('Orignal Image');
img3 = imadjust(img,[],[],3);
img4 = imadjust(img,[],[],4);
img5 = imadjust(img,[],[],5);

subplot(2,2,2);
imshow(img3);
title('Gamma = 3');

subplot(2,2,3);
imshow(img4);
title('Gamma = 4');

subplot(2,2,4);
imshow(img5);
title('Gamma = 5');

