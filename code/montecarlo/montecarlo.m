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
