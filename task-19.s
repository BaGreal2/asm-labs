# Write a program to calculate in the EAX register the mean value of the items
# in an array of integers, ignoring the fractional part.

.data
  .array: .long 4, -5, 7, 9, -2, 5, 8
  .end_array:

  .equ .array_size, (.end_array - .array)/4
.text
.globl _start
_start:
__begin:
  movl $.array, %ebx
  xor %eax, %eax
  xor %edi, %edi
loop_start:
  cmpl $.array_size, %edi
  jge loop_end

  movl (%ebx,%edi,4), %ecx
  addl %ecx, %eax
  incl %edi
  jmp loop_start
loop_end:
  xor %edx, %edx
  mov $.array_size, %ecx
  idiv %ecx
__end:
  nop

  mov $1, %eax
  int $0x80
