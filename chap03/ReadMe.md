# Chapter 03:  Data Manipulation and Visualization

- [Chapter 03:  Data Manipulation and Visualization](#chapter-03--data-manipulation-and-visualization)
  - [Data Preprocessing](#data-preprocessing)
  - [Visualization](#visualization)
  - [Jax](#jax)
    - [Enisum](#enisum)
    - [Jax Operations](#jax-operations)

## Data Preprocessing

- ETL
  - get data
- data processing
- online deloyment
  - new data/events when model deloyed online

model is linked to data processing

- Optimization work-flow. The pitfalls and the experiences. 
- General Profiling Methods with cProfile, line profiler, and intel Vtune.
- Cython and C. How to write bridge the gap between Python and the C world. What are good habits.
- Parallel programming with an emphasis on Ray and Cython Openmp.
- Exercises: Optimize Target Encoding.

Tools

- SQL → 难以自定义操作
- Spark → 自定义操作有时更麻烦，对于用来测试的中等数据集速度不如内存式。
- numpy → 矩阵和张量的处理。
- Pandas 和 R 的 dataframe。两个来源一样，是我们主 要的工具。
- dplyr → 一种 R 当中的语法，

## Visualization

- 目的不是为了画出漂亮的图写报告。
- 目的是提升模型预测的效果。
Matplotlib
Tensorboard

## [Jax](https://github.com/google/jax)


### [Enisum](https://numpy.org/doc/stable/reference/generated/numpy.einsum.html)

### Jax Operations

Jax 的四层优化策略:代码写法 →Jaxpr → JIT → XLA
