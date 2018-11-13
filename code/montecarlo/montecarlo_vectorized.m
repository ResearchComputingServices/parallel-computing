N = 2E8;
x = rand(1,N);
y = rand(1,N);
incircle = sum(sqrt(x.^2 + y.^2)<1.0);
mypi = 4*(incircle/N);
clear x y;
