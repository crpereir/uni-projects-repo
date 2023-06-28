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

	
	.text
	; sec��o com c�digo aplicacional
main:
	; ...
	
	.data
	; sec��o com dados globais iniciados
	; ...

	.section .bss
	; sec��o com dados globais n�o iniciados
	
	.equ STACK_SIZE, 64
	.section .stack
	; sec��o stack para armazenamento de dados tempor�rios
	.space	STACK_SIZE
stack_top:
