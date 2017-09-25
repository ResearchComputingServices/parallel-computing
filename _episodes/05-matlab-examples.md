---
title: "Matlab: Case Studies"
teaching: 0
exercises: 0
questions:
- "What kind of Matlab code can be paralellized?"
objectives:
- "First objective."
keypoints:
- "First key point."
---

 * Code that can easily be parallelized with parfor
 * Code that cannot be parallelized with parfor
     * Small (e.g. 9-cell) time-stepped iterative model.  Perhaps something like a heat equation?
     * Euclidean Algorithm
     * Fibonnaci Sequence
     * Iteratively Calculate PI
 * Code that can be parallelized with parfor, but with some changes
 * Example of RAM use in parfor (e.g. the slicing matrix example)?
     * Might be good for RAM use:
         * Inside loop: `B=A`
         * Sequential: size(B)*2
         * Parallel: size(B)*P
  
From https://www.mathworks.com/help/distcomp/decide-when-to-use-parfor.html:

Fast parallel:
~~~
n = 200;
A = 500;
a = zeros(n);
for i = 1:n
    a(i) = max(abs(eig(rand(A))));
end
~~~
{: .source }

Slow parallel:
~~~
n = 1024;
A = zeros(n);
parfor (i = 1:n)
    A(i,:) = (1:n) .* sin(i*2*pi/1024);
end
~~~
{: .source }
