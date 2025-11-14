# ebx <- abs(edx)
.text
.globl _start
_start:
  mov $-3, %edx
__begin:
  cmp $0, %edx
  jg gtz
ltz:
  neg %edx
gtz:
  mov %edx, %ebx
__end:
  nop

  mov $1, %eax
  int $0x80
