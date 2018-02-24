FC      = gfortran8
CFLAGS  = -fcheck=all -ffast-math -funroll-loops -Ofast -march=native -Wl,-rpath=/usr/local/lib/gcc8/
LDFLAGS = -I/usr/local/include/ `python3.6-config --ldflags`
SRC     = python.f90
OBJ     = python.o
EXAMPLE = example

all: $(OBJ) $(EXAMPLE)

python: $(OBJ)

$(OBJ):
	$(FC) -c $(SRC)

$(EXAMPLE): $*.f90 $(OBJ)
	$(FC) $(CFLAGS) -o $@ $? $(LDFLAGS)

.PHONY: clean

clean:
	rm *.mod $(OBJ) $(EXAMPLE)
