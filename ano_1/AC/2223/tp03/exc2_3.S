    ldr r0, sym
    strb r2, [ r1, r4 ]
    push r1
    push r2
    mov r0, r15
    ldr r5, [ r0, #0]
    pop r3
sym:
    .word val
val:
    .word 0x4321