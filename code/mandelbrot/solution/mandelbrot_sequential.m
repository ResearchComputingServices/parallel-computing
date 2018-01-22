if not(exist('MANDELBROT_VISUAL'))
    MANDELBROT_VISUAL=true;
end

maxIterations = 1000;
gridSize = 2000;
xlim = [-0.744277119204761 -0.742029680722771];
ylim = [-0.140529505375656 -0.138282066893665];

% Setup
t = tic();
x = linspace( xlim(1), xlim(2), gridSize );
y = linspace( ylim(1), ylim(2), gridSize );
[xGrid,yGrid] = meshgrid( x, y );
z0 = xGrid + 1i*yGrid;
count = ones( size(z0) );
z = zeros(gridSize);

% Calculate
for ii = 1:gridSize
    for jj = 1:gridSize
        z(ii,jj) = z0(ii,jj);
        while count(ii,jj) < maxIterations && abs(z(ii,jj))<=2
            z(ii,jj) = z(ii,jj)*z(ii,jj) + z0(ii,jj);
            count(ii,jj) = count(ii,jj)+1;
        end
    end
end
count = log( count );

% Show
cpuTime = toc( t );
if MANDELBROT_VISUAL
    fig = figure;
    fig.Position = [200 200 600 600];
    imagesc( x, y, count );
    colormap(fig, [flipud(autumn()); 0 0 0] );
    axis off
    title( sprintf( '%1.2fsecs (sequential)', cpuTime ) );
    cpuTime
end
