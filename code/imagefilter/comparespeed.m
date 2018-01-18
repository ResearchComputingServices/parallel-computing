%% Compare speed of MATLAB scripts
% Runs given scripts, timing their execution.  Results are report to
% compare the relative speeds of the scripts.

scripts = {'processimage;', 'processimage_vectorized;'};

% Number of timing repetitions for each script
reps = 1;

%% Make sure we have a parallel pool ready in case some scripts use parfor
if isempty(gcp('nocreate'))
    parpool(feature('numcores'));
end

img = imread('hubble_orion_nebula.jpg');

%% Time each script
numscripts = length(scripts);
results = zeros(numscripts,reps);
for r = 1:reps
    for s = 1:numscripts
        fprintf('Running %s (%d/%d)\n', scripts{s}, r, reps);
        tic;
        runscript(scripts{s}, img);
        results(s,r) = toc;
    end
end
averages = mean(results, 2);
speedup = (averages/averages(1)).^-1;

%% Print a table of results to Command Window
fprintf('\n\n');
fprintf('%30s', 'SCRIPT NAME');
for r = 1:reps
    fprintf('%8s%02d', 'Run', r);
end
fprintf('%10s', 'Average');
fprintf('%10s', 'Speedup');
fprintf('\n');
for s = 1:numscripts
    fprintf('%30s', scripts{s});
    for r = 1:reps
        fprintf('%10.2f', results(s,r));
    end
    fprintf('%10.2f', averages(s));
    fprintf('%10.2f', speedup(s));
    fprintf('\n')
end

%% Graph results
% bar(categorical(scripts), averages);
% title('Average Duration (s)');
% set(gca,'TickLabelInterpreter','none')
% figure;
% bar(categorical(scripts), speedup, 'r');
% title('Speedup vs first script');
% set(gca,'TickLabelInterpreter','none')

%% Helper function to run a command stored in a string
function runscript(scriptname, img)
  eval(scriptname);
end
