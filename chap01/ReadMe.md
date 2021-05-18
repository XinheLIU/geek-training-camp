# Chapter 01: Python

- [Chapter 01: Python](#chapter-01-python)
  - [Environment Set-up for Machine Learning](#environment-set-up-for-machine-learning)
  - [R Review](#r-review)
  - [Python Review](#python-review)

## Environment Set-up for Machine Learning

- Web-based
  - [Google Colab](https://colab.research.google.com/)
    - [use GPU/TPU in Colab](https://medium.com/deep-learning-turkey/google-colab-free-gpu-tutorial-e113627b9f5d#:~:text=Google%20Colab%20is%20a%20free,TensorFlow%2C%20PyTorch%2C%20and%20OpenCV.)
- Local Set-up
  - [gcc](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)/g++
    - GNU [make](https://www.gnu.org/software/make/manual/make.html)
  - [Conda](https://docs.conda.io/en/latest/)
    - use Miniconda
    - environmental variables configured in ~/.bashrc
  - R
    - conda install r-essentials r-base
  - [Docker](https://docs.docker.com/)
    - [NVidia Docker](https://github.com/NVIDIA/nvidia-docker) to use GPU in Docker
  - [CUDA](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html)
    - tips
      - disable nouveau
      - restart system and enter physical shell
      - shut down XServer
      - download runfile from official websire
      - add -noopengl-libs in your commands
    - installing CUDA must be done very carefully
  - [Jupyter](https://jupyter.org/)

## R Review

[Advantages of R](https://www.datacamp.com/community/tutorials/r-or-python-for-data-analysis)

- Stasitical Packages in CRAN
  - splines
  - linear models
    - automatically tell categorical variables, no one-hot needed
    - gam based lasso for variable selection
  - general modeling
    - no "model not recognized" problem
    - combine model with spline, L1 loss, etc
    - complex formulas
- Data Science Packages
  - [dplyr](https://dplyr.tidyverse.org/) and tidyverse
  - ggplot2
  - miss
    - for missing values
    - for nonlinear transformations

## Python Review

- python error handling
- Functional programming in Python
  - [Monad](https://github.com/jasondelaat/pymonad.git)
  - lazy evaluation
  - multi-thread
  - map reduce
  - scan
  - associate scan
- python variables and assignment
- pythonic class basics
  - [operators](https://docs.python.org/3/library/operator.html)
  - [operator overloading](https://www.geeksforgeeks.org/operator-overloading-in-python/)
  - [magic commands](https://www.tutorialsteacher.com/python/magic-methods-in-python)
  - decorators
    - [data class](https://docs.python.org/3/library/dataclasses.html)
    - func_tools, partial
- python logging
  - logging package
  - [Sphinix](https://www.sphinx-doc.org/en/master/)
- syntactic sugar