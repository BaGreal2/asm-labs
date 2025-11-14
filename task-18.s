# Write a program to calculate in the EAX register the sum of items greater than 0 in an array of integers.
.data
  .array_size: .long 7
  .array: .long 4, -5, 7, 9, -2, 5, 8
.text
.globl _start
_start:
__begin:
  movl $.array, %ebx
  xor %eax, %eax
  xor %edi, %edi
loop_start:
  cmpl (.array_size), %edi
  jge __end

  movl (%ebx,%edi,4), %ecx
  cmpl $0, %ecx
  jle next
  addl %ecx, %eax

next:
  incl %edi
  jmp loop_start
__end:
  nop

  mov $1, %eax
  int $0x80
