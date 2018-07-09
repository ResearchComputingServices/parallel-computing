% Greyscale with yellow highlights

for row = 1:size(img,1)
    for column = 1:size(img,2)
        % Convert this pixel to greyscale
        grey =  (double(img(row,column,1)) + double(img(row,column,2)) + double(img(row,column,3)))/3;
        
        % If it is a light pixel, change the blue channel to make
        % it yellow
        % Otherwise the pixel will be grey
        if grey > 167
            img(row,column,1) = grey;
            img(row,column,2) = grey;
            img(row,column,3) = 255 - grey;
        else
            img(row,column,1) = grey;
            img(row,column,2) = grey;
            img(row,column,3) = grey;
        end
    end
end
