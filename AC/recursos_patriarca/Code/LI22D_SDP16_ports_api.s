	.section .startup
	; sec��o com c�digo de arranque
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
	
	.text
	; sec��o com c�digo aplicacional
main:
	; ...
	
/* -------------------------------------------------------
 * Implementa��o de API para portos paralelos 
 * -----------------------------------------------------*/
/* Devolve o valor atual do estado dos bits do porto de entrada. */
; uint16_t inport_read ();
inport_read:
	mov		r0, #ADDR_INPUT_PORT & 0xFF
	movt	r0, #ADDR_INPUT_PORT >> 8
	ldrb	r0, [r0]
	mov		pc, lr


/* Faz a inicia��o do porto, atribuindo o valor value aos seus bits. */
; void outport_write ( uint8_t value );
outport_write:
	ldr		r1, addr_outport
	strb	r0, [r1]
	ldr		r1, addr_outport_img
	strb	r0, [r1]
	mov		pc, lr
	
addr_outport:
	.word	ADDR_OUTPUT_PORT
	

/* Atribui o valor l�gico um aos pinos do porto de sa�da identificados com o valor um em pins_mask . O valor dos restantes bits n�o � alterado. */
; void outport_set_bits ( uint8_t pins_mask );
outport_set_bits:
	push	lr
	ldr		r1, addr_outport_img
	ldrb	r1, [r1]
	orr		r0, r1, r0
	bl		outport_write
	pop		pc
	

/* Atribui o valor l�gico zero aos pinos do porto de sa�da identificados com o valor um em pins_mask . O valor dos restantes bits n�o � alterado. */
; void outport_clear_bits ( uint8_t pins_mask );
outport_clear_bits:
	push	lr
	ldr		r1, addr_outport_img
	ldrb	r1, [r1]
	mvn		r0, r0
	and		r0, r1, r0
	bl		outport_write
	pop		pc

/* Atribui aos bits do porto de sa�da identificados com o valor l�gico um em pins_mask o valor dos bits correspondentes de value . O valor dos restantes bits n�o � alterado. */
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
	
;	.data
	; sec��o com dados globais iniciados
	; ...

	.section .bss
	; sec��o com dados globais n�o iniciados
outport_img:
	.space	1
	
	.equ STACK_SIZE, 64
	.section .stack
	; sec��o stack para armazenamento de dados tempor�rios
	.space	STACK_SIZE
stack_top:
