# Write a program to fill an array of 32-bit integers with consecutive terms of the Fibonacci sequence.
# Assume the following definition of the Fibonacci sequence:
# Successive terms of the sequence are: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Hint: Each consecutive term beyond the first two can be obtained by summing the two words immediately preceding it.

.data
  .array: .long 1, 1, 1, 1, 1, 1, 1
  .end_array:

  .equ .array_size, (.end_array - .array)/4
.text
.globl _start
_start:
__begin:
  movl $.array, %ebx
  mov $1, %eax
  mov $1, %edx
  movl %eax, (%ebx)
  movl %edx, 4(%ebx)
  movl $2, %edi
loop_start:
  cmpl $.array_size, %edi
  jge __end

  movl %eax, %ecx
  addl %edx, %ecx
  movl %ecx, (%ebx,%edi,4)
  movl %edx, %eax
  movl %ecx, %edx

  incl %edi
  jmp loop_start
__end:
  nop

  mov $1, %eax
  int $0x80
