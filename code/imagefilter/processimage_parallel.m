% Greyscale with yellow highlights

width = size(img,1);
height = size(img,2);
img = reshape(img, [width*height, 3]);

for i = 1:length(img)
    % Convert this pixel to greyscale
    grey =  (double(img(i,1)) + double(img(i,2)) + double(img(i,3)))/3;
    
    % If it is a light pixel, change the blue channel to make
    % it yellow
    % Otherwise the pixel will be grey
    if grey > 167
        img(i,1) = grey;
        img(i,2) = grey;
        img(i,3) = 255 - grey;
    else
        img(i,1) = grey;
        img(i,2) = grey;
        img(i,3) = grey;
    end
end

img = reshape(img, [width, height, 3]);
