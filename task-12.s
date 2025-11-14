# edx <- ebx^ecx
.text
.globl _start
_start:
  mov $3, %ebx
  mov $7, %ecx
  mov $1, %edx
  xor %esi, %esi
__begin:
loop:
  cmp %ecx, %esi
  jge loop_end
  imul %ebx, %edx
  inc %esi
  jmp loop
loop_end:
  mov %edx, %edx
__end:
  nop

  mov $1, %eax
  int $0x80
