img = imread('end.tif');

[M,N] = size(img);
P = 2*M;
Q = 2*N;
subplot(1,3,1);
imshow(img);
title('Image');

D = zeros(P,Q);
H = zeros(P,Q);
D0 = 60;
n = 2;

pad = padarray(img,[M/2,N/2],0,'both');

for i = 1:P
    for j = 1:Q
        D(i,j) = ((i-P/2)^2 + (j-Q/2)^2)^0.5;
        H(i,j) = (1 + (D0/D(i,j))^(2*n))^(-1);
        
    end
end

subplot(1,3,2);
imshow(H);
title('H(u,v)');

for i = 1:P
    for j = 1:Q
        fin(i,j) = pad(i,j)*H(i,j);
        
    end
end



subplot(1,3,3);
imshow(fin);
title('Padded Image');



