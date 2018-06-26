---
title: "Types of Parallel Workers"
teaching: 0
exercises: 0
questions:
- ""
objectives:
- "First objective."
keypoints:
- "First key point."
---

If a program is going to use multiple processor cores, then it needs to simultaneously do more than one "thing" at once.  There are two types of these "things", or what we may informally call tasks.  The computer's  operating system, manages scheduling tasks onto your hardware's processor cores.  Modern operating systems implement two different kinds of "tasks" - processes and threads.

There are two industry standards for parallel programming - OpenMP and MPI.  They are both available for C, C++, and Fortran and are the most common techniques for implementing high-performance computing code.  We will briefly describe the differences between these programming interfaces to illustrate the differences between processes and threads for parallel computing.

## Processes

A running instance of a software program is a *process*.  Each process has its own resources, such as memory space, open files, etc.  This means data (e.g. variables) visible in one process are isolated from other processes.

There can be multiple processes running of a particular software program.  In fact, this is often how parallel programming works - multiple processes of a program run.

However, recall that processes cannot directly access each others' data.  At times parallel tasks may need to share data, and there are techniques to communicate by sending and receiving data between each other.  These *messages* can even be sent over a network, allowing a parallel program's processes to span multiple computers.  The largest supercomputers are in fact large collections of computers used in this way.

The *Message Passing Interface*, or MPI, is a library for C, C++, Fortran, and unofficially other languages.  Using this library, programmers are able to start a parallel program that contains multiple processes, and send/receive messages between processes to coordinate and share data.  Because messages can be passed over a network, MPI can run across multiple computers.

![Parallel Processes](../fig/multiprocess.svg)

## Threads

A *process* can contain multiple *threads* of execution.  These threads all share access to the process' data, and so it can be easier and faster to use threads for parallel programming.  However, since the threads are all contained in a single process, they are all on the same computer.

The *OpenMP* programming interface extends C, C++, and Fortran with commands to perform multi-threaded shared memory parallel programming.  It is often easier to modify a program using OpenMP compared to MPI, but an OpenMP program can only run on a single computer.

![Parallel Threads](../fig/multithreading.svg)
