# Mu.jl

[![Build Status](https://travis-ci.org/zenna/Mu.jl.svg?branch=master)](https://travis-ci.org/zenna/Mu.jl)

[![codecov.io](http://codecov.io/github/zenna/Mu.jl/coverage.svg?branch=master)](http://codecov.io/github/zenna/Mu.jl?branch=master)

Minimal but flexible probabilistic programming language

# Documentation

<!-- [![](https://img.shields.io/badge/docs-stable-blue.svg)](https://zenna.github.io/Mu.jl/stable) -->
[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://zenna.github.io/Mu.jl/latest)

# Quick start

First import Mu:

```julia
using Mu
```


First construct a probabilistic program, which in Mu is a Random Variable.
The simplest way to do this is to compose primitive random variables 

```julia
μ = uniform(0.0, 1.0)
```

`μ` is a uniformly distributed random variable.
`μ` is not a sample, nor does it represent one, it is a value of type `RandVar`.
To get a sample use `rand`

```julia
rand(μ)
0.42770819318033215
```

So far we haven't done anything that you couldn't do using the random number generators in `Base` or `Distributions.jl`.
So, let's to dome conditioning.
First we construct a new random variable which depends on `μ`

```julia
μ = uniform(0.0, 1.0)
x = normal(μ, 1.0)
```

`x` is a random variable.  We can sample from it:
```julia
x = normal(μ, 1.0)
0.9778179079436203
```

Finally we can condition the random variables:

```julia
samples = rand(μ, x == 30.0)
```

`samples` is a set of samples from the conditional distribution of `mu` given that `x==30.0`