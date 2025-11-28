# Write a function (procedure) to swap the values of two 16-bit integer variables,
# indicated by parameters in ESI and EDI registers.
# Hint: the parameters must be pointers, i.e. addresses.

.text
.globl _start
.data
a: .word 8
b: .word 4

.text
_start:
  mov $a, %esi
  mov $b, %edi
__begin:
  call swap16
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

# swap16: swap two 16-bit ints at [ESI] and [EDI]
swap16:
  push %eax
  push %edx

  movw (%esi), %ax
  movw (%edi), %dx

  movw %ax, (%edi)
  movw %dx, (%esi)

  pop %edx
  pop %eax
  ret
