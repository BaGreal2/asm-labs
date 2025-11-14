.SUFFIXES:

SOURCES := $(wildcard *.s)
BINS    := $(SOURCES:.s=)
OBJS    := $(SOURCES:.s=.o)

.PHONY: all clean
all: $(BINS)

%: %.o
	ld -m elf_i386 -o $@ $<

%.o: %.s
	as --32 -g -o $@ $<

clean:
	rm -f $(BINS) $(OBJS)
