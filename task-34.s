# Implement a function to determine a power, whose base and exponent are parameters passed
# through the stack in the following order: first the base, then the exponent. 
# The result is returned in the EAX register.

.globl _start
.text
_start:
  mov $2, %eax
  mov $4, %ebx
__begin:
  sub $4, %esp
  push %eax
  push %ebx
  call power
  add $8, %esp
  pop %eax
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

power:
  mov 4(%esp), %ecx
  mov 8(%esp), %eax
  mov $1, %edx

.pow_loop:
  cmp $0, %ecx
  jz .pow_done

  imul %eax, %edx
  dec %ecx
  jmp .pow_loop

.pow_done:
  mov %edx, 12(%esp)
  ret
