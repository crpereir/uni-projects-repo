

; EXERCICIO 1
; a) Uma vez que, no P16, cada instrução é representada por um código binário de 16 bits, 
;    cada instrução da codificação vai ser codificada com 2 bytes de memórica. 
;    Assim, tendo 14 instruções e ocupando cada uma 2 bytes, temos que 14*2= 28 bytes.

; b) A afirmação não está correta uma vez que, utilizando R4 para implementar a variável 
;    local, teriamos que fazer vários acessos à memória e isso não seria uma solução 
;    conveniente.


; EXERCICIO 2  
; a) O valor da constante NAN seria 65535, uma vez que 2^16-1 = 65535. Este valor é o maior que 
;    pode ser representado numa variável do tipo uint16_t (16 bits sem sinal).

; b) A constante NAN pode significar "Not a Number" - significa que qualquer resultado que seja 
;    ou igual a esse valor pode ser considerado indefinido ou inválido.
;    Em termos de requisitos de memória, essa definição requer apenas um espaço de memória 
;    suficiente para armazenar um valor inteiro sem sinal a 16 bits (uint16_t).



; --------------------------------------------------
; constants
.equ STACK_SIZE, 64
.equ NAN, 0xFFFF

;; ----------------------------------------------------------------------------
; startup section = PREPARE STACK AND CALL MAIN
    .section startup
    b _start
    b .
_start:
    ldr sp, sp_addr
    mov r0, pc
    add lr, r0, #4
    ldr pc, main_addr   ; pc <- main()
    b .
sp_addr:
    .word stack_addr
main_addr:
    .word main


; ----------------------------------------------------------------------------
; code
    .text

; ---------------------------------------------
; int main (void) 
; R0 = error, R1 = temp, R2 = temp, r3 = temp, r4 = temp, r5 = temp, r6 = temp

main:
    push lr
    push r4
    push r5
    push r6
    mov r0, #0
    strb r0, error_addr
main_if_cond1:
    ldr r1, tst_str0_addr
    mov r2, #2
    mov r6, r0
    bl str2nat
    mov r3, r0
    mov r0, r6
    mov r6, #0
    ldr r4, tst_results_addr
    ldr r5, [r4, r6]
    cmp r3, r5
    beq main_if_cond2
    mov r6, #1
    orr r0, r0, r6                       ; bla = bla | 1

main_if_cond2:
    ldr r1, tst_str1_addr
    mov r2, #8
    mov r6, r0
    bl str2nat
    mov r3, r0
    mov r0, r6
    mov r6, #1
    ldr r4, tst_results_addr
    ldr r5, [r4, r6]
    cmp r3, r5
    beq main_if_cond3
    mov r6, #2
    orr r0, r0, r6                       ; bla = bla | 1

main_if_cond3:
    ldr r1, tst_str1_addr
    mov r2, #16
    mov r6, r0
    bl str2nat
    mov r3, r0
    mov r0, r6
    mov r6, #2
    ldr r4, tst_results_addr
    ldr r5, [r4, r6]
    cmp r3, r5
    beq main_return
    mov r6, #4
    orr r0, r0, r6                       ; bla = bla | 1

main_return:
    mov r0, #0
    pop r6
    pop r5
    pop r4
    pop pc 
    b .


; addresses for indirect jumps
tst_str0_addr:
    .word tst_str0

tst_str1_addr:
    .word tst_str1

tst_str2_addr:
    .word tst_str2

tst_results_addr:
    .word tst_results

error_addr:
    .word error

; ---------------------------------------------
; uint16_t str2nat(char numeral [] , uint16_t radix)
; r0 = &numeral[0], r1 = radix, r2 = number, r3 = error
; r4 = idx, r5 = temp, r6 = temp, r7 = temp

    push lr
str2nat:
    push r4
    push r5
    push r6
    push r7

    mov r2, #0                ; number = 0
    mov r3, #0                ; error = 0
    mov r4, #0                ; idx = 0
    mov r5, #0                ; tmp = 0  ? 
    mov r6, #0                ; temp = 0 

str2nat_loop:
    cmp r3, r6                ; error == 0 
    bne str2nat_return
    lsl r6, r4, #1 
    ldr r6, [r0, r6] 
    mov r7, #'\0'             ; temp = '\0'
    cmp r6, r7  
    bne str2nat_return
    mov r0, r6
    bl char2nat
    ; r0 = number (char2nat)
    mov r5, r0          
    mov r7, #NAN & 0xFF       ; temp = NAN
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
    add r6, r6, r2           ; r2 -> multiplicando
    sub r1, r1, #1           ; r1 -> multiplicador
    b while

while_end:
    add r2, r6, r5           ; r6 -> resultado da multiplicação

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


; ----------------------------------------------------------------------------
; data = INITIALIZED GLOBAL DATA
    .data

tst_str0:
    .byte  '0', '1', '0', '1', '1'
    .align 1
tst_str1:
    .byte  '7', '0', '9'
    .align 1
tst_str2:
    .byte  '9', 'A', '0', 'F'

tst_results: 
    .word 0x000B, 0x01C9, 0x9A0F   ; 11, 457, 39439

; ----------------------------------------------------------------------------
; bss = NON INITIALIZED GLOBAL DATA
    .section .bss
error:
    .space 1   ; porque são 8 bits 


; ----------------------------------------------------------------------------
; stack = STACK STARTS HERE
    .section .stack
    .space STACK_SIZE
stack_addr:
