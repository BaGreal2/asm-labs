# Write a program to find the greatest value in an array of integers. The value should be put into the EAX register and its address into EBX.
.data
  .array: .long 4, -5, -4, 14, -2, -8, -8, 7, 9, -2, 5, 8, 10, 10
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
  cmpl %esi, %ecx
  jle next
  mov %ecx, %esi
  lea (%ebx,%edi,4), %edx

next:
  incl %edi
  jmp loop_start
loop_end:
  mov %esi, %eax
  mov %edx, %ebx
__end:
  nop

  mov $1, %eax
  int $0x80
