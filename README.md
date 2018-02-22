# f03python
A simple Python interface to run
[very high level embedded](https://docs.python.org/3.6/extending/embedding.html)
Python code from Fortran 2003/2008 using `iso_c_binding`.

## Build
Use the Makefile to build the interface:
```
$ make python
```
Or run your favourite Fortran compiler directly:
```
$ gfortran8 -c python.f90
```

## Example
Build the example with:
```
$ make example
```
Run:
```
$ ./example
Hello, World!
```

## Licence
ISC
