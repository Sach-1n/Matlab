A = [   [1,0,0,0,0];
        [0,1,1,0,0];
        [0,1,1,0,0];
        [0,1,1,1,0];
        [0,1,1,1,0];
        [1,1,1,1,1];
        [1,1,1,1,1];
        [1,1,1,1,1];
        [1,1,1,1,1];
        [1,1,1,1,1]  ];
A = pad(A,0);



B = ones(3);
subplot(3,4,1);
imshow(A);
title('A');

open_A = imdilate(imerode(A,B),B);
subplot(3,4,2);
imshow(open_A);


S0A = A - open_A;
subplot(3,4,3);
imshow(S0A);
title('S0(A)');

tot = S0A;
subplot(3,4,4);
imshow(tot);
title('');

AeB = imerode(A,B);
subplot(3,4,5);
imshow(AeB);
title('A Erosion B');

open_AeB = imdilate(imerode(AeB,B),B);
subplot(3,4,6);
imshow(open_AeB);

S1A = AeB - open_AeB;
subplot(3,4,7);
imshow(S1A);
title('S1(A)');

tot = tot | S1A;
subplot(3,4,8);
imshow(tot);
title('');

AeBeB = imerode(AeB,B);
subplot(3,4,9);
imshow(AeBeB);
title('A Erosion B Erosion B');

open_AeBeB = imdilate(imerode(AeBeB,B),B);
subplot(3,4,10);
imshow(open_AeBeB);

S2A = AeBeB - open_AeBeB;
subplot(3,4,11);
imshow(S2A);
title('S2(A)');

tot = tot | S2A;
subplot(3,4,12);
imshow(tot);
title('Final Skeleton');

function p = pad(I,n)
    
[r,c] = size(I);
im = zeros(r+2,c+2);
im(:,:) = n;
for i=1:r
   for j=1:c
      im(i+1,j+1) = I(i,j); 
   end
end

p = im;
end