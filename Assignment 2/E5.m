img = imread('E5.tif');
[row,col] = size(img);

sum1 = 0;
for i = 1:row
    for j = 1:col 
        sum1 = sum1 + i;
    end
end

thres = sum1/(row*col);

new_img = uint8(zeros(row,col));

for i = 8:row - 7
    for j = 8:col - 7
        sum = 0;
        for x = i-7:i+7
            for y = j-7:j+7
                sum = sum + img(x,y);
            end
        end
        new_img(i,j) = uint8(sum/225);
    end
end

bin_img = uint8(255*(img > thres));

subplot(1,3,1);
imshow(img);
title('Original');

subplot(1,3,2);
imshow(new_img);
title('Masking');

subplot(1,3,3);
imshow(bin_img);
title('binary');
