% Reading monalisa text file and coverting it into grayscale image.

mona = fopen('monalisa.txt');
i = 1
while ~feof(mona)
    line = fgetl(mona);
    for j = 1:length(line)
        mona_img(j,i) = uint8(line(j));
    end
    i = i + 1;
     
end

fclose(mona);

subplot(1,2,1);
imshow(mona_img);
title('MONALISA');

% Reading lincon text file and converting it into a gray scale image.

linc = fopen('lincon.txt');
i = 1
while ~feof(linc)
    line = fgetl(linc);
    len = length(line)
    for j = 1:len
        linc_img(j,i) = uint8(line(len-j+1));
    end
    i = i + 1;
     
end

fclose(linc);

subplot(1,2,2);
imshow(linc_img);
title('LINCON');

% Convert to binary by AVERAGE threshold method

[row,col] = size(mona_img);
bin_mona = uint8(zeros(row,col));
sum = 0;
for i = 1:row
    for j = 1:col
        sum = sum + double(mona_img(i,j));
    end
end

avg = sum/(row*col);
for i = 1:row
    for j = 1:col
        if mona_img(i,j) > avg
            bin_mona(i,j) = 255;
        else
            bin_mona(i,j) = 0;
        end
            
    end
end

figure;
subplot(1,2,1);
imshow(bin_mona);
title('Averaging Method')


[row,col] = size(linc_img);
bin_linc = uint8(zeros(row,col));
sum = 0;
for i = 1:row
    for j = 1:col
        sum = sum + double(linc_img(i,j));
    end
end

avg = sum/(row*col);
for i = 1:row
    for j = 1:col
        if linc_img(i,j) > avg
            bin_linc(i,j) = 255;
        else
            bin_linc(i,j) = 0;
        end
            
    end
end

subplot(1,2,2);
imshow(bin_linc);
title('Averaging Method')


% Converting to binary by (MIN+MAX)/2 method.

[row,col] = size(mona_img);

min = 255;
max = 0;
for i = 1:row
    for j = 1:col
        if mona_img(i,j) > max
            max = mona_img(i,j);
        end
        if mona_img(i,j) < min
            min = mona_img(i,j);
        end

    end
end

thres = (min+max)/2;
for i = 1:row
    for j = 1:col
        if mona_img(i,j) > thres
            bin_mona(i,j) = 255;
        else
            bin_mona(i,j) = 0;
        end
            
    end
end

figure;
subplot(1,2,1);
imshow(bin_mona);
title('Min/Max Method')


[row,col] = size(linc_img);

min = 255;
max = 0;
for i = 1:row
    for j = 1:col
        if linc_img(i,j) > max
            max = linc_img(i,j);
        end
        if linc_img(i,j) < min
            min = linc_img(i,j);
        end

    end
end

thres = (min+max)/2;
for i = 1:row
    for j = 1:col
        if linc_img(i,j) > thres
            bin_linc(i,j) = 255;
        else
            bin_linc(i,j) = 0;
        end
            
    end
end

subplot(1,2,2);
imshow(bin_linc);
title('Min/Max Method')


