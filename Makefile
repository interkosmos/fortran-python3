.POSIX:
.SUFFIXES:

FC      = gfortran
PYTHON  = python3
FFLAGS  = -Wall -fmax-errors=1 -fcheck=all -std=f2003
LDLIBS  = `$(PYTHON)-config --ldflags`

SRC     = src/python3.f90
TARGET  = python3.o

DIR     = examples
SIMPLE  = simple
STRING  = string

.PHONY: all clean $(TARGET) $(SIMPLE) $(STRING)

all: $(TARGET) $(SIMPLE) $(STRING)

$(TARGET):
	$(FC) $(FFLAGS) -c $(SRC)

$(STRING): $(DIR)/$(STRING)/$(STRING).f90 $(TARGET)
	$(FC) $(FFLAGS) -o $(DIR)/$(STRING)/$@ $? $(LDLIBS)

$(SIMPLE): $(DIR)/$(SIMPLE)/$(SIMPLE).f90 $(TARGET)
	$(FC) $(FFLAGS) -o $(DIR)/$(SIMPLE)/$@ $? $(LDLIBS)

clean:
	rm *.mod
	rm $(TARGET)
	rm $(DIR)/$(SIMPLE)/$(SIMPLE)
	rm $(DIR)/$(STRING)/$(STRING)
