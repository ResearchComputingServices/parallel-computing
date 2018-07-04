% Greyscale with yellow highlights

width = size(img,1);
height = size(img,2);
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

parfor i = 1:numel(red)
    % Convert this pixel to greyscale
    grey = (double(red(i)) + double(green(i)) + double(blue(i)))/3;
    
    % If it is a light pixel, change the blue channel to make
    % it yellow
    % Otherwise the pixel will be grey
    red(i) = grey;
    green(i) = grey;
    if grey > 167
        blue(i) = 255-grey;
    else
        blue(i) = grey;
    end
end

img(:,:,1) = red;
img(:,:,2) = green;
img(:,:,3) = blue;

%img = reshape(img, [width, height, 3]);
