N = 4;
SEED = 100;
parfor ii = 1:N
    s = RandStream('CombRecursive', 'Seed', SEED);
    RandStream.setGlobalStream(s);
    s.Substream = ii;
    
    fprintf(' ii=%d: %f %f %f\n', ii, randn(3,1));
end
