img = [ 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 1 1 1 0 0 0 0 0;
        0 0 1 1 1 1 1 0 0 0 0;
        0 0 1 1 1 1 0 0 0 0 0;
        0 0 0 0 1 1 0 1 0 0 0;
        0 0 0 0 1 1 0 1 0 0 0;
        0 0 0 0 1 1 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 1 1 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0;  ];

subplot(2,3,1);
imshow(img);
title('');
    
b1 = [  1 0 0;
        1 0 0;
        1 0 0;  ];

b = [   0 0 0;
        0 1 0;
        0 0 0;  ];

    
b2 = [  1 1 1;
        0 0 0;
        0 0 0;  ];
        
b3 = [  0 0 1;
        0 0 1;
        0 0 1;  ];
    
b4 = [  0 0 0;
        0 0 0;
        1 1 1; ];
    
% X10 = img;    
% temp = hit_miss(X10,b1,b);
% X11 = temp | img;
% temp = hit_miss(X11,b1,b);
% X12 = temp | img;
% 
% subplot(2,3,2);
% imshow(X11);
% title('');
% 
% subplot(2,3,3);
% imshow(X12);
% title('');

X10 = img;  
for i = 1:4
    X11 = hit_miss(X10,b1,b);
    X10 = X11 | img;
end
subplot(2,3,2);
imshow(X10);
title('');

    
    
    
function h = hit_miss(A, s1, s2)
Ac = 1 - A;
A = pad(A,0);
Ac = pad(Ac,0);
e1 = imerode(A,s1);
e2 = imerode(Ac,s2);
in = e1 & e2;
in = remove_pad(in);
h = in;
end

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

function p = remove_pad(I)
    
[r,c] = size(I);
im = zeros(r-2,c-2);
x=1;
for i=2:r-1
    y=1;
   for j=2:c-1
      im(x,y) = I(i,j);
      y = y+1;
   end
   x = x+1;
end

p = im;
end
    