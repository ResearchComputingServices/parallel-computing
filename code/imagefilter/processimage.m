% Greyscale with yellow highlights

for y = 1:size(img,1)
    for x = 1:size(img,2)
        % Convert this pixel to greyscale
        grey =  (double(img(y,x,1)) + double(img(y,x,2)) + double(img(y,x,3)))/3;
        
        % If it is a light pixel, change the blue channel to make
        % it yellow
        % Otherwise the pixel will be grey
        if grey > 167
            img(y,x,1) = grey;
            img(y,x,2) = grey;
            img(y,x,3) = 255 - grey;
        else
            img(y,x,1) = grey;
            img(y,x,2) = grey;
            img(y,x,3) = grey;
        end
    end
end
