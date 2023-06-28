	.section .startup
	b		_start
	b 		.
_start:
	ldr		sp, stack_top_val
	mov		r0, pc
	add		lr, r0, #4
	ldr		pc, addr_main
	b 		.	
stack_top_val:
	.word stack_top
addr_main:
	.word	main
	
	.text
main:
	push	lr
	ldr		r0, addr_a1
	mov		r1, #(a1_end-a1) >> 1
	bl		indexof_max
	ldr		r1, addr_a1_res
	strb	r0, [r1]	
	pop		pc
addr_a1:
	.word	a1
addr_a1_res:
	.word	a1_res

	
/*
uint8_t indexof_max(
        int16_t a[], uint8_t n) {
   uint8_t idx = 0, i = 0;
   uint16_t val = UINT16_MIN;
   while (i < n) {
      uint16_t tmp = abs(a[i]);
      if (val < tmp) {
         val = tmp;
         idx = i;
      }
      i += 1;
   }
   return idx;
}
*/
	.equ UINT16_MIN, 0
; In: R0=a
; In: R1=n
; Out: R0=índice do maior em absoluto
indexof_max:
	push		lr
	push		r4
	push		r5
	push		r6
	push		r7
	push		r8
	mov			r4, r0  				; R4=a
	lsl			r8, r1, #1				; R8=n
	mov			r6, #0					; R6=idx
	mov			r7, #0					; R7=i
	mov			r5, #UINT16_MIN & 0xFF	; R5=val
	;movt		r5, #UINT16_MIN >> 8
	b			iom_whilecond
iom_whilebody:	
	ldr			r0, [r4, r7] 			; r0 = Mem[r4+r7]
	bl			abs
	cmp			r5, r0
	bhs			iom_ifend
	mov			r5, r0
	mov 		r6, r7
iom_ifend:
	add			r7, r7, #2
iom_whilecond:
	cmp			r7, r8
	blo			iom_whilebody
	lsr			r0, r6, #1				; convert byte offset to index of words
	pop			r8
	pop			r7
	pop			r6
	pop			r5
	pop			r4
	pop			pc
	
/*
uint16_t abs(int16_t v) {
   uint16_t aux;
   if (v < 0) 
      aux = -v;
   else 
      aux = v;
   return aux;
}
*/
; In: R0=v
; Out: R0=abs(v)
abs:
	lsl			r1, r0, #1
	bcc			abs_endif
	mvn			r0, r0
	add			r0, r0, #1
abs_endif:
	mov			pc, lr
	
	.data
a1: .word 0x1123, 0xA234, 0x8000, 0xFFFF, 0x1234
a1_end:	
a2: .word 0xB123, 0x3234, 0x7000, 0x7FFF, 0x1234
a2_end:	

	.section .bss
a1_res: .space 1
a2_res: .space 1

	.equ STACK_SIZE, 64
	.section .stack
	.space STACK_SIZE
stack_top:
