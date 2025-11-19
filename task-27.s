# Write a program to check whether a null-terminated string is a palindrome.
# The result — 0 or 1 — should be the AL register.

.data
  .str: .asciz "PewDieEidWeP"
.text
.globl _start
_start:
__begin:
  movl $.str, %ebx
  movl $0, %edi
loop_start:
  cmpb $0, (%ebx,%edi,1)
  je loop_end

  cmpb $'a', (%ebx,%edi,1)
  jl next
  cmpb $'z', (%ebx,%edi,1)
  jg next
  andb $0xDF, (%ebx,%edi,1)

next:
  incl %edi
  jmp loop_start
loop_end:
  decl %edi
  xor %esi, %esi
pal_loop:
  cmp %esi, %edi
  jle is_pal

  movb (%ebx,%esi,1), %al
  movb (%ebx,%edi,1), %dl
  cmpb %dl, %al
  jne not_pal

  incl %esi
  decl %edi
  jmp pal_loop

is_pal:
  movb $1, %al
  jmp __end
not_pal:
  xor %al, %al
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80
