# ecx <- (eax*ecx - edx^2) / -ebx
.text
.globl _start
_start:
  # (2*4 - 8^2) / -7 = 8
  mov $2, %eax
  mov $4, %ecx
  mov $8, %edx
  mov $7, %ebx
__begin:
  imul %eax, %ecx
  imul %edx, %edx
  sub %edx, %ecx
  mov %ecx, %eax
  neg %ebx
  cdq
  idiv %ebx
  mov %eax, %ecx
__end:
  nop

  mov $1, %eax
  int $0x80
