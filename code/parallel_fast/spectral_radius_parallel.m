% Code adapted from https://www.mathworks.com/help/distcomp/decide-when-to-use-parfor.html
tic;
n = 200;
A = 500;
%ticBytes(gcp);
a = zeros(1,n);
parfor i = 1:n
    a(i) = max(abs(eig(rand(A))));
end
%tocBytes(gcp)
toc;
