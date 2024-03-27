        .section .rodata

data:   .byte  47, 101, 116,  99
        .byte  47, 111, 115,  45
        .byte 114, 101, 108, 101
        .byte  97, 115, 101,   0
        .byte  73,  83,  69,  76

        .text
        .globl _start
_start:
        movq $-100, %rdi			# value to be ignored because pathname is absolute
        leaq data(%rip), %rsi		# pathname of file
        xorq %rdx, %rdx				# flag 0 -> 0_RDONLY
        movq $257, %rax				# open file
        syscall						# __first syscall__		

        movq %rax, %r15				# preserve file descriptor value

        movq %r15, %rdi				# file descriptor of file
        xorq %rsi, %rsi				# offset 0
        movq $2, %rdx				# point to end of file
        movq $8, %rax				# lseek
        syscall						# __second syscall__

        movq %rax, %r14				# preserve offset (begin -> end) value

        xorq %rdi, %rdi				# start address 0, kernel choose address
        movq %r14, %rsi				# size of content of file
        movq $1, %rdx				# prot (1) -> pages may be read
        movq $2, %r10				# flag (2) -> map private (copy-on-write mapping)
        movq %r15, %r8				# file descriptor of file
        xorq %r9, %r9				# offset 0
        movq $9, %rax				# mmap (put the file in memory)
        syscall						# __third syscall__

        movq $1, %rdi				# file descriptor 1 (standart output)
        movq %rax, %rsi				# start of content to write (memory)
        movq %r14, %rdx				# size of content
        movq $1, %rax				# write to standart output
        syscall 					# __forth syscall__

        xorq %rdi, %rdi				# status code 0 (exit success)
        movq $231, %rax				# exit 
        syscall						# __fifth syscall__

        .end
