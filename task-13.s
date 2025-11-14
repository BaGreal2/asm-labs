# edx <- ebx!
.text
.globl _start
_start:
  mov $5, %ebx
  mov $1, %edx
  mov $1, %esi
__begin:
loop:
  mov %ebx, %eax
  cmp %ebx, %esi
  jg __end
  imul %esi, %edx
  inc %esi
  jmp loop
__end:
  nop

  mov $1, %eax
  int $0x80
