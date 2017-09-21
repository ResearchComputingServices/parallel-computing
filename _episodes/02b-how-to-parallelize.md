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

 - Determine section(s) where code takes a long time
     - time sections of code (we'll show examples in Matlab, but all programming languages have a way to check elapsed time)
 - Fix input so results are reproducible
     - want to make code faster, but not change the results
     - choose one input data set
     - fix seed for random numbers
 - If possible, break apart any dependencies in section(s), then convert code section to parallel
