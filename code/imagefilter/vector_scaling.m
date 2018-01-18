DO_VECTOR = true;
DO_SCALAR = true;
LOAD_IMAGE = true;
SHOW_IMAGES = false;

NCPU = 4
NREP = 8

fname = 'hubble_orion_nebula.jpg';
img = imread(fname);
fprintf('Image file loaded\n');

results = zeros(1,NCPU);
for reps = 1:NREP
  for cores = 1:NCPU
    maxNumCompThreads = cores;
    tic;
    processimage_vectorized(img);
    results(cores) = results(cores) + toc;
    fprintf('Finished %d cores, Rep %d/%d\n', cores, reps, NREP);
  end
end

results = results / NREP;

for cores = 1:NCPU
  fprintf('%d %f\n', cores, results(cores));
end
