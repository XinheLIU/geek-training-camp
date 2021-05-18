# Chapter 02: Speed up Python code

- [Chapter 02: Speed up Python code](#chapter-02-speed-up-python-code)
  - [Optimization Steps](#optimization-steps)
  - [Profiler-based Optimization](#profiler-based-optimization)
    - [find hotspots with profilers and implement using faster languages (Cython, C++)](#find-hotspots-with-profilers-and-implement-using-faster-languages-cython-c)
    - [Do multiprocessing, multithreading （as last step)](#do-multiprocessing-multithreading-as-last-step)
    - [Python Profilers](#python-profilers)
  - [Cython and C](#cython-and-c)
    - [Cython](#cython)
    - [OpenMP](#openmp)
  - [Reference](#reference)

## Optimization Steps

"Premature Optimization Is the Root of All Evil" - Stackify 2020

- Implementation
  - number of loops, repeated operations, I/O，etc
- Complexity
  - analyze algorithm details and analyze performance
- Details
  - Hashing, caching, memory, [SIMD](https://en.wikipedia.org/wiki/SIMD#:~:text=Single%20instruction%2C%20multiple%20data%20(SIMD,on%20multiple%20data%20points%20simultaneously.))
- Parrallel, process and threading

## Profiler-based Optimization

For Python, usually we need to

### find hotspots with profilers and implement using faster languages (Cython, C++)

- Profilers
  - function profiler
    - no particularly good one for Python (Python too high-level)
  - line profiler
    - needs to break down one operation each line
- Hotspots
  - hard to link CPU/GPU performance to code lines
  - Python not able to work on memory blocks directly
  - must understand the algorithm
- Find Root Cause: General principles
  - analyze memory read write operations
    - [RAM](https://en.wikipedia.org/wiki/Random-access_memory)
    - [CPU Cache](https://en.wikipedia.org/wiki/CPU_cache)
      - we cannot control cache, but caching is usually where the problem is
        - separated memory blocks
        - read multiple times
          - branch predication: if condition changes
          - [cache miss](https://hazelcast.com/glossary/cache-miss/)
    - [Register](https://en.wikipedia.org/wiki/Processor_register)
      - where CPU works
  - [SIMD](https://en.wikipedia.org/wiki/SIMD#:~:text=Single%20instruction%2C%20multiple%20data%20(SIMD,on%20multiple%20data%20points%20simultaneously.))
      - [OpenMP](https://en.wikipedia.org/wiki/OpenMP)
      - [intrinsics](https://en.wikipedia.org/wiki/Intrinsic_function)
        - work on compiler
  
### Do multiprocessing, multithreading （as last step)

- companies share resources/machines
- frames, server expansion
  - docker +  k8s for dynamic resource allocation

### Python Profilers

- Function profiler
  - [cProfile](https://docs.python.org/3/library/profile.html)
    - no call tree & GUI, each line information
    - sometimes not accurate
- Line profiler
  - No good one for Python
    - [line_profile](https://pypi.org/project/line-profiler/)
  - [VTune](https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/vtune-profiler.html) for C++
    - [V-Tune cookbook](https://software.intel.com/content/www/us/en/develop/documentation/vtune-cookbook/top.html)
    - [Free Intel Tools](https://software.intel.com/content/www/us/en/develop/articles/qualify-for-free-software.html)

## Cython and C

### [Cython](https://cython.readthedocs.io/en/latest/src/tutorial/cython_tutorial.html)

- compatible with Python
- C syntax
  - static class
- code protection in distribution
- Compling 
  - Use [setuptools](https://setuptools.readthedocs.io/en/latest/) or [disutils](https://docs.python.org/3/library/distutils.html)
    - notice compiler flags and gbd_debug choices
    - [building Cython code](https://cython.readthedocs.io/en/latest/src/quickstart/build.html)

### [OpenMP](https://www.openmp.org/)

- hard grammar, C-like
  - [Introduction](https://computing.llnl.gov/tutorials/openMP/)
- parrallel programming basics
  - [race condition](https://www.baeldung.com/cs/race-conditions)
  - mutex

## Reference

McKinney, Wes (2012). Python for data analysis: Data wrangling with Pandas, NumPy, and IPython. ” O’Reilly Media, Inc.”.
Prokhorenkova, Liudmila et al. (2018). “CatBoost: unbiased boosting with categorical features”. In: Advances in neural information processing systems, pp. 6638–6648.
Python, Real (2020). What Is the Python Global Interpreter Lock (GIL)? url: https://realpython.com/python-gil/.
Stackify (2020). Why Premature Optimization Is the Root of All Evil. url: https://stackify.com/premature- optimization-evil/.
   Vtune-Cookbook (2020). Intel® VTuneTM Profiler Performance Analysis Cookbook. url: https://software.intel.com/content/www/us/en/ develop/documentation/vtune-cookbook/top.html.