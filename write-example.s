.globl _start
.data
  str: .ascii "Hello, World!\n"
  end_str:
.text
_start:
  mov $4, %eax
  mov $1, %ebx
  lea str, %ecx
  mov $(end_str - str), %edx
  int $0x80

  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
