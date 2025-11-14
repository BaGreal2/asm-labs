# Write a program to check if the value located in the ESI register is a divisor of the value
# located in the EDI register. Results — 0 if it is a divisor or a non-zero value otherwise — is
# to be stored in the EAX.
.text
.globl _start
_start:
  mov $5, %esi
  mov $26, %edi
__begin:
  mov %edi, %eax
  xor %edx, %edx
  div %esi # eax = edi/esi, edx = edi%esi
  mov %edx, %eax
__end:
  nop
  
  mov $1, %eax
  int $0x80
