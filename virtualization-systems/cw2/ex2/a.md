### Exercise 2

**a) List and explain the sequence of calls performed by the program in x86-64/prog.s**

----

The first syscall is to open the file with name indicated in data, in mode read-only. 
Parameter in rdi register is ignored because filename is absolute. Return, the file 
descriptor of open file, is preserved.

The second syscall is to calculate the offset from the beginning of file. This value 
is interpreted as the file size, which is preserved.

The third syscall is to map the file into memory, indicating that the kernel generates 
beginning address, the size of file previously calculated (second syscall), flag that 
indicates that the pages may be read, another flag which indicates that kernel should 
use copy-on-write mapping when defining the virtual address space, the file descriptor 
previously obtained (first syscall) and offset zero to start from the beginning of file.

The fourth is to write the content of file which was stored in memory (third syscall) 
to standard output.

The last syscall is to exit process with status of exit success (0).

NOTE: detail comments line by line in file cw2/ex2/x86-64/prog.s

