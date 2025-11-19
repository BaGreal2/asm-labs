# Write a program to determine, in the EAX register, the number of decimal digits
# (characters representing the digits 0 – 9) in a null-terminated string.

.data
  .str: .asciz "PewDiePie_real2011"
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

  cmpb $'0', (%ebx,%edi,1)
  jl next
  cmpb $'9', (%ebx,%edi,1)
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
