% Code adapted from https://www.mathworks.com/help/distcomp/decide-when-to-use-parfor.html
n = 10240;
n = 2E4;

%% Parallel Version
%ticBytes(gcp);
A = zeros(n);
parfor (i = 1:n)
    A(i,:) = (1:n) .* sin(i*2*pi/1024);
end
%tocBytes(gcp)
