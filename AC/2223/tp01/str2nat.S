; ---------------------------------------------
; uint16_t str2nat(char numeral [] , uint16_t radix)
; r0 = &numeral[0], r1 = radix, r2 = number, r3 = error
; r4 = idx, r5 = temp r6 = temp, r7 = temp, r8 = tmp, r9 = temp

.equ NAN, 0xFFFF

str2nat:
    push lr
    push r4
    push r5
    push r6
    push r7

    mov r2, #0 ; number = 0
    mov r3, #0 ; error = 0
    mov r4, #0 ; idx = 0
    mov r5, #0 ; tmp = 0 
    mov r6, #0 ; temp = 0

str2nat_loop:
    cmp r3, r6 ; error == 0 
    bne str2nat_return
    lsl r6, r4, #1 
    ldr r6, [r0, r6] 
    mov r7, #'\0' ; temp = \0
    cmp r6, r7 ; 
    bne str2nat_return
    mov r0, r6
    bl char2nat
    ; r0 = number (char2nat)
    mov r5, r0          
    mov r7, #NAN & 0xFF     ; temp = NAN
    movt r7, #NAN & 0xFF
    cmp r5, r7
    bne multiply
    b if_str2nat

if_str2nat:
    mov r2, r7 
    mov r3, #1
    b if_end_str2nat

multiply:
    mov r6, #0 

while:
    mov r7, #0           
    cmp r7, r1        
    bge while_end
    add r6, r6, r2      ; r2 -> multiplicando
    sub r1, r1, #1      ; r1 -> multiplicador
    b while

while_end:
    add r2, r6, r5      ; r6 -> resultado da multiplicação

if_end_str2nat:
    add r4, r4, #1
    b str2nat_loop

str2nat_return:
    mov r0, r2

pop r7
pop r6
pop r5
pop r4
pop pc


; ---------------------------------------------
; uint16_t char2nat(char symbol, uint16_t radix)
; r0 = symbol, r1 = radix, r2 = number, r3 = temp
; r4 = temp, r5 = temp

    push lr
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
    pop pc
    b .


