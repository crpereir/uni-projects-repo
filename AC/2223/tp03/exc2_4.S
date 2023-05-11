; Ficheiro:  lab03.S
; Descricao: Programa para a realização da 3a atividade laboratorial de
;            Arquitetura de Computadores.
; Autor:     Tiago M Dias (tiago.dias@isel.pt)
; Data:      29-03-2023

;-------------------------------------------------------------
	.equ	STACK_SIZE, 64                
	.equ	INPORT_ADDRESS, 0xFF80        
	.equ	OUTPORT_ADDRESS, 0xFFC0       

;--------------------------------------------------------------
	.section startup
	b	_start
	b	.
_start:
	ldr	sp, tos_addr
	ldr	pc, main_addr

tos_addr:
	.word	tos
	
main_addr:
	.word	main


;-----------------------------------------------------------------------
	.text

inport_read:
	ldr	r1, inport_addr
	ldrb r0, [r1, #0]
	mov	pc, lr

inport_addr:
	.word	INPORT_ADDRESS


outport_write:
	ldr	r1, outport_addr
	strb r0, [r1, #0]
	mov	pc, lr

outport_addr:
	.word	OUTPORT_ADDRESS
	
	

loop:
	mov r2, #inport_read
    ldrb R1, [r2, #0]           ; Lê o valor do porto de entrada
    and R1, R1, #1    			; Testa o bit zero
    cmp R1, #1                  
    bne loop          			; Se for zero, volta ao início do loop
    
    ldrb R0, [r2, #0] 			; Lê o valor do porto de entrada
    lsl R1, R0, #8    		    ; Testa o bit mais significativo para determinar se o número é positivo ou negativo
    orr R1, r1, r0
	mov r2, #outport_write
    str r1, [r2, #0]
    



;-------------------------------------------------------------------------------------------------
	.data


;--------------------------------------------------------------------------------------------------
;global uninitialized data

	.section .bss

;--------------------------------------------------------------------------------------------------
;global initialized data

	.section .stack
	.space	STACK_SIZE
tos:
