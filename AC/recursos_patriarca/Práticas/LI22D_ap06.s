	.section .startup
	; secção com código de arranque
	b		_start	
	b 		.	    
_start:
	ldr		sp, addr_stack_top
	mov		r0, pc
	add		lr, r0, #4
	ldr		pc, addr_main
	b		.
addr_main:
	.word main
addr_stack_top:
	.word stack_top

	.equ	ADDR_INPUT_PORT, 0xFF80
	.equ	ADDR_OUTPUT_PORT, 0xFFC0
	.equ 	ADDR_PTC, 0xFF40
	.equ	TCR_OFS, 0
	.equ	TMR_OFS, 2
	.equ	TC_OFS,  4
	.equ	TIR_OFS, 6
	
	.equ	CNT_ENA, 0
	.equ	CNT_DIS, 1
	.equ	PTC_MOD, 256
	.equ	TIMEOUT_1S, 10
	.equ	LED_ON, 1
	.equ	LED_OFF, 0
	
	
	.text
	; secção com código aplicacional
main:
	push	lr
	push	r4
	mov		r0, #PTC_MOD-1
	bl		ptc_init
	bl		ptc_start
	
loop:
	bl		ptc_get_value
	mov		r4, r0
	mov		r0, #LED_OFF
	bl		outport_write
loop_apagado:
	mov		r0, r4
	bl		ptc_elapsed
	mov		r1, #TIMEOUT_1S
	cmp		r0, r1
	blo		loop_apagado
	
	bl		ptc_get_value
	mov		r4, r0
	mov		r0, #LED_ON
	bl		outport_write
loop_aceso:
	mov		r0, r4
	bl		ptc_elapsed
	mov		r1, #TIMEOUT_1S
	cmp		r0, r1
	blo		loop_aceso
	b 		loop

	pop		r4
	pop		pc

/* -------------------------------------------------------
 * Implementação de API para temporizador pTC
 * -----------------------------------------------------*/
ptc_start:
	mov		r0, #CNT_ENA
	ldr		r1, addr_ptc
	strb	r0, [r1, #TCR_OFS]
	mov		pc, lr

ptc_stop:
	ldr		r0, addr_ptc
	mov		r1, #CNT_DIS
	strb	r1, [r0, #TCR_OFS]
	mov		pc, lr

; IN - R0 = intervalo --> módulo de contagem (valor a escrever no TMR)
; Parar o contador e levar a 0
; Programa TMR
; Limpar TIR
ptc_init:
	push	lr
	push	r0
	; Pára contador
	bl		ptc_stop
	pop		r0
	ldr		r1, addr_ptc
	; Programa módulo
	strb	r0, [r1, #TMR_OFS]
	; Limpa TIR
	strb	r0, [r1, #TIR_OFS]
	pop		pc

; OUT - R0 = valor atual de TC
ptc_get_value:
	ldr		r0, addr_ptc
	ldrb	r0, [r0, #TC_OFS]
	mov		pc, lr

; IN - R0 = last_read
; OUT - R0 = diferença entre valor atual de TC e last_read
ptc_elapsed:
	push	lr
	push	r0
	bl		ptc_get_value
	pop		r1
	cmp		r0, r1
	bcs		ptc_elapsed_else
	sub		r0, r0, r1
	b		ptc_elapsed_end
ptc_elapsed_else:
	mov		r2, #PTC_MOD & 0xFF
	movt	r2, #PTC_MOD >> 8
	sub		r1, r2, r1
	add		r0, r0, r1
ptc_elapsed_end:
	pop		pc

addr_ptc:
	.word 	ADDR_PTC
/* -------------------------------------------------------
 * Implementação de API para portos paralelos 
 * -----------------------------------------------------*/
/* Devolve o valor atual do estado dos bits do porto de entrada. */
; uint16_t inport_read ();
inport_read:
	mov		r0, #ADDR_INPUT_PORT & 0xFF
	movt	r0, #ADDR_INPUT_PORT >> 8
	ldrb	r0, [r0]
	mov		pc, lr


/* Faz a iniciação do porto, atribuindo o valor value aos seus bits. */
; void outport_write ( uint8_t value );
outport_write:
	ldr		r1, addr_outport
	strb	r0, [r1]
	ldr		r1, addr_outport_img
	strb	r0, [r1]
	mov		pc, lr
	
addr_outport:
	.word	ADDR_OUTPUT_PORT
	

/* Atribui o valor lógico um aos pinos do porto de saída identificados com o valor um em pins_mask . O valor dos restantes bits não é alterado. */
; void outport_set_bits ( uint8_t pins_mask );
outport_set_bits:
	push	lr
	ldr		r1, addr_outport_img
	ldrb	r1, [r1]
	orr		r0, r1, r0
	bl		outport_write
	pop		pc
	

/* Atribui o valor lógico zero aos pinos do porto de saída identificados com o valor um em pins_mask . O valor dos restantes bits não é alterado. */
; void outport_clear_bits ( uint8_t pins_mask );
outport_clear_bits:
	push	lr
	ldr		r1, addr_outport_img
	ldrb	r1, [r1]
	mvn		r0, r0
	and		r0, r1, r0
	bl		outport_write
	pop		pc

/* Atribui aos bits do porto de saída identificados com o valor lógico um em pins_mask o valor dos bits correspondentes de value . O valor dos restantes bits não é alterado. */
; void outport_write_bits ( uint8_t pins_mask , uint8_t value ); 
outport_write_bits:
	push	lr
	and		r1, r1, r0 ; filtra os bits de value correspondentes a pins_mask
	ldr		r2, addr_outport_img
	ldrb	r2, [r2]
	mvn		r0, r0
	and		r2, r2, r0
	orr		r0, r2, r1
	bl		outport_write
	pop		pc

addr_outport_img:
	.word	outport_img
	
	.data
	; secção com dados globais iniciados
last_trg:
	.word	0

	.section .bss
	; secção com dados globais não iniciados
outport_img:
	.space	1
	
	.equ STACK_SIZE, 64
	.section .stack
	; secção stack para armazenamento de dados temporários
	.space	STACK_SIZE
stack_top:
