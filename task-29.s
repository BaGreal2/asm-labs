# Write a program to convert a non-negative integer value stored
# in EAX to text representation in the decimal positional system.

.data
  buf: .space 16
.text
.globl _start
_start:
  mov $1342, %eax
__begin:
  lea buf+15, %edi # %edi = EOB, shifting backwards
  movb $0, (%edi)
  decl %edi
convert_loop:
  xor %edx, %edx
  mov $10, %ecx
  div %ecx

  addb $'0', %dl
  movb %dl, (%edi)
  decl %edi

  cmp $0, %eax
  jnz convert_loop

  incl %edi
  mov %edi, %esi
  mov $buf, %edi

copy_loop:
  movb (%esi), %al
  movb %al, (%edi)
  inc %esi
  inc %edi
  cmp $0, %al
  jne copy_loop

__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80
