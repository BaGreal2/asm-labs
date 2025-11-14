# Write a program to fill an array of integers with the square of index.
.data
  .array: .long 1, 1, 1, 1, 1, 1, 1
  .end_array:

  .equ .array_size, (.end_array - .array)/4
.text
.globl _start
_start:
__begin:
  movl $.array, %ebx
  xor %edi, %edi
loop_start:
  cmpl $.array_size, %edi
  jge __end

  mov %edi, %edx
  imul %edx, %edx
  movl %edx, (%ebx,%edi,4)

  incl %edi
  jmp loop_start
__end:
  nop

  mov $1, %eax
  int $0x80
