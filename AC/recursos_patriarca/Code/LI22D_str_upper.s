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
	push	lr
	ldr		r0, addr_vstr
	bl		str_upper
	pop		pc
addr_vstr:
	.word 	vstr
	
test_to_upper:
	push	lr
	push	r4
	push	r5
	push	r6
	mov		r4, #v_end-v
	ldr		r5, addr_v
	ldr		r6, addr_vres
while:
	ldrb	r0, [r5]
	bl		to_upper
	strb	r0, [r6]
	add		r5, r5, #1
	add		r6, r6, #1
	sub		r4, r4, #1
	bzc		while	
	pop		r6
	pop		r5
	pop		r4
	pop		pc
addr_v: 
	.word	v
addr_vres: 
	.word	vres

	
	
/*
uint16_t str_upper ( char str [] ) {
	for ( uint16_t i = 0; str[i] != '\0'; i++ )
		str[i] = to_upper(str[i]);

	return i;
}
*/
str_upper:
	push	lr
	push	r4		; r4 = str
	push	r5		; r5 = i
	mov		r5, #0
	mov		r4, r0
	b 		str_upper_for_cond
str_upper_for:
	bl		to_upper
	strb	r0, [r4]
	add		r4, r4, #1
	add		r5, r5, #1	
str_upper_for_cond:
	ldrb	r0, [r4]
	sub		r0, r0, #0
	bne		str_upper_for
	mov		r0, r5
	pop		r5
	pop		r4
	pop		pc
	
/*
char to_upper ( char ch ) {
	char uc = ch;
	if (ch >= 'a' && ch <= 'z')
		uc = ch + ( 'A' - 'a');

	return uc;
}
*/
to_upper:
	mov		r1, #'a'
	cmp		r0, r1
	blo		to_upper_if_end
	mov		r1, #'z'
	cmp		r1, r0
	blo		to_upper_if_end
	mov		r1, #'a'-'A'
	sub		r0, r0, r1
to_upper_if_end:
	mov		pc, lr
	
	.data
	; secção com dados globais iniciados
	v:	.byte	'a', 'z', 'A', 'Z', 'm', 'M', '1'
	v_end:
	vstr: .asciz "azAZdf12G!"

	.section .bss
	; secção com dados globais não iniciados
	vres: .space v_end-v
	
	.equ STACK_SIZE, 64
	.section .stack
	; secção stack para armazenamento de dados temporários
	.space	STACK_SIZE
stack_top:
