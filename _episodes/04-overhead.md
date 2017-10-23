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

- Memory
 - e.g. if more memory allocated for parallel version and perhaps swapping occurs
- Disk
- Network
- Communication Overhead
- Multiple runs to account for "variation" in runtime

## Communication Overhead ##

When running in parallel, data will need to be shared between processors and at times processors will need to coordinate.  This communication between processors takes extra time, although the amount is very dependent on system details such as the hardware used and low-level implementation of parallel constructs.  Some programming languages have built-in support for parallel programming that hide this additional cost of processor communication, but it is still there.

The amount of overhead is often dependent on how many processors are being used.  So the improvement from increasing the number of processors can be diminished by the increased overhead of more processors working together.

## Hardware Bottlenecks ##

There are additional low-level computer system details that can affect parallel performance.  These often occur as bottlenecks in particular hardware systems.

Memory access speed is a key component in computer system performance.  This operates at different levels.  Frequently or recently used values stored in RAM can be cached inside the CPU to speed up future access.  At some levels, this caching is shared between processor cores on a physical chip.  So when running in parallel less caching might be available as processors share this resource.  Conversely, a small amount of very fast caching is not shared so there is more opportunity to cache additional RAM values when it fits into this type of cache across more than one processor core.

Similarly, if a program has a large amount of data that just fits in RAM, and when going parallel additional local copies of some data are needed for each processor, then it is possible that a parallel code running on a single computer would start to exhaust available RAM.  At this point disk would have to be used as overflow space for RAM, causing the system to slow down.

For computer programs that read or write a lot of data to disk, the speed of that disk is clearly important.  For example, let's say your you have a program tat writes a sequences of large file to disk.  When run in parallel, each processor would try to write its file to disk at the same time.  However, if the disk performance is at maximum capacity saving just one file, the additional requests to save will not run any faster.  In fact, juggling all the requests to disk may even slow the system down a somewhat.

For some types of parallel programming, programs can operate across multiple computers to increase the scale of processors available.  Coordinating and communicating across a network is certainly going to slow down performance compared to a parallel program that runs entirely on one system.

Since there are a lot of external factors that can affect the running time of a program, it is advisable to execute multiple timed runs of your program in order to get an idea how much the time may vary.
