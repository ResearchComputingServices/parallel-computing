tic;
B = zeros(1,10);
for ii = 1:10
    A = eig(magic(2000));
    % Let's pretend there is more code here...
end
toc;

tic;
A = eig(magic(2000));
for ii = 1:10
    % Let's pretend there is more code here...
end
toc;
