# ecx <- max(eax, ebx)
.text
.globl _start
_start:
  mov $7, %eax
  mov $9, %ebx
__begin:
  cmp %eax, %ebx
  jg gt
lt:
  mov %eax, %ecx
  jmp __end
gt:
  mov %ebx, %ecx
__end:
  nop

  mov $1, %eax
  int $0x80
