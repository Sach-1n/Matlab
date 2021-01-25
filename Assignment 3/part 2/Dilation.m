% 1(a)
img = zeros(13,17);
for i = 1:13
    for j =1:17
        if i>5 && i<9 && j>5 && j<13
            img(i,j) = 1;
        end
    end
end
subplot(1,3,1);
imshow(img);
title("(13x17) Original Image");

se= [[0,0,0,0,1];[0,0,0,1,0];[0,0,1,0,0];[0,1,0,0,0];[1,0,0,0,0]];
dil_img = myDilation(img,se);

subplot(1,3,2);
imshow(se);
title("(5x5) Structuring Element");

subplot(1,3,3);
imshow(dil_img);
title('(13x17) Dilated Image');

img2 = imread('text.tif');
figure;
subplot(1,3,1);
imshow(img2);
title('Original Image');

se2 = [[0,1,0];[1,1,1];[0,1,0]];
subplot(1,3,2);
imshow(se2);
title('Structuring Element');

dil2 = myDilation(img2,se2);

subplot(1,3,3);
imshow(dil2);
title('Dilated Image');

% 1(c)
img3 = zeros(128,128);
for i = 1:128
    for j =1:128
        if i>32 && i<97 && j>32 && j<97
            img3(i,j) = 1;
        end
    end
end
figure;
subplot(2,3,1);
imshow(img3);
title('(128x128) Original Image');

se3 = ones(32);
subplot(2,3,2);
imshow(se3);
title('(32x32) Structuring Element');

dil3 = myDilation(img3,se3);

subplot(2,3,3);
imshow(dil3);
title('(128x128) Dilated Image');

% 1(b)
subplot(2,3,4);
imshow(img3);
title('(128x128) Original Image');

se4 = ones(65,16);
subplot(2,3,5);
imshow(se4);
title('(65x16) Structuring Element');

dil4 = myDilation(img3,se4);

subplot(2,3,6);
imshow(dil4);
title('(128x128) Dilated Image');



function d = myDilation(I,s)
    [r,c] = size(I);
    dil_I = I;
    [rs,cs] = size(s);
    r_mid = floor((rs+1)/2);
    c_mid = floor((cs+1)/2);
    for i = 1:r
        for j = 1:c
            if I(i,j) == 1
                    for is = 1:rs
                        for js = 1:cs
                            if s(is,js) == 1
                                ii = i + is - r_mid;
                                jj = j + js - c_mid;
                                if ii>0 && ii<=r && jj>0 && jj<=c
                                    dil_I(ii,jj) = 1;
                                end
                            end
            
                        end
                    end
            end
            
        end
    end
    d = dil_I;
end
