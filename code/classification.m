N = 100;
b = pi;
S = zeros(N);
R = 0;
parfor i = 1:N
    T = rand(1,N);
    S(i,:) = b*T;
    R = R + max(T);
end
