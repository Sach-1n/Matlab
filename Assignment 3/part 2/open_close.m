img = imread('thumb.tif');

subplot(3,2,1);
imshow(img);
title('Original Image');

se = ones(3);

subplot(3,2,2);
imshow(se);
title('Structuring Element 3x3');

eimg = myErosion(img,se);
subplot(3,2,3);
imshow(eimg);
title('Erosion of Image');

oimg = myDilation(eimg,se);
subplot(3,2,4);
imshow(oimg);
title('Opening of Original Image(i.e. Erosion than Dilation)');

doimg = myDilation(oimg,se);
subplot(3,2,5);
imshow(doimg);
title('Dilation of Opening');

coimg = myErosion(doimg,se);
subplot(3,2,6);
imshow(coimg);
title('Closing of Opening');



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