FC      = gfortran8
CFLAGS  = -fcheck=all -ffast-math -funroll-loops -Ofast -march=native -Wl,-rpath=/usr/local/lib/gcc8/
LDFLAGS = -I/usr/local/include/ -L/usr/local/lib/
LIBS    =  -lpython3.6m  -lutil -lm

SRC     = python.f90
OBJ     = python.o

EXAMPLE = example

all: $(OBJ)

python: $(OBJ)

$(OBJ):
	$(FC) -c $(SRC)

$(EXAMPLE): $*.f90 $(OBJ)
	$(FC) $(CFLAGS) -o $@ $? $(LDFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm *.mod $(OBJ) $(EXAMPLE)
