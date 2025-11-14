.SUFFIXES:

SOURCES := $(wildcard *.s)
BINS    := $(patsubst %.s,bin/%,$(SOURCES))
OBJS    := $(patsubst %.s,%.o,$(SOURCES))

.PHONY: all clean
all: $(BINS)

bin/%: %.o | bin
	ld -m elf_i386 -o $@ $<

%.o: %.s
	as --32 -g -o $@ $<

bin:
	mkdir -p bin

clean:
	rm -f $(OBJS) $(BINS)
