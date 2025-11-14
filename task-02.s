.text
.globl _start
# edx <- ebx^2 + ecx^2
_start:
  # 3^2 + 9^2 = 90
  mov $3, %ecx
  mov $9, %ebx
  imul %ebx, %ebx
  imul %ecx, %ecx
  add %ecx, %ebx
  mov %ebx, %edx
  nop
  
  mov $1, %eax
  int $0x80
