img = imread('E1.tif');

subplot(2,2,1);
imshow(img);
title('Original Image');
[row,col] = size(img);

n_img = uint8(zeros(row,col));

for i = 1:row
    for j = 1:col
        im = double(img(i,j));
        n_img(i,j) = im^3;
    end
end

n_img = uint8(n_img(:,:));
subplot(2,2,2);
imshow(n_img);
title('Gamma = 3');

n_img = zeros(row,col);

for i = 1:row
    for j = 1:col
        im = double(img(i,j));
        n_img(i,j) = im^4;
    end
end

n_img = uint8(n_img(:,:));
subplot(2,2,3);
imshow(n_img);
title('Gamma = 4');

n_img = zeros(row,col);

for i = 1:row
    for j = 1:col
        im = double(img(i,j));
        n_img(i,j) = im.^(2);
    end
end

n_img = uint8(n_img(:,:));
subplot(2,2,4);
imshow(n_img);
title('Gamma = 5');