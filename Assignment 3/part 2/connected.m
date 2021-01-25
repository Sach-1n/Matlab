% Figure 9.17
A = [ [0,0,0,0,0,0,0,0,0,0];
        [0,0,0,0,0,0,1,1,1,0];
        [0,0,0,0,0,0,1,1,1,0];
        [0,0,0,0,0,1,1,0,1,0];
        [0,0,0,0,0,1,1,1,1,0];
        [0,0,0,1,1,1,0,0,0,0];
        [0,0,1,1,1,0,0,0,0,0];
        [0,1,0,0,1,0,0,0,0,0];
        [0,0,1,1,1,0,0,0,0,0];
        [0,0,0,0,0,0,0,0,0,0]   ];
    
subplot(2,3,1);
imshow(A);
title('A');

X0 = zeros(10);
X0(7,4) = 1;

subplot(2,3,2);
imshow(X0);
title('X0');

se = ones(3);
s = 3;
for i = 1:8
    temp = myDilation(X0,se);
    X1 = double(A&temp);
    X0 = X1;
    
    if i == 1||i == 2||i == 3||i == 8
    subplot(2,3,s);
    s = s+1;
    imshow(X1);
    title(['X',num2str(i)]);
    end
end

% Figure 9.18

img = imread('breast.tif');
figure;
subplot(2,2,1);
imshow(img);
title('Image');

thres = 200;
b_img = img>thres;
subplot(2,2,2);
imshow(b_img);
title('Binary Image');

se = ones(5);
e_img = myErosion(b_img,se);
subplot(2,2,3);
imshow(e_img);
title('Eroded Image');

% Table Values
left = e_img;
[r,c] = size(left);
for i = 1:r
    for j = 1:c
        if left(i,j)
           x = i;
           y = j;
           break;
        end
    end
end

compo = zeros(r,c);
compo(x,y) = 1;





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