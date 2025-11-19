# Write a program to convert lower case letters to upper case in a null-terminated string.
# Hint: Arithmetic operations can of course be used to change the case of a letter,
# but so can bitwise operations, taking into account that the difference in ASCII codes 
# between the corresponding lowercase and uppercase letters is 32 = 2^5

.data
  .str: .asciz "PewDiePie_real2011"
.text
.globl _start
_start:
__begin:
  movl $.str, %ebx
  movl $0, %edi
loop_start:
  cmpb $0, (%ebx,%edi,1)
  je __end

  cmpb $'a', (%ebx,%edi,1)
  jl next
  cmpb $'z', (%ebx,%edi,1)
  jg next
  andb $0xDF, (%ebx,%edi,1)

next:
  incl %edi
  jmp loop_start
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80
