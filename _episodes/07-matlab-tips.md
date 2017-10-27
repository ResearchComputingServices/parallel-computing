---
title: "Matlab: Best Practices"
teaching: 0
exercises: 0
questions:
- "What guidelines are there for improving Matlab code performance?"
objectives:
- "First objective."
keypoints:
- "First key point."
---

## Overview

We have seen the details of how to use Matlab's parfor command to improve your code's performance.  Mathworks in fact recommends a few different techniques to improve Matlab code performance.  These techniques are preallocation, vectorization, parallelization, and loop constants.

## Parallelization

As we have seen with parfor, Matlab has commands that allow you to explicitly break apart work into separate pieces to run at once.  Matlab has other advanced parallel programming constructions.  For example, parfeval calls a function in parallel across multiple inputs.  The spmd command runs one task for each worker processor and can even exchange data between tasks.  These additional Matlab parallelization techniques are out of scope of this workshop and will not be discussed in detail.

## Preallocation

In Matlab, variables do not have to be declared.  If you are saving into a matrix into a row or column that doesn't yet exist, then Matlab will grow the size of the Matrix.  Under the hood, Matlab actually has to create a new matrix in RAM and copy the data across from the old, smaller memory area.  So if, for example, you do this repeatedly in a loop :

~~~
clear;
N = 3E5;
tic;
for i = 1:N
    A(i,:) = rand(1,4);
end
fprintf('Time without preallocation: %f seconds\n', toc);
~~~
{: .source}
~~~
Time without preallocation: 27.711114 seconds
~~~
{: .output }

~~~
clear;
N = 3E5;
tic;
A = zeros(N, 4);
for i = 1:N
    A(i,:) = rand(1,4);
end
fprintf('Time with preallocation: %f seconds\n', toc);
~~~
{: .source}
~~~
Time with preallocation: 0.193926 seconds
~~~
{: .output }


## Vectorization

Instead of using a for-loop on individual (scalar) values, if the data for each loop iteration can be stored in a matrix or vector, then victimization is an option.  Matlab has operations that perform a computation on each element in a matrix.  For example, the ~.*~ element-wise operator will multiply each element of an array with the matching element.

One big benefit of vectorization is that Matlab will automatically parallelize certain large operations

*Show parallel_slow.m example*

## Loop Constants

The idea with this optimization is simple.  If you are computing the same value for a variable every time through a loop, then you are repeatedly calculating the same thing.  Instead, if you can just calculate the value once outside the loop, then you will save some time.

~~~
tic;
for ii = 1:100
    A = eig(magic(2000))
    % Let's pretend there is more code here...
end
toc;
~~~
{: .source }
~~~
Elapsed time is 43.479244 seconds.
~~~
{: .output }

~~~
tic;
A = eig(magic(2000))
for ii = 1:100
    % Let's pretend there is more code here...
end
toc;
~~~
{: .source }
~~~
Elapsed time is 2.116375 seconds
~~~
{: .output }
