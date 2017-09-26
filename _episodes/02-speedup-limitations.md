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

*I shouldn't be this formal, but the idea now is to describe the following:*

Specifically, let's assume that you have ~P~ processor cores, all the same speed, and let's assume that your sequential code takes *T_1* seconds to run, called the sequential running time.  Likewise, your parallel running time is ~T_P~.  Then the speedup *S_p* is then defined as the ratio of sequential to parallel ~S_P = T_1/T_P \le P~.  This kind of linear speedup is, generally, optimal.

## Amdahl's Law

However, this is only a best case scenario.  In fact, often not all the code in your program can be converted to parallel, or only for a limited number of processors.

In proceeding sections, we'll go into more detail on what can cause your parallel code have less than linear speedup.  For now, let's look at a high-level outline of a program to think more about the limits to parallel speedup.

*IMPROVE PRESENTATION OF THIS SORT-OF PSEUDOCODE"*
~~~
Step 1 [5 seconds] Initialize
------------------
Step 2 [5 seconds] Read input files
------------------
Step 3 [60 seconds] Compute results
------------------
Step 4 [5 seconds] Output results to file
------------------
Step 5 [1 second] Cleanup variables
------------------
~~~
{: .source }

Let's say in this program that you are able to parallelize step 3.  How fast could this program possibly go?  Here's what happens as you increase the number of processor cores:


*INSERT GRAPH SHOWING SPEEDUP AS P GETS LARGE*

## Measuring speedup

In practice, it may take some work to measure speedup.  You might not care exactly what your speedup is.  But if you are interested in doing parallel programming, then you are looking to make your code run faster.  So you will need some kind of experimental evidence that your parallelization is working.

 - Best sequential code
 - Fix input (discuss random seeds here)
