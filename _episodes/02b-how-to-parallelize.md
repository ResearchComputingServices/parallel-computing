---
title: "Writing Parallel Code"
teaching: 0
exercises: 0
questions:
- "How can I parallelize my existing code?"
objectives:
- "First objective."
keypoints:
- "First key point."
---

 - Correct first, fast after
 - Determine section(s) where code takes a long time
     - time sections of code (we'll show examples in Matlab, but all programming languages have a way to check elapsed time)
 - Fix input so results are reproducible
     - want to make code faster, but not change the results
     - choose one input data set
     - fix seed for random numbers
 - If possible, break apart any dependencies in section(s), then convert code section to parallel
 
Until now, we have talked about how fast your program might go if you parallelize it.  But, in general, what steps should you take to actually create a parallel version of your code?

There are a few prerequisites.

## Don't start yet! ##

When we discuss Matlab in particular, we will go over techniques to actually perform these steps.  But in general, here's a good course of action:

 1. Fix inputs so results are reproducible
 1. Get your code working correctly
 1. Determine section(s) where code take a long time
 1. Analyze data dependencies in these sections
 1. Convert long-running code section(s) to parallel where appropriate
 1. Determine speed of parallel code version

## Working Code ##

First, it is critical that your code is correct before you try to make it run faster.  And as we mentioned in the last section, you should have a fixed problem that is a size that is large enough to be representative, but not so large that you can test it repeatedly.

## Profile Code ##

It is tempting to start trying to parallelizing code right away.  But it is wise to first sit back and take a close look at your code.  Where are the bottlenecks that slow it down?  Is parallelization a practical optimization technique in this case?

As we have seen, introducing parallel code sections will not always make a great performance improvement.  And it isn't always obvious significant amounts of time are actually spent in code.

If you add code to time sections of your code before running it, you will start to see where to look.  Timing initial or final file input/output steps, main loops is important.  If your particular programming language supports it, using a profiler can also be helpful.

## Break Dependencies ##

If you have identified a code loop that takes a long time doing calculations, then you should take a closer look at it.  Each time through a loop is called an iteration.  So if a loop variable ~i~ runs from 1 to N, then there will be N loop iterations.

To run in parallel, each loop iteration must be independent.  Are there any values from variables computed in the previous loop iteration which are used in the current iteration?  If so, is this dependency necessary?  If all loop iterations are independent of each other, then they can run in any order, or run at once on multiple processors.

## Measure Improvement ##

We'll look at some examples specific to Matlab later.  For now, let us assume you are able to make a parallel version of your code.  The final step is to time that parallel section and compare it to the original, just to ensure that the new parallel version is in fact helpful.  It is good to keep in mind that the particular computer you test on can affect results, especially the number of available processors.
