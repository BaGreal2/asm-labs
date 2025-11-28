# Implement a function to do division with integer rounding.
# The didividend is passed in the EBX register, the divisor in ECX,
# and the result (of dividing EBX by ECX) is returned in the EAX register.
# Then use this function to determine the result of dividing EAX by EDX.

.text
.globl _start
_start:
  mov $15, %eax
  mov $4,  %edx
__begin:
  mov %eax, %ebx
  mov %edx, %ecx
  call divide_round
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

# dividend: %ebx, divisor: %ecx, out: %eax
divide_round:
  push %edx
  mov %ebx, %eax
  xor %edx, %edx
  div %ecx
  mov %ecx, %esi
  shr $1, %esi
  cmp %esi, %edx
  jb .no_round
  inc %eax
.no_round:
    pop %edx
    ret
