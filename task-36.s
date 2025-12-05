# Implement a function to check whether the parameter values, passed on the stack,
# can be the lengths of a triangle's sides. The result (a value of 1, indicating YES, or 0, indicating NO)
# is returned in the AL register.
# Hint: Check whether the sum of the lengths of two sides of the triangle is greater than the length of the third — longest — side. 
# You can use the function to determine the maximum value of three integers.

.globl _start
.text
_start:
  mov $3, %eax
  mov $4, %ebx
  mov $50, %ecx

__begin:
  push %ecx
  push %ebx
  push %eax
  call check_triangle
  add $12, %esp
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

max3:
  mov 8(%esp),  %eax
  mov 12(%esp), %ebx
  mov 16(%esp), %ecx

  cmp %ebx, %eax
  jge .check_c
  mov %ebx, %eax

.check_c:
  cmp %ecx, %eax
  jge .max_done
  mov %ecx, %eax

.max_done:
  ret

check_triangle:
  call max3

  mov %eax, %edi

  mov 4(%esp),  %eax
  mov 8(%esp),  %ebx
  mov 12(%esp), %ecx

  mov %eax, %esi
  add %ebx, %esi
  add %ecx, %esi

  sub %edi, %esi

  cmp %edi, %esi
  jg .triangle_yes

  mov $0, %al
  ret

.triangle_yes:
  mov $1, %al
  ret
