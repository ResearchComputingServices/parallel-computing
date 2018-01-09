N = 3E5;

clearvars -except N;
tic;
for i = 1:N
    A(i,:) = rand(1,4);
%     if mod(i, 0.5E5)==0
%         fprintf('%d\n', i);
%     end
end
fprintf('Time without preallocation: %f seconds\n', toc);


clearvars -except N;
tic;
A = zeros(N, 4);
for i = 1:N
    A(i,:) = rand(1,4);
%     if mod(i, 0.5E5)==0
%         fprintf('%d\n', i);
%     end
end
fprintf('Time with preallocation: %f seconds\n', toc);
