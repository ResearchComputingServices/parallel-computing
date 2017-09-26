---
title: "Limitations of Parallel Speedup"
teaching: 0
exercises: 0
questions:
- "How fast can I go?"
objectives:
- "First objective."
keypoints:
- "First key point."
---

## OUTLINE (REMOVE THIS AFTER WRITING)

 * best possible speedup (usually) linear
 * In most real code some parts are intrinsically sequential.
 * Provide pseudocode to demonstrate critical path and Amdahl's Law, here's the kind of thing that we discussed:
 
~~~
05s. Initialize
------------------
05s. Read
------------------
60s. Compute
------------------
05s. Output
------------------
01s. Cleanup
------------------
~~~
{: .source }
  * Assume compute has perfect linear speedup, and discuss what happens as processors count increases.
  * Define Amdahl's Law
      * Show graph
  * Particle Swarm example - P particles provide speedup, of an
    individual search's iterative steps are inherently sequential
      * Could show a bit of pseudocode for examples (swarm or such)
    
More notes:
  * To introduce Amdahl's Law, ask question like
      * code runs in 60 seconds on 1 processor.  How fast on 2 processors?
  * assembly line metaphor for inherently sequential
  * example of something that where dependencies can be broken apart
  * Calculate speed: sequential should be "fastest", otherwise might
    look like superlinear speedup
  * Timing code: 
  * Describe what a random seed is, how ensure the same random number sequence

## What is parallel speedup?

How much faster could your program's code be if you convert it to parallel?

It depends on how many processors you are using.  For example, let's say you are using 4 cores on a laptop.  Say you take a long running program and break it up into 4 equal pieces, one for each core.  Then you could assume it would be 4 times faster on your quad-core computer.

Indeed, this is generally the best case scenario.  In general, if your sequential program take `Ts` seconds to run, and your parallel program on `p` processors takes `Tp` seconds, then the *speedup* can be defined as `S = Ts/Tp`.

There are, in fact, rare times when you might see superlinear speedup.  There are limited amounts of faster memory associated with each processor, so using multiple processors can mean a larger total amount of this faster memory, and perhaps the parallel program can use it more effectively than the smaller amount available to a sequential program.  But you shouldn't worry about exceptions such as these at the hardware level, it would be a special case when it occurs.

## Amdahl's Law

However, this is only a best case scenario.  You can never really parallelize all the code in your program.  There will be sections that will remain sequential.

In subsequent sections, we'll go into hardware specific details on what can cause your parallel code have less than linear speedup.  For now, let's look at a high-level outline of a program to think more about the limits to parallel speedup.

| Code Section | Sequential Time | Description |
| --- | --- | --- |
| Section 1 | 5 minutes | Initialize |
| Section 2 | 5 minutes | Read input files |
| Section 3 | 60 minutes | Compute results |
| Section 4 | 5 minutes | Output results to file |
| Section 5 | 1 minutes | Cleanup variables |

Let's say in this program that you are able to parallelize step 3.  How fast could this program possibly go?

We can calculate `Ts = 5+5+60+5+1 = 76`.  A formula to computer the time in parallel would be `Tp = 16 + 60/p`, since the 60 minutes in section 3 is running in parallel in `p` processors, while the remaining 16 minutes only runs on one processor.

Here's what happens to speedup as you increase the number of processor cores:

![Theoretical Speedup](../fig/speedup.svg)

So on 2 processors, the parallel program should take 46 seconds.  On 10 processors, 22 seconds.  If it were possible to keep on going, on one thousand processors, 16 seconds.  On one million processors, still around 16 seconds.

As this graph demonstrates, there are only so many processors that would be worth assigning to a particular program, as there are diminishing returns with larger numbers of processors.

## Measuring speedup

In practice, it may take some work to measure speedup.  You might not care exactly what your speedup is.  But if you are interested in doing parallel programming, then you are looking to make your code run faster.  So you will need some kind of experimental evidence that your parallelization is working.

 - Measure against fastest sequential code
 - Fix input (discuss random seeds here)
