img = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
        0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
        0 0 1 0 0 0 1 1 1 1 0 0 0 0 0 0 ;
        0 1 1 1 0 0 0 0 0 0 0 0 1 1 0 0 ;
        0 0 1 0 0 0 0 0 0 0 0 0 1 1 1 0 ;
        0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 ;
        0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 ;
        0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;   ];

subplot(2,3,1);
imshow(img);
title('Image');
    
b1 = [  0 1 0;
        1 1 1;
        0 1 0;  ];
    
b2 = [  1 0 1;
        0 0 0;
        1 0 1;  ];
   
e_img = imerode(img,b1);
subplot(2,3,2);
imshow(e_img);
title('Erosion of Image by B1');

cimg = 1 - img;
subplot(2,3,3);
imshow(cimg);
title('Complement of Image');


e_cimg = imerode(cimg,b2);
subplot(2,3,4);
imshow(e_cimg);
title('Erosion of Complement Image by B2');

final = e_cimg & e_img;
subplot(2,3,5);
imshow(final);
title('Final Intersection of Two');



img = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0;
        0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 1 1 1 0 0;
        0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 1 1 1 0 0;
        0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 1 1 1 0 0;
        0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0;
        0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 0 0 0 0 0;
        0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 0 0 0 0 0;
        0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;  ];
figure();    
subplot(2,3,1);
imshow(img);
title('Image');

w = ones(7);
d = ones(5);
d = pad(d,0);
w_d = w - d;
   
e_img = imerode(img,d);
subplot(2,3,2);
imshow(e_img);
title('Erosion of Image by D');

cimg = 1 - img;
subplot(2,3,3);
imshow(cimg);
title('Complement of Image');


e_cimg = imerode(cimg,w_d);
subplot(2,3,4);
imshow(e_cimg);
title('Erosion of Complement Image by W-D');

final = e_cimg & e_img;
subplot(2,3,5);
imshow(final);
title('Centre of D');
    
    

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