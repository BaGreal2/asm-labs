# Implement a function to check whether the parameter, 
# located in the EBX, ECX and EDX registers,
# can be the lengths of the sides of a right-angled triangle. 
# The result (a value of 1, indicating YES, or 0, indicating NO) is returned by the AL register.
# Hint: use the function to determine the square.

# c^2 = a^2 + b^2

.text
.globl _start
_start:
  mov $3, %ebx
  mov $4, %ecx
  mov $5, %edx
__begin:
  call check_right_triangle
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

# in: %ebx, %ecx, %edx; out: %eax, %esi, %edi
find_max:
  mov %ebx, %eax
  mov %ecx, %esi
  mov %edx, %edi
  cmp %eax, %ecx
  jg  .ecx_max
  cmp %eax, %edx
  jg  .edx_max
  ret
.ecx_max:
  mov %ecx, %eax
  mov %ebx, %esi
  mov %edx, %edi

  cmp %eax, %edx
  jg  .edx_max
  ret

.edx_max:
  mov %edx, %eax
  mov %ebx, %esi
  mov %ecx, %edi
  ret

square:
  mov  %ebx, %eax
  imul %ebx, %eax 
  ret

check_right_triangle:
  push %ebx
  push %ecx
  push %edx

  call find_max

  # compute max^2
  mov %eax, %ebx
  call square # EAX = max^2
  push %eax

  # compute smaller1^2
  mov %esi, %ebx
  call square # EAX = smaller1^2
  push %eax

  # compute smaller2^2
  mov %edi, %ebx
  call square # EAX = smaller2^2

  pop %esi
  pop %edi
  # sum the squares
  add %eax, %esi # EDI = smaller1^2 + smaller2^2

  # compare
  cmp %esi, %edi
  je .is_right

  mov $0, %al
  jmp .done_check

.is_right:
  mov $1, %al

.done_check:
  pop %edx
  pop %ecx
  pop %ebx
  ret
