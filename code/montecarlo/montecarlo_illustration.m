D = 1000;
N = 1E6;
points = zeros(D);
incircle = 0;
fig = gcf;
for ii = 1:N
    if mod(ii,5E3) == 0
        colormap([1 1 1; 1 0 0; 0 1 0; 0 0 1]);
        image(points);
        title(sprintf( 'pi=%f', 4*(incircle/ii)));
        pause(0.02)
    end
    x = rand();
    y = rand();
    if x*x + y*y <= 1.0
        points(round(x*(D-1))+1, round(y*(D-1)+1)) = 2;
        incircle = incircle + 1;
    else
        points(round(x*(D-1))+1, round(y*(D-1)+1)) = 4;
    end
end
