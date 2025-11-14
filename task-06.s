# ecx <- (eax^2 + ebx) / edx
.text
.globl _start
_start:
  # (4^2 + 8) / 3 = 24 / 3 = 8
  mov $4, %eax
  mov $8, %ebx
  mov $3, %edx
__begin:
  imul %eax, %eax
  add %eax, %ebx
  mov %ebx, %eax
  mov %edx, %ebx
  xor %edx, %edx
  div %ebx
  mov %eax, %ecx
__end:
  nop
  
  mov $1, %eax
  int $0x80
