.text
.globl _start
_start:
  # 4 + 5 = 9
  mov $45, %esi
  mov %esi, %eax
  xor %edx, %edx
  mov $10, %ecx
  div %ecx # eax = esi/10, edx = esi%10
  add %edx, %eax
  nop
  
  mov $1, %eax
  int $0x80
