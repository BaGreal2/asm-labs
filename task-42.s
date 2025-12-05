# Implement a function to calculate the arithmetic mean value of the items
# of a 32-bit integer array, passed on the stack. The result is returned
# via the EAX register.
# Test the function on three different arrays.

.globl _start
.data
  array1: .long 32, 25, 67
  end_array1:
  .equ array_size1, (end_array1 - array1)/4
  array2: .long 97, 12, 88
  end_array2:
  .equ array_size2, (end_array2 - array2)/4
  array3: .long 0, 1, 2, 55, 3
  end_array3:
  .equ array_size3, (end_array3 - array3)/4

.text
_start:
__begin:
  push $array_size1
  push $array1
  call mean_arr
  add $8, %esp

  push $array_size2
  push $array2
  call mean_arr
  add $8, %esp

  push $array_size3
  push $array3
  call mean_arr
  add $8, %esp
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

mean_arr:
  mov 4(%esp), %ebx
  mov 8(%esp), %ecx

  push %edi
  push %edx
  
  xor %edi, %edi
  xor %eax, %eax
loop_start:
  cmpl %ecx, %edi
  jge loop_end

  add (%ebx,%edi,4), %eax
  inc %edi
  jmp loop_start

loop_end:
  cdq
  idiv %ecx

  pop %edx
  pop %edi
  ret
