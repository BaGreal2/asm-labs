.text
.globl _start
_start:
  mov $2, %eax
  mov $3, %ecx
  mov $9, %ebx
  add %ecx, %eax
  sub %eax, %ebx
  mov %ebx, %edx
  nop
  
  mov $1, %eax
  int $0x80
