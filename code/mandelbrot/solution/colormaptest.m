fig = figure;
%fig.Position = [200 200 600 600];
imagesc( x, y, count );

colormap( [flipud(autumn()); 0 0 0] );

axis off