function montecarlo()

N = 2E8;
incircle = 0;
for ii = 1:N
    x = rand();
    y = rand();
    if sqrt(x^2 + y^2) <= 1.0
        incircle = incircle + 1;
    end
end
mypi = 4*(incircle/N);

end
