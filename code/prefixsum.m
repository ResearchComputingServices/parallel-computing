N = 10;
v = randi(10,1,N);
psum = zeros(1,N);

display(v);
psum(1) = v(1);
for ii = 2:N
    psum(ii) = v(ii) + psum(ii-1);
end
display(psum);
