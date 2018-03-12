FC      = gfortran8
PYTHON  = python3.6
CFLAGS  = -fcheck=all -Ofast -march=native -Wl,-rpath=/usr/local/lib/gcc8/
LDFLAGS = -I/usr/local/include/ `$(PYTHON)-config --ldflags`
SRC     = python.f90
OBJ     = python.o

DIR     = examples
SIMPLE  = simple
STRING  = string

all: $(OBJ) $(SIMPLE) $(STRING)

python: $(OBJ)

$(OBJ):
	$(FC) -c $(SRC)

$(STRING): $(DIR)/$*.f90 $(OBJ)
	$(FC) $(CFLAGS) -o $@ $? $(LDFLAGS)

$(SIMPLE): $(DIR)/$*.f90 $(OBJ)
	$(FC) $(CFLAGS) -o $@ $? $(LDFLAGS)

.PHONY: clean

clean:
	rm *.mod $(OBJ) $(SIMPLE) $(STRING)
