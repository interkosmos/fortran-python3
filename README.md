# f03python
A simple interface for [embedding Python 3 code](https://docs.python.org/3.6/extending/embedding.html)
in Fortran 2003/2008, using `iso_c_binding`. Currently, this library is just a
proof of concept.

## Build
Use BSD make to build the interface:
```
$ make python
```
Or run your favourite Fortran compiler directly:
```
$ gfortran8 -c python.f90
```
You may have to modify the name of the Python binary, for instance:
```
$ make all PYTHON=python3
```

## Examples
Please check the directory `examples` for some demos:

* **simple** just calls the Python interpreter. Not very useful.
* **string** calls a function inside a Python module and prints the returned
  string to stdout.

Compile the examples with:
```
$ make <name>
```

## Licence
ISC
