# Write a program to determine, in the EAX register, the number of uppercase letters in a null-terminated string.

.data
  .str: .asciz "PewDiePie"
.text
.globl _start
_start:
__begin:
  movl $.str, %ebx
  movl $0, %edi
  xor %eax, %eax
loop_start:
  cmpb $0, (%ebx,%edi,1)
  je __end

  cmpb $'A', (%ebx,%edi,1)
  jl next
  cmpb $'Z', (%ebx,%edi,1)
  jg next
  incl %eax

next:
  incl %edi
  jmp loop_start
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80
