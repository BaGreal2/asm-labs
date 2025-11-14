# Write a program to calculate the sum of the first n terms of the Fibonacci sequence.
# The value of n is in the ECX register, and the result should be in the EAX register.
# Successive terms of the sequence are: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
.text
.globl _start
_start:
  mov $6, %ecx # n
  mov $1, %eax # curr
  mov $0, %ebx # prev
  mov $1, %esi # i
  mov $1, %edi # sum
__begin:
loop:
  cmp %ecx, %esi
  jge loop_end
  mov %ebx, %edx
  mov %eax, %ebx
  add %edx, %eax
  add %eax, %edi
  inc %esi
  jmp loop
loop_end:
  mov %edi, %eax
__end:
  nop

  mov $1, %eax
  int $0x80
