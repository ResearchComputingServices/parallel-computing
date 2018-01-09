tic;
N = 1E9;
incircle = 0;
for ii = 1:N
    x = rand();
    y = rand();
    if sqrt(x^2 + y^2) <= 1.0
        incircle = incircle + 1;
    end
end
fprintf('Sequential took %f s pi=%f\n', toc, 4*(incircle/N));


% Needs something like 22GB of RAM!
tic;
N = 1E9;
x = rand(1,N);
y = rand(1,N);
incircle = sum(sqrt(x.^2 + y.^2)<1.0);
fprintf('Vectorized took %f s pi=%f\n', toc, 4*(incircle/N));
clear;