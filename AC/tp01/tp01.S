

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


    
; ---------------------------------------------
; uint16_t str2nat (char numeral [ ] , uint16_t radix )


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

result: 
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
