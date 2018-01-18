% Greyscale with yellow highlights

%% Convert to greyscale - average the Red,Green,Blue values
grey = uint8(mean(img, 3));

%% Select light colored pixels, change blue channel for just these pixels
lightmask = grey > 167;
blue = grey;
blue(lightmask) = 255 - blue(lightmask);

%% Combine the new Red,Green,Blue channels
img = cat(3, grey, grey, blue);
