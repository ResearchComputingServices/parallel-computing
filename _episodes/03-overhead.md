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

When running in parallel, data will need to be shared between
processors.  This communication between processors takes extra time.
Some programming languages hide this additional cost of parallelizing, but it is still there.

## Hardware Bottlenecks ##

