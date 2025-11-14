# Write a program to find the n-th Fibonacci number (the n-th term of the Fibonacci sequence).
# The value of n is in the ECX register, and the result should be in the EAX register.
# Successive terms of the sequence are: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
.text
.globl _start
_start:
  mov $6, %ecx
  mov $1, %eax
  mov $0, %ebx
  mov $1, %esi
__begin:
loop:
  cmp %ecx, %esi
  jge __end
  mov %ebx, %edx
  mov %eax, %ebx
  add %edx, %eax
  inc %esi
  jmp loop
__end:
  nop

  mov $1, %eax
  int $0x80
