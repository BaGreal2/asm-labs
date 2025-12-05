# Implement and test a procedure for filling a 32-bit integer array, passed
# on the stack, with successive terms of the Fibonacci sequence.

.globl _start
.data
  array: .long 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  end_array:
  .equ array_size, (end_array - array)/4
.text
_start:
__begin:
  push $array_size
  push $array
  call fib_arr
  add $8, %esp
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

fib_arr:
  mov 4(%esp), %ebx
  mov 8(%esp), %ecx

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
