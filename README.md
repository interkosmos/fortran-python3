# f03python
A simple interface for [embedding Python 3 code](https://docs.python.org/3.6/extending/embedding.html)
in Fortran 2003/2008, using `iso_c_binding`.

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
You may have to modify the Makefile depending on your Python version.
Run the example:
```
$ ./example
 Konnichiwa!
```

## Licence
ISC
