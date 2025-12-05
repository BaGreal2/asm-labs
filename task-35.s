# Implement a function to determine the maximum of three 32-bit integer values passed as parameters on the stack. 
# The result is passed in the EAX register.
# Provide an example of using the implemented function to determine the maximum of
# the first three elements of an array of 32-bit integers.

.globl _start
.data
  array: .long 3, 25, 67
.text
_start:
__begin:
  movl array, %eax
  movl array+4, %ebx
  movl array+8, %ecx

  sub $4, %esp

  push %ecx
  push %ebx
  push %eax

  call max3

  add $12, %esp
  pop %eax
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

max3:
  mov 12(%esp), %eax
  mov 8(%esp),  %ebx
  mov 4(%esp),  %ecx

  cmp %ebx, %eax
  jge .check_c
  mov %ebx, %eax

.check_c:
  cmp %ecx, %eax
  jge .done
  mov %ecx, %eax

.done:
  mov %eax, 16(%esp)
  ret
