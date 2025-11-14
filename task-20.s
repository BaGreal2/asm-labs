# Write a program to calculate in the EAX register the mean value of the items greater than 0 in an array of integers, ignoring the fractional part.
.data
  .array: .long 4, -5, -4, -2, -8, -8, 7, 9, -2, 5, 8, 10, 10
  .end_array:

  .equ .array_size, (.end_array - .array)/4
.text
.globl _start
_start:
__begin:
  movl $.array, %ebx
  xor %esi, %esi
  xor %eax, %eax
  xor %edi, %edi
loop_start:
  cmpl $.array_size, %edi
  jge loop_end

  movl (%ebx,%edi,4), %ecx
  cmpl $0, %ecx
  jle next
  addl %ecx, %eax
  incl %esi

next:
  incl %edi
  jmp loop_start
loop_end:
  cdq   
  idiv %esi
__end:
  nop

  mov $1, %eax
  int $0x80
