# Implement and test a procedure for filling a 32-bit integer array, passed by
# parameters via registers (EBX — array start address, ECX — number of array
# elements), with successive terms of the Fibonacci sequence.

.globl _start
.data
  array: .long 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  end_array:
  .equ array_size, (end_array - array)/4
.text
_start:
__begin:

  mov $array, %ebx
  mov $array_size, %ecx

  call fib_arr
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

fib_arr:
  push %eax
  push %edx
  push %edi
  push %ebp

  movl $1, (%ebx)
  cmpl $1, %ecx
  jle loop_end

  movl $1, 4(%ebx)
  cmpl $2, %ecx
  jle loop_end
  
  mov $1, %eax
  mov $1, %edx
  movl $2, %edi
loop_start:
  cmpl %ecx, %edi
  jge loop_end

  movl %eax, %ebp
  addl %edx, %ebp
  movl %ebp, (%ebx,%edi,4)
  movl %edx, %eax
  movl %ebp, %edx

  incl %edi
  jmp loop_start

loop_end:
  pop %ebp
  pop %edi
  pop %edx
  pop %eax
  ret
