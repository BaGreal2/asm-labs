# Write a program to determine, in the ECX register, the number of items greater than 0 in an array of integers.
.data
  .array_size: .long 7
  .array: .long 4, -5, 7, 9, -2, 5, 8
.text
.globl _start
_start:
__begin:
  movl $.array, %ebx
  xor %ecx, %ecx
  xor %edi, %edi
loop_start:
  cmpl (.array_size), %edi
  jge __end

  movl (%ebx,%edi,4), %eax
  cmpl $0, %eax
  jle next
  incl %ecx

next:
  incl %edi
  jmp loop_start
__end:
  nop

  mov $1, %eax
  int $0x80
