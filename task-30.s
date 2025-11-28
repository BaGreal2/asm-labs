# Implement a function to determine the cube (third power) of a parameter value passed in the EBX register. 
# The result is returned in the EAX register.
# Then show the use of this function to determine the value of the following arithmetic
# expression on unsigned integers, keeping the initial values in the EBX, ECX and EDX registers:
# EAX <- (EBX^3 + ECX^3) / EDX^3

.text
.globl _start
_start:
  # (4^3 + 6^3) / 2^3 = (64 + 216) / 8 = 35
  mov $4, %ebx
  mov $6, %ecx
  mov $2, %edx
__begin:
  # in: %ebx, out: %eax(%ebx^3)
  call cube
  push %eax

  push %ebx
  mov %ecx, %ebx
  # in: %ebx(%ecx), out: %eax(%ecx^3)
  call cube
  pop %ebx
  push %eax

  push %ebx
  mov %edx, %ebx
  # in: %ebx(%edx), out: %eax(%edx^3)
  call cube
  pop %ebx

  pop %esi # %ecx^3
  pop %edi # %ebx^3
  push %edx
  push %ebx
  add %esi, %edi
  xor %edx, %edx
  mov %eax, %ebx
  mov %edi, %eax
  div %ebx
  pop %ebx
  pop %edx
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

# in: %ebx, out: %eax
cube:
  mov  %ebx, %eax
  imul %ebx, %eax 
  imul %ebx, %eax
  ret
