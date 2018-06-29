---
title: "Writing Parallel Code"
teaching: 10
exercises: 0
questions:
- "How can I parallelize my existing code?"
objectives:
- "First objective."
keypoints:
- "First key point."
---

## Don't start yet! ##

Until now, we have talked about how fast your program might go if you parallelize it.  Before jumping right in and modifying your code, let's think about the best method to achieve good parallel results.  What steps should you take to actually create a parallel version of your code?

There are a few prerequisites that you should consider before parallelizing your code.  When we discuss MATLAB in particular, we will go over techniques to actually perform these steps.  But in general, here's a good course of action:

 1. Fix inputs so output is reproducible
 1. Get your code working correctly
 1. Determine section(s) where code take a long time
 1. Analyze data dependencies in these sections
 1. Convert long-running code section(s) to parallel where appropriate
 1. Determine speed of parallel code version

## Reproducible Output ##

It is useful to fix your program's input and the size of your problem.  If you feed experimental data into your code, then you want to have a good dataset that is large enough to be representative of your full-scale problem, but not too large to make testing take forever.  The same dataset should be used to check the speed of your parallel code, so you are comparing apples to apples.  Also, it is wise to check that the results you obtain from the parallel code are not just faster, but in fact still the same as the original code!

If you are using randomly generated numbers in your code, it is also important that they are repeatable for accurate performance measurement and to check correctness.  Computers can provide a sequence of pseudo-random numbers.  A random *seed* is used to initialize this sequence.  If you set the seed to a fixed value, then you will be able to check that the results stay the same as you parallelize your code.  When you have multiple processors generating random numbers at the same time, care should be taken to ensure each processor has independent random sequences.  Later, we will show specific examples of how to deal with random numbers in parallel MATLAB.

## Working Code ##

It is critical that your code is correct before you try to make it run faster.  The goal should be to make the code faster without changing the code's results.  And as we mentioned in the last section, you should have a fixed problem size that is large enough to be representative, but not too large so that you can repeatedly test it.

## Profile Code ##

It is tempting to start trying to parallelizing code right away.  But it is wise to first sit back and take a close look at your code.  Where are the bottlenecks that slow it down?  Is parallelization a practical optimization technique in this case?

As we have seen, introducing parallel code sections will not always make a great performance improvement.  And it isn't always obvious where the most time is actually spent in the code.

If you add commands to time sections of your code before running it, you will start to see where to look.  Sections of code to look at include initial and final file input/output steps, and especially main loops and function calls.  If your particular programming language supports it, using a profiler can also be helpful.

## Break Dependencies ##

If you have identified a code loop that takes a long time doing calculations, then you should take a closer look at it.  Each time through a loop is called an iteration.  So if a loop variable i runs from 1 to N, then there will be N loop iterations.

To run in parallel, each loop iteration must be independent.  Are there any values from variables computed in the previous loop iteration which are used in the current iteration?  If so, is this dependency necessary?  If all loop iterations are independent of each other, then they can run in any order, or run at once on multiple processors.

## Measure Improvement ##

We'll look at some examples specific to MATLAB later.  For now, let us assume you are able to make a parallel version of your code.  The final step is to time that parallel section and compare it to the original, just to ensure that the new parallel version is in fact helpful.  It is good to keep in mind that the particular computer you test on can affect results, especially the number of available processors.

In practice, it may take some work to measure speedup, but it is important when making speed optimizations to your code that you ensure you are actually improving the speed. So you will need some kind of experimental evidence that your parallelization is working.

Since there are a lot of external factors that can affect a program's running time, it is advisable to execute multiple timed runs of your program in order to get an idea how much the time may vary.

When parallelizing your code, you may make speed improvements that could also apply to the original sequential code.  Without making these improvements to the sequential code, you may see superlinear speedup.  This is why actual speedup will only be obtained by comparing against the best possible sequential code.

