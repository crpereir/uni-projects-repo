; ---------------------------------------------
; uint16_t char2nat(char symbol, uint16_t radix)
; r0 = symbol, r1 = radix, r2 = number, r3 = temp
; r4 = temp, r5 = temp

.equ NAN, 0xFFFF


char2nat:
    mov r2, #NAN &0xFF
    movt r2, #NAN & 0xFF
if:
    mov r3, #'0'
    cmp r0, r3          ; symbol >= '0'
    blo else_if
    mov r3, #'9'         
    cmp r3, r0          ; symbol <= '9'
    blo else_if
    mov r3, #'0'
    sub r2, r0, r3      ; number = symbol - '0'
    b if_cond1
else_if: 
    mov r3, #'A'         
    cmp r0, r3          ; symbol >= 'A'
    blo if_cond1
    mov r3, #'F' 
    cmp r3, r0          ; symbol <= 'F'
    blo if_cond1
    mov r3, #'A' 
    sub r2, r0, r3      ; number = symbol - 'A'
    add r2, r2, #10     ; number = r5 + 10
if_cond1:
    mov r3, #16
    cmp r3, r1          ; radix > 16
    bhs if_cond2
    b if_2
if_cond2:
    cmp r2, r1          ; number >= radix
    blo if_end
if_2:
    mov r2, #NAN & 0xFF
    movt r2, #NAN & 0xFF  
if_end:
    mov r0, r2          ; return number
    mov pc, lr
    b .
    