% Code adapted from https://www.mathworks.com/help/distcomp/decide-when-to-use-parfor.html
tic;
n = 200;
A = 500;

a = zeros(1,n);
for i = 1:n
    a(i) = max(abs(eig(rand(A))));
end

toc;
