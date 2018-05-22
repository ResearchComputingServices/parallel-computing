---
title: "Hardware bottlenecks and overhead"
teaching: 0
exercises: 0
questions:
- "What else slows me down?"
objectives:
- "First objective."
keypoints:
- "First key point."
---

## Communication Overhead ##

When running in parallel, data will need to be shared between processors and at times processors will need to coordinate.  This communication between processors add running time, although the amount is very dependent on system details such as the hardware used and low-level implementation of parallel functions.  Some programming languages have built-in support for parallel programming that hide this additional cost of processor communication, but it is still there.

The amount of overhead is often dependent on how many processors are being used.  So the improvement from increasing the number of processors could be diminished by the increased overhead of more processors working together.

## Hardware Bottlenecks ##

There are additional low-level computer system details that can affect parallel performance.  These often occur as bottlenecks in particular hardware systems.

Memory access speed is a key component in computer system performance.  RAM is orders of magnitude slower than data access within the processor itself.  For this reason, modern computer designs include multiple levels of *cache* memory.  This fast memory is inside or at least close to processors.  It stores frequently or recently used values to speed up future access.  When running in parallel, some processor cores may be sharing cache.  Depending on the cores' memory access patterns, running in parallel can therefore affect the frequency of slow data fetches from RAM.

Similarly, if a program has a large amount of data that just fits in RAM, and when going parallel additional local copies of some data are needed for each processor, then it is possible that a parallel code running on a single computer would start to exhaust available RAM.  At this point disk would have to be used as overflow space for RAM, causing the system to slow down.

For computer programs that read or write a lot of data to disk, the speed of that disk is clearly important.  For example, let's say you have a program that writes a collection of large files to disk in parallel.  Each processor would try to write its file to disk at the same time.  However, if the disk performance is at maximum capacity when saving just one file, the simultaneous requests to save will not run any faster.  In fact, juggling all the requests to disk may even slow the system down somewhat.

For some types of parallel programming, programs can operate across multiple computers to increase the number of processors.  On the other hand, coordinating and communicating across a network could slow down performance compared to a parallel program that runs entirely on one computer.
