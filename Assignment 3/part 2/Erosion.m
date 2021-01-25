% 2(c)
img = imread('ero.tif');

subplot(2,2,1);
imshow(img);
title('Original Image');

se = ones(11);
eimg = myErosion(img,se);

subplot(2,2,2);
imshow(eimg);
title('Erosion with 11x11 Square Element');

se2 = ones(15);
eimg2 = myErosion(img,se2);

subplot(2,2,3);
imshow(eimg2);
title('Erosion with 15x15 Square Element');

se3 = ones(45);
eimg3 = myErosion(img,se3);

subplot(2,2,4);
imshow(eimg3);
title('Erosion with 45x45 Square Element');

% 2(a) 
img = zeros(13,17);
for i = 1:13
    for j =1:17
        if i>5 && i<9 && j>5 && j<13
            img(i,j) = 1;
        end
    end
end
figure();
subplot(1,3,1);
imshow(img);
title("(13x17) Original Image");
se= [[0,1,0];[0,1,0];[0,1,0]];
eimg = myErosion(img,se);

subplot(1,3,2);
imshow(se);
title("(3x3) Structuring Element");

subplot(1,3,3);
imshow(eimg);
title('(13x17) Eroded Image');

% 2(b)
img = zeros(128,128);
for i = 1:128
    for j =1:128
        if i>32 && i<97 && j>32 && j<97
            img(i,j) = 1;
        end
    end
end
figure;
subplot(2,3,1);
imshow(img);
title('(128x128) Original Image');

se = ones(32);
subplot(2,3,2);
imshow(se);
title('(32x32) Structuring Element');

eimg = myErosion(img,se);

subplot(2,3,3);
imshow(eimg);
title('(128x128) Eroded Image');


subplot(2,3,4);
imshow(img);
title('(128x128) Original Image');

se2 = ones(64,32);
subplot(2,3,5);
imshow(se2);
title('(64x32) Structuring Element');

eimg2 = myErosion(img,se2);

subplot(2,3,6);
imshow(eimg2);
title('(128x128) Eroded Image');





function d = myErosion(I,s)
    [r,c] = size(I);
    ero_I = I;
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
                                    
                                    if I(ii,jj) == 0
                                        ero_I(i,j) = 0;
                                        break;
                                    end
                                end
                            end
            
                        end
                    end
            end
            
        end
    end
    d = ero_I;
end