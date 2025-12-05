# Implement a function to convert a non-negative integer in text representation
# (as a string ending with 0) in the decimal positional system to its internal
# (binary) form. The parameter is passed via the EBX register, and the result is
# returned via the EAX register.
#
# Hint: use Horner's scheme.

.globl _start
.data
  str: .asciz "12324"
.text
_start:
__begin:
  mov $str, %ebx
  call dec_from_str
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

dec_from_str:
  push %edi
  push %esi

  xor %edi, %edi
  xor %eax, %eax
loop_start:
  cmpb $0, (%ebx,%edi,1)
  je conv_end

  movzbl (%ebx,%edi,1), %esi
  sub $'0', %esi
  imul $10, %eax
  add %esi, %eax

  incl %edi
  jmp loop_start

conv_end:
  pop %esi
  pop %edi
  ret
