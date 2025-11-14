# Write a program to find the greatest common divisor of the numbers in the EAX and EBX registers. The result of the operation should be in the EAX register.
.text
.globl _start
_start:
  # gcd: 18
  mov $252, %eax
  mov $198, %ebx
__begin:
loop:
  cmp $0, %ebx
  je __end
  xor %edx, %edx
  div %ebx
  mov %ebx, %eax
  mov %edx, %ebx
  jmp loop
__end:
  nop

  mov $1, %eax
  int $0x80
