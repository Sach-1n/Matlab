img = zeros(13,17);
for i = 1:13
    for j =1:17
        if i>5 && i<9 && j>5 && j<13
            img(i,j) = 1;
        end
    end
end
imshow(img);