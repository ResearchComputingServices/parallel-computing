---
title: "Parallel vs Sequential Computing"
teaching: 0
exercises: 0
questions:
- "What is Parallel Computing?"
objectives:
- "First objective."
keypoints:
- "First key point."
---

## What is Parallel Computing?

Parallel computing us a programming method that harnesses the power of multiple processors at once.  Once of concern only to programmers of large supercomputers, modern computers now almost always have multicore processors.

Typical programming assumes that computers execute one operation at a time in the order specified in your program code.  At any time step, the computer's Central Processing Unit (CPU) core will be working on a particular operation.  We will call this traditional style of computing *sequential*.

In contrast, with *parallel* computing we will now be dealing with multiple CPU cores that each are indepedently working on their own sequence of instructions.  This can allow us to do much more at once, and therefore get results more quickly than if only running an equivalent sequential program.  The act of changing sequential code to parallel code is called *parallelization*.

So, even when coming to the world's largest supercomputer, running your existing sequential code will not show a big difference in performance.  When you do have a larger server to run your code on, you need to ensure that you are effectively using the multiple cores that are available.

## Why use Parallel Computing?

Parallel computing, even on a smaller scale, has become more popular over the last decade.  Before this time, the speed of CPUs was continually increasing.  The solution to a computer running to slowly was often to purchase a newer, faster computer.

This continual increasing in computer performance is often termed Moore's Law:  the rule of thumb that every *x* number of years, computer performance would increase *y* times. However, this is no longer the case due to the thermal limits of CPU manufacturing.

What CPU designers can do instead of increasing the speed of a CPU core, is to cram more cores into a physical CPU chip.  The laptop or desktop you are working on now probably has around 4 cores in it.  The servers we use in Carleton's Research and Development Cloud have up to 32 cores.  It is even possible to have a program span to multiple computers across a network in order to access even more cores at once.

In this workshop, we will talk about the conceptual differences between sequential and parallel programming, discuss when to expect performance improvements from converting to parallel code, and as an example apply these concepts in practice to example Matlab code.

## Using cores: Parallel vs Sequential Batch

When we talk about parallel programming, we mean writing a single code that simultaneously uses multiple processing cores.

In fact, there is another way to make efficient use of many processor cores.  If you need or could change your code to run as many smaller, separate programs then you could run multiple programs at once to make use of the CPU cores.  If you have more of these small jobs to run, then they could all be queued up in the background and automatically run as previous jobs finish.

For example, if you are processing a large number of data files, say large volumes of sensor data, it may be possible to run each data file in an independent program.  Monte Carlo methods, which involve many repeated and independent random samples, could also be broken apart into separate programs.  Or perhaps you want to run a simulation across a range of parameters.

Running this kind of sequential batch processing does not require any specialized programming, and just a few tricks on a Linux server to setup effectively.  It is not in the scope of the proceeding lessons, but if it sounds applicable to your work I would encourage you to investigate this technique.
