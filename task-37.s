# Implement a function to get the sum of 32-bit integer values passed as parameters through the stack.
# The result is returned in the EAX register.

.globl _start
.text
_start:
__begin:
  sub $4, %esp
  push $2
  push $3
  push $10
  push $12
  push $4 # n

  call sum

  add $((4+1)*4), %esp # %esp << (n+1)*4
  pop %eax
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

sum:
  mov 4(%esp), %ecx
  mov $0, %eax
  mov $8, %ebx

.sum_loop:
  cmp $0, %ecx
  je .sum_done

  add (%esp,%ebx,1), %eax
  add $4, %ebx
  dec %ecx
  jmp .sum_loop

.sum_done:
  mov 4(%esp), %ecx
  lea 8(%esp,%ecx,4), %edx
  mov %eax, (%edx)
  ret
