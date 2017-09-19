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

 - best possible speedup (usually) linear
 - In most real code some parts are intrinsically sequential.
 - Provide pseudocode to demonstrate critical path and Amdahl's Law, here's the kind of thing that we discussed:
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
  - Assume compute has perfect linear speedup, and discuss what happens as processors count increases.
  - Define Amdahl's Law
      - Show graph
  - Particle Swarm example - P particles provide speedup, of an
    individual search's iterative steps are inherently sequential
  - 
