# fortran-python3
A collection of ISO C binding interfaces to
[embed Python 3 code](https://docs.python.org/3.6/extending/embedding.html)
in Fortran 2003. Currently, this library is just a proof of concept.

## Build
Use the provided `Makefile` to build the interfaces:

```
$ make
```

Or run your favourite Fortran compiler directly:

```
$ gfortran -c src/python3.f90
```

You may have to modify the name of the Python binary, for instance:

```
$ make all PYTHON=python3.7
```

## Examples
Please check the directory `examples` for some demos:

* **simple** just calls the Python interpreter.
* **string** calls a function inside a Python module and prints the returned string to stdout.

Compile the examples with:

```
$ make <name>
```

## Licence
ISC
