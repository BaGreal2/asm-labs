.globl _start
.data
  prefix: .ascii "PID: "
  prefix_len = . - prefix
.bss
  buf: .skip 12
.text
_start:
  mov $20, %eax
  int $0x80

  push %eax

  mov $4, %eax
  mov $1, %ebx
  mov $prefix, %ecx
  mov $prefix_len, %edx
  int $0x80

  pop %eax

  lea buf+11, %edi
  movb $'\n', (%edi)
  dec %edi
  mov $10, %ecx

conv:
  xor %edx, %edx
  div %ecx
  add $'0', %dl
  mov %dl, (%edi)
  dec %edi
  cmp $0, %eax
  jne conv
  inc %edi

  mov $4, %eax
  mov $1, %ebx
  mov %edi, %ecx
  mov $(buf+12), %edx
  sub %edi, %edx
  int $0x80

  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
