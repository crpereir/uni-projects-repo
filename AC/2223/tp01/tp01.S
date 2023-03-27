

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
;    igual a esse valor pode ser considerado indefinido ou inválido.
;    NAN pode ser uma variável global ou uma constante. Se fosse uma variável global, iria
;    para a secção ".data" (estaria alocada na memória). Se fosse uma constante (.equ), o
;    compilador iria procurar no ficheiro as suas ocorrências e substituir pelo seu valor. 
;    Neste caso é mais correto utilizar uma constante para não desperdiçar memória.



; --------------------------------------------------
; constants
.equ STACK_SIZE, 64
.equ NAN, 0xFFFF

; ----------------------------------------------------------------------------
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
    ldr r4, error_addr              ; movo para r4 o endereço de error
    mov r5, #0
    strb r5, [r4, #0]               ; error = 0
    ;mov r6, #0
    ;mov r7, #0
    ;mov r8, #0
    ;mov r9, #0
main_if_cond1:
    ldr r0, tst_str0_addr           ; vou buscar o endereço do tst_str0
    mov r1, #2 
    bl str2nat                 
    ldr r6, tst_results_addr        ; vou buscar o endereço do tst_results
    ldr r7, [r6, #0]                ; tst_results [0]
    cmp r0, r7                      ; str2nat(tst_str0,2) != tst_results [0]
    beq main_if_cond2
    mov r4, #1                         
    orr r5, r5, r4                  ; error |= 1
    ldr r4, error_addr              ; vou buscar o endereço do error
    strb r5, [r4, #0]               ; escrevo o valor da operação no error

main_if_cond2:
    ldr r0, tst_str1_addr           ; vou buscar o endereço do tst_str0
    mov r1, #8 
    bl str2nat                 
    ldr r6, tst_results_addr        ; vou buscar o endereço do tst_results
    ldr r7, [r6, #2]                ; tst_results [0]
    cmp r0, r7                      ; str2nat(tst_str0,2) != tst_results [0]
    beq main_if_cond3
    mov r4, #2                         
    orr r5, r5, r4                  ; error |= 1
    ldr r4, error_addr              ; vou buscar o endereço do error
    strb r5, [r4, #0]               ; escrevo o valor da operação no error

main_if_cond3:
    ldr r0, tst_str2_addr           ; vou buscar o endereço do tst_str0
    mov r1, #16 
    bl str2nat                 
    ldr r6, tst_results_addr        ; vou buscar o endereço do tst_results
    ldr r7, [r6, #4]                ; tst_results [0]
    cmp r0, r7                      ; str2nat(tst_str0,2) != tst_results [0]
    beq main_return
    mov r4, #4                         
    orr r5, r5, r4                  ; error |= 1
    ldr r4, error_addr              ; vou buscar o endereço do error
    strb r5, [r4, #0]               ; escrevo o valor da operação no error

main_return:
    mov r0, #0
    pop pc 
    b .


; addresses for indirect jumps

error_addr:
    .word error

tst_str0_addr:
    .word tst_str0

tst_str1_addr:
    .word tst_str1

tst_str2_addr:
    .word tst_str2

tst_results_addr:
    .word tst_results



; ---------------------------------------------
; uint16_t str2nat(char numeral [] , uint16_t radix)
; r0 = &numeral[0], r1 = radix, r2 = number, r3 = error
; r4 = idx, r5 = tmp, r6 = temp, r7 = temp, r8 = temp

    
str2nat:
    push r4
    push r5
    push r6
    push r7
    push r8

    mov r2, #0                ; number = 0
    mov r3, #0                ; error = 0
    mov r4, #0                ; idx = 0  
    
str2nat_loop:
    mov r6, #0                ; temp = 0 
    cmp r3, r6                ; error == 0 
    bne str2nat_return 
    ldrb r6, [r0, r4] 
    mov r7, #'\0'             ; temp = '\0'
    cmp r6, r7  
    beq str2nat_return
    mov r7, r0
    mov r0, r6
    mov r6, r3                ; guardar valor do error
    mov r8, r2
    push lr
    bl char2nat
    pop lr
    mov r2, r8
    mov r3, r6                ; restaurar valor do error 
    mov r5, r0  
    mov r0, r7        
    mov r7, #NAN & 0xFF       ; temp = NAN
    movt r7, #NAN & 0xFF
    cmp r5, r7
    bne else_str2nat
    mov r2, r7 
    mov r3, #1
    b str2nat_loop
else_str2nat:
    mov r6, r0                ; guardar valor do endereço da str
    mov r7, r3                ; guardar valor do error
    mov r0, r2
    mov r8, r1
    push lr
    bl multiply
    pop lr
    mov r2, r0
    mov r3, r7
    mov r0, r6
    mov r1, r8
    add r2, r2, r5            ; number = number * radix + tmp
    b if_end_str2nat

multiply:
    mov r2, #0
while:
    mov r3, #0
    cmp r3, r1
    bhs while_end
    add r2, r2, r0
    sub r1, r1, #1
    b while
while_end:
    mov r0, r2
    mov pc, lr

if_end_str2nat:
    add r4, r4, #1            ; idx++
    b str2nat_loop

str2nat_return:
    mov r0, r2

    pop r8
    pop r7
    pop r6
    pop r5
    pop r4
    mov pc, lr

; ---------------------------------------------
; uint16_t char2nat(char symbol, uint16_t radix)
; r0 = symbol, r1 = radix, r2 = number, r3 = temp
; r4 = temp, r5 = temp

    
char2nat:
    mov r2, #NAN & 0xFF
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



; ----------------------------------------------------------------------------
; data = INITIALIZED GLOBAL DATA
    .data

tst_results: 
    .word 0x000B, 0x01C9, 0x9A0F   ; 11, 457, 39439

tst_str0:
    .asciz  "01011"
    .align 1 ; stack anda de 2 em 2 e o array tem size ímpar
tst_str1:
    .asciz  "709"
    .align 1 ; stack anda de 2 em 2 e o array tem size ímpar
tst_str2:
    .asciz  "9A0F"



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
