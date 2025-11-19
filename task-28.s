# Write a program to convert a non-negative integer represented textually
# (as a null-terminated string) in the decimal positional system into its
# internal (binary) form and store it in the EAX register.
# Hint: use Horner's scheme.

.data
  .str: .asciz "12"
.text
.globl _start
_start:
__begin:
  movl $.str, %ebx
  xor %edi, %edi
  xor %eax, %eax
loop_start:
  cmpb $0, (%ebx,%edi,1)
  je __end

  movzbl (%ebx,%edi,1), %esi
  sub $'0', %esi
  imul $10, %eax
  add %esi, %eax

  incl %edi
  jmp loop_start
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80
