# eax <- max(ebx, ecx, edx)
.text
.globl _start
_start:
  mov $12, %ebx
  mov $9, %ecx
  mov $4, %edx
__begin:
  cmp %ebx, %ecx
  jg gt
lt:
  mov %ebx, %esi
  jmp sc
gt:
  mov %ecx, %esi
sc:
  cmp %edx, %esi
  jg gt2
lt2:
  mov %edx, %eax
  jmp __end
gt2:
  mov %esi, %eax
__end:
  nop

  mov $1, %eax
  int $0x80
