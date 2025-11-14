# eax <- max(ebx, ecx, edx)
.text
.globl _start
_start:
  mov $12, %ebx
  mov $9, %ecx
  mov $4, %edx
__begin:
  mov %ebx, %eax
  cmp %ecx, %eax
  jg 1
  mov %ecx, %eax
1:
  cmp %edx, %eax
  jg 2
  mov %edx, %eax
2:
__end:
  nop

  mov $1, %eax
  int $0x80
