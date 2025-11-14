# Write a program to calculate and store in the EAX register the sum of squares of the digits
# in the decimal representation of an unsigned value located in the EDI register, assuming that
# this value (in the decimal representation) is at most a 2-digit number.
.text
.globl _start
_start:
  # 4^2 + 5^2 = 41
  mov $45, %edi
  mov %edi, %eax
  xor %edx, %edx
  mov $10, %ecx
  div %ecx # eax = esi/10, edx = esi%10
  imul %eax, %eax
  imul %edx, %edx
  add %edx, %eax
  nop
  
  mov $1, %eax
  int $0x80
