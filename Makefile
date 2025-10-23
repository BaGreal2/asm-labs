task-01: task-01.o
	ld -m elf_i386 -o $@ $^

task-01.o: task-01.s
	as --32 -g -o $@ $<

.PHONY: clean
clean:
	rm -f task-01 task-01.o
