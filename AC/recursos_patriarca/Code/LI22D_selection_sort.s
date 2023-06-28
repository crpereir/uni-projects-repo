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
	bl 		test_selection_sort
	pop		pc

test_selection_sort:
	push	lr
	ldr		r0, addr_v
	mov		r1, #(v_end-v) >> 1
	bl		selection_sort
	pop		pc	
	
test_min_idx:
	push	lr
	ldr		r0, addr_v
	mov		r1, #0
	mov		r2, #(v_end-v) >> 1
	bl		min_idx
	ldr		r0, addr_v
	mov		r1, #1
	mov		r2, #((v_end-v) >> 1) - 1
	bl		min_idx
	pop		pc	
addr_v:
	.word	v

/*
uint16_t min_idx ( int16_t a[], uint16_t f, uint16_t l ) {
	uint16_t i, j;
	i = f;
	for ( j = f + 1; j < l; j++) 
		if( a[j] < a[i] )
			i = j;
	return i;
}
*/
; r0 = a
; r1 = f
; r2 = l
min_idx:
	push	r4			; r4 = a[j]
	push	r5			; r5 = a[i]
	lsl		r1, r1, #1	; r1 = i
	add		r3, r1, #2  ; r3 = j
	lsl		r2, r2, #1  ; r2 = l
	b		min_idx_for_cond
min_idx_for:
	ldr		r4, [r0, r3]
	ldr		r5, [r0, r1]
	cmp		r4, r5
	bge		min_idx_if_end
	mov		r1, r3
min_idx_if_end:
	add		r3, r3, #2
min_idx_for_cond:
	cmp		r3, r2
	blo		min_idx_for
	lsr		r0, r1, #1
	pop		r5
	pop		r4
	mov		pc, lr
/*
void selection_sort ( int16_t a[], uint16_t n ) {
	uint16_t i, j;
	int16_t temp ;
	for (i = 0; i < n - 1; i++ ) {
		j = min_idx (a, i , n);
		temp = a[i];
		a[i] = a[j];
		a[j] = temp ;
	}
}
*/
selection_sort:
	push	lr
	push	r4	; r4 = a
	push	r5	; r5 = i
	push	r6	; r6 = n
	mov		r4, r0
	mov		r5, #0
	mov		r6, r1
	b 		sel_sort_for_cond
sel_sort_for:
	mov		r0, r4
	mov		r1, r5
	mov		r2, r6
	bl		min_idx
	lsl		r0, r0, #1
	lsl		r1, r5, #1
	ldr		r2, [r4, r1]
	ldr		r3, [r4, r0]
	str		r2, [r4, r0]
	str		r3, [r4, r1]
	add		r5, r5, #1
sel_sort_for_cond:
	sub		r0, r6, #1
	cmp		r5, r0
	blo		sel_sort_for
	pop		r6
	pop		r5
	pop		r4
	pop		pc
	
	.data
	; secção com dados globais iniciados
v:	.word	10, -10, 1000, -1000, 450, -5000
v_end:

	.equ STACK_SIZE, 64
	.section .stack
	; secção stack para armazenamento de dados temporários
	.space	STACK_SIZE
stack_top:
