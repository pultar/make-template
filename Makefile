CC=g++
CCFLAGS=-g -Wall
SRC=src
OBJ=obj
SRCS=$(wildcard $(SRC)/*.cc)
OBJS=$(patsubst $(SRC)/%.cc, $(OBJ)/%.o, $(SRCS))
BINDIR=bin
BIN=$(BINDIR)/main

all: $(BIN)

release: CCFLAGS=-Wall -O3 -DNDEBUG
release: clean
release: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CCFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.cc
	$(CC) $(CCFLAGS) -c $< -o $@

clean:
	$(RM) -r bin/* $(OBJ)/*
