# ebx <- abs(ecx - edx)
.text
.globl _start
_start:
  mov $7, %ecx
  mov $9, %edx
__begin:
  sub %edx, %ecx
  cmp $0, %ecx
  jg gtz
ltz:
  neg %ecx
gtz:
  mov %ecx, %ebx
__end:
  nop

  mov $1, %eax
  int $0x80
