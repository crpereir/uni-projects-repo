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

	
	.text
	; secção com código aplicacional
main:
	; ...
	
	.data
	; secção com dados globais iniciados
	; ...

	.section .bss
	; secção com dados globais não iniciados
	
	.equ STACK_SIZE, 64
	.section .stack
	; secção stack para armazenamento de dados temporários
	.space	STACK_SIZE
stack_top:
