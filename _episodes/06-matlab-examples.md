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

## Outline (delete after writing)

 * Code that can easily be parallelized with parfor
   * Monte Carlo PI: area of circle
   * Mandelbrot
 * Code that cannot be parallelized with parfor
     * Prefix Sum
     * Game of Life
 * Code that can be parallelized with parfor, but with some changes
 * Example of RAM use in parfor (e.g. the slicing matrix example)?
     * Might be good for RAM use:
         * Inside loop: `B=A`
         * Sequential: size(B)*2
         * Parallel: size(B)*P


## Example Matlab parfor

### Monte Carlo Illustration

![Monte Carlo Illustration](../fig/montecarlo_illustration.png)

It is easier to learn how to program by working through real examples.

Let us look at a typical example of a Monte Carlo process - computing the value of PI.

First, to understand what this example does, let's run montecarlo_illustration.m.  This code shows a quarter of a circle.  Random points are selected, and determined to be inside or outside the circle.  The ratio of points in the circle is proportional to PI, so as the random selection of points grows, we can approximate the value of PI.

### Monte Carlo Parallel

The montecarlo_illustration.m code only shows a few points.  Let's now move on to montecarlo.m.  This code is similar, except it generates many more points, and for performance it no longer display a visual image.

How could we improve the performance of this code?

The code is primarily comprised of one big loop.  Can it be parallelized?  We only have one loop to choose  parfor. Each iteration of the loop has its own temporary x,y values.  The only shared variable is `incircle`, which satisfies classification as a reduction variable, and the loop variable correctly counts the integers.  So each iteration of the loop is in indeed independent.  The code even has tic/toc commands already, so we are all set to convert this to a parallel loop.

Go ahead and rename the `for` statement to a `parfor` statement.  Now let's see whether it goes any faster.  But first, start a Matlab parallel pool.  You may do so using the parpool command you saw previously, or using Matlab's parallel pool menu in the bottom left corner.  Matlab is usually setup to automatically stat a parallel pool when needed.  But our PI calculation doesn't take too long.  In a real example, we would have many more points and the parallel pool startup time would not be significant.  But let's not skew the timing results in our small example by counting the time to start the parallel pool.

Once the pool is started, run your parallel code.  What speedup did you obtain?

## Limits of parfor

It is important to reiterate that not all Matlab `for` loops can be converted to `parfor`.

For example, the prefix sum problem computes the sums of elements up to a particular location in a vector, for every location in the vector.  In Matlab this is called the `cumsum` function.  Our own code to compute this might look like:

~~~
n = 20
V = randi(2,1,n)-1;
prefix = zeros(n)

V
for ii = 2:n
    V(ii) = V(ii) + V(ii-1);
end
V
~~~
{: .source}

There is an dependency for the current prefix sum element on the previous one.  This stops us from being able to use a parfor.  When working on your own projects, it is worthwhile to remember that not all Matlab loops can be parallelized.

## Parallel Matlab performance

Here is another example of a parallel loop.  This loop obtains appreciable speedup:
~~~
n = 200;
A = 500;
a = zeros(n);
parfor i = 1:n
    a(i) = max(abs(eig(rand(A))));
end
~~~
{: .source }

On the other hand, this is a valid `parfor` loop that does not run faster than a regular `for` loop":
~~~
n = 1024;
A = zeros(n);
parfor (i = 1:n)
    A(i,:) = (1:n) .* sin(i*2*pi/1024);
end
~~~
{: .source }

The first loop performs a longer computation within each loop iteration, and only returns 

For reference: [https://www.mathworks.com/help/distcomp/decide-when-to-use-parfor.html](https://www.mathworks.com/help/distcomp/decide-when-to-use-parfor.html)

## Fixing code for Matlab parfor

![Mandelbrot](../fig/mandelbrot.png)

Let's look at code that computes and then draws the Mandelbrot set. This example is based on code from [the Mathworks website](https://www.mathworks.com/help/distcomp/examples/illustrating-three-approaches-to-gpu-computing-the-mandelbrot-set.html)

The Mandelbrot set is an example of a fractal, where a rough-edged geometric pattern repeats indefinitely as you zoom in.  It is fun to look at, so it makes a good example.

You can find 05/mandelbrot.m in the files that you downloaded.  If you try running this now, you will see that it takes a while to compute all the points in a particular zoomed image on the Mandelbrot set.  The set is then displayed, along with the time to compute.  This code can be parallelized with a parfor, but a few fixes will need to be made.  Can you figure out how to make a `parfor` version of mandelbrot.m?

