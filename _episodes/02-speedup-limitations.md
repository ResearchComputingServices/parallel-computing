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
