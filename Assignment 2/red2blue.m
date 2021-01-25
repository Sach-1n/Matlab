red_img = imread('red.png');
subplot(1,2,1);

imshow(red_img);
title('Red Image');


R = zeros(594,1021);
G = zeros(594,1021);
B = zeros(594,1021);

for i = 1:594
    for j = 1:1021
    R(i,j) = red_img(i,j,1);
    G(i,j) = red_img(i,j,2);
    B(i,j) = red_img(i,j,3);
    end
end


temp  = R;
R = B;
B = temp;

blue = uint8(cat(3,R,G,B));

subplot(1,2,2);
imshow(blue);
title('Converted Image')