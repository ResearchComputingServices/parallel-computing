n = 10;
v = randi(3,1,n)-1;
psum = zeros(1,n);

display(v);
psum(1) = v(1);
for ii = 2:n
    psum(ii) = v(ii) + psum(ii-1);
end
display(psum);
