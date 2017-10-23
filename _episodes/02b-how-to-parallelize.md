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

## Working Code ##

First, it is critical that your code is correct before you try to make it run faster.  And as we mentioned in the last section, you should have a fixed problem that is a size that is large enough to be representative, but not so large that you can test it repeatedly.

## Fixed Input ##

## Profile Code ##

## Break Dependencies ##

## Measure Improvement ##

