# Implement a function to determine the length of the first word in a string
# ending with zero, passed as a parameter on the stack. The result is returned in
# the ECX register. Word separators are: space and tab characters.
# Use the function to determine the length of subsequent words in the example
# string.

.globl _start
.data
  str: .asciz "Hello World\tSailor!"
.text
_start:
__begin:
  mov $str, %ebx
  call next_word
  call next_word
  call next_word
__end:
  nop

  xor %ebx, %ebx
  mov $1, %eax
  int $0x80

next_word:
  push %ebx
  call first_word_len
  add $4, %esp
  cmp $0, %ecx
  je nw_end

  add %ecx, %ebx

skip_delims:
  cmpb $' ', (%ebx)
  je skip_one
  cmpb $'\t', (%ebx)
  je skip_one
  cmpb $0, (%ebx)
  je nw_end
  ret

skip_one:
  inc %ebx
  jmp skip_delims

nw_end:
  ret

first_word_len:
  mov 4(%esp), %ebx
  mov $0, %ecx
fw_loop:
  cmpb $0, (%ebx,%ecx,1)
  je fw_done
  cmpb $' ', (%ebx,%ecx,1)
  je fw_done
  cmpb $'\t', (%ebx,%ecx, 1)
  je fw_done

  inc %ecx
  jmp fw_loop

fw_done:
  ret
