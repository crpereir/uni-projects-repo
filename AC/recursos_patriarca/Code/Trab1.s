/*
AVALIA��O: Cada grupo dever� submeter o trabalho realizado na plataforma Moodle, na forma de listagem
do programa desenvolvido (ficheiros .S e .lst), devidamente indentado e sucintamente comentado.
As respostas �s perguntas formuladas neste enunciado devem ser inclu�das na pr�pria listagem do
programa, sob a forma de coment�rios.
*/
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
/*
int main ( void ) {
	error = 0;
	if ( str2nat ( tst_str0 , 2 ) != tst_results [0] )
		error |= 1;	
	if ( str2nat ( tst_str1 , 8 ) != tst_results [1] )
		error |= 2;
	if ( str2nat ( tst_str2 , 16 ) != tst_results [2] )
		error |= 4;

	return error ;
}
*/

/*
5. Implemente a rotina main que constitui um teste unit�rio para a rotina str2nat.
*/
main:
	push	lr
	push	r4					; R4 = error
	push	r5					; R5 = tst_results
	
	mov		r4, #0 				; error = 0
	ldr		r5, addr_tst_results
	; Primeiro teste
	; Prepara argumentos segundo conven��o
	ldr		r0, addr_tst_str0
	mov		r1, #2
	bl		str2nat			; str2nat(tst_str0, 2)
	ldr		r1, [r5, #0]
	cmp		r0, r1				; str2nat_ret_val != tst_results[0]
	beq		main_tst_str1
	add		r4, r4, #1			; error |= 1
main_tst_str1:
	; Segundo teste
	; Prepara argumentos segundo conven��o
	ldr		r0, addr_tst_str1
	mov		r1, #8
	bl		str2nat			; str2nat(tst_str1, 8)
	ldr		r1, [r5, #2]
	cmp		r0, r1				; str2nat_ret_val != tst_results[1]
	beq		main_tst_str2
	add		r4, r4, #2			; error |= 2
main_tst_str2:
	; Terceiro teste
	; Prepara argumentos segundo conven��o
	ldr		r0, addr_tst_str2
	mov		r1, #16
	bl		str2nat			; str2nat(tst_str2, 16)
	ldr		r1, [r5, #4]
	cmp		r0, r1				; str2nat_ret_val != tst_results[2]
	beq		main_ret
	add		r4, r4, #4			; error |= 4
	
main_ret:	
	ldr		r0, addr_error
	strb	r4, [r0]			; escreve o valor final de error em mem�ria
	mov		r0, r4				; retorno da fun��o main segundo conven��o
	
	pop		r5
	pop		r4
	pop		pc

addr_tst_str0:
	.word	tst_str0
addr_tst_str1:
	.word	tst_str1
addr_tst_str2:
	.word	tst_str2
addr_tst_results:
	.word	tst_results
addr_error:
	.word	error
	
/*
uint16_t char2nat ( char symbol , uint16_t radix ) {
	uint16_t number = NAN;

	if ( symbol >= '0' && symbol <= '9' ) {
		number = symbol - '0';
	} else if ( symbol >= 'A' && symbol <= 'F' ) {
		number = symbol - 'A' + 10;
	}
	if ( radix > 16 || number >= radix ) {
		number = NAN;
	}
	return number ;
}
*/

/*
2.a) Indique, justificando, o valor da constante NAN.
O valor de NAN � 0xFFFF porque est� especificado que a constante NAN corresponde ao maior valor poss�vel de codificar numa vari�vel do tipo uint16_t (inteiro de 16 bits sem sinal).
2.b) Apresente uma defini��o para a constante NAN e indique, justificando, os correspondentes requisitos de mem�ria.
A defini��o de uma constante com a diretiva .equ n�o implica qualquer requisito na aloca��o de mem�ria.
*/
	.equ	NAN, 0xFFFF
	
/*
2.c) Implemente a rotina char2nat. Recomenda-se a elabora��o de um programa de teste que permita verificar o comportamento da rotina desenvolvida em diversos cen�rios de utiliza��o.
*/
char2nat:
	; R0 = symbol, number
	; R1 = radix
	; R2 = aux
	; Troca a ordem de compara��o para aproveitar em R2 o valor de '0'
	mov		r2, #'9'
	cmp		r2, r0				; '9' >= symbol
	blo		c2n_if_else1
	mov		r2, #'0'
	cmp		r0, r2				; symbol >= '0'
	blo		c2n_if_else1
	sub		r0, r0, r2			; number = symbol - '0'
	b 		c2n_if_end1
c2n_if_else1:
	; Troca a ordem de compara��o para aproveitar em R2 o valor de 'A'
	mov		r2, #'F'
	cmp		r2, r0				; 'F' >= symbol
	blo		c2n_if_end1
	mov		r2, #'A'
	cmp		r0, r2				; symbol >= 'A'
	blo		c2n_if_end1
	sub		r0, r0, r2
	add		r0, r0, #10			; number = symbol - 'A' + 10
c2n_if_end1:
	mov		r2, #16
	cmp		r2, r1				; 16 < radix
	blo		c2n_if_then2
	cmp		r0, r1				; number >= radix
	blo		c2n_if_end2		
c2n_if_then2:
	ldr		r0, const_NAN		; number = NAN
c2n_if_end2:
	mov		pc, lr				; retorna em R0 number

/*
uint16_t str2nat ( char numeral [], uint16_t radix ) {
	uint16_t number = 0;
	int8_t error = 0;
	uint16_t idx , tmp;

	for ( idx = 0; error == 0 && numeral [idx] != '\0 '; idx ++ ) {
		tmp = char2nat ( numeral [idx], radix );
		if ( tmp == NAN ) {
			number = NAN;
			error = 1;
		} else {
			number = number * radix + tmp;
		}
	}
	return number ;
}
*/

/*
3. Implemente a rotina str2nat que calcula e devolve a quantidade especificada na string numeral, ou o valor da constante NAN em caso de erro. A string numeral � um numeral cardinal representado na base radix.
*/
str2nat:
	; R4 = numeral
	; R5 = number
	; R6 = radix
	; R7 = tmp
	push	lr
	push	r4
	push	r5
	push	r6
	push	r7
	mov		r4, r0
	mov		r5, #0				; number = 0	
	mov		r6, r1				; guarda radix em R6 porque segundo as conven��es R1 pode ser alterado nas chamadas de char2nat e multiply
	b 		s2n_for_cond
s2n_for:
	mov		r1, r6				; recupera radix para passar segundo par�metro a char2nat
	bl		char2nat			; tmp = char2nat(numeral[idx], radix)
	ldr		r1, const_NAN
	cmp		r0, r1				; tmp == NAN
	beq		s2n_ret			; optimiza��o para n�o usar a vari�vel local error (o mesmo que usar a instru��o break). R0 j� tem NAN
	mov		r7, r0				; preserva tmp em R7
	mov		r0, r5
	mov		r1, r6
	bl		multiply			; multiply(number, radix)
	add		r5, r0, r7			; number = multiply_ret_val + tmp
	add		r4, r4, #1			; idx++
s2n_for_cond:
	ldrb 	r0, [r4]
	and		r0, r0, r0			; numeral[idx] != '\0'
	bzc		s2n_for
s2n_for_end:
	mov		r0, r5
s2n_ret:
	pop		r7
	pop		r6
	pop		r5
	pop		r4
	pop		pc
	
const_NAN:
	.word	NAN

/*
1.a) Indique, em n�mero de bytes, a quantidade de mem�ria de c�digo ocupada por esta implementa��o. Justifique a sua resposta.
A quantidade de mem�ria de c�digo, em bytes, ocupada pela fun��o multiply � de 18 bytes porque cada instru��o ocupa 2 bytes em mem�ria e a fun��o � constitu�da por 9 instru��es.
1.b) Comente a seguinte afirma��o: "Para implementar a vari�vel local da rotina, teria sido prefer�vel utilizar o registo R4 em vez do registo R2."
A afirma��o n�o est� correta porque a utiliza��o do registo R4, segundo as conven��es estabelecidas, implica que a fun��o chamada (callee) preserve o registo R4 n�o existindo qualquer ganho por se tratar de uma fun��o folha. Deve-se previligiar a utiliza��o dos registos de R0 a R3.
*/
multiply:
	mov		r2, #0
	mov 	r3, #0
mul_while:
	cmp 	r3, r1
	bhs 	mul_while_end
	add 	r2, r2, r0
	sub 	r1, r1, #1
	b 		mul_while
mul_while_end:
	mov 	r0, r2
	mov 	pc, lr

	.data
	; sec��o com dados globais iniciados

/*
4. Implemente as defini��es de todas as vari�veis globais apresentadas, definindo as sec��es necess�rias.
*/
/*
char tst_str0 [] = "01011"
char tst_str1 [] = "709";
char tst_str2 [] = "9A0F";
*/
tst_str0:
	.asciz	"01011"
tst_str1:
	.asciz	"709"
tst_str2:
	.asciz	"9A0F"
	
	.align 1			; garante alinhamento em mem�ria das pr�ximas words depois da defini��o de vari�veis representadas por valores do tipo byte
	
;uint16_t tst_results [3] = { 11, 457 , 39439 }; 
tst_results:			; vari�vel definida na sec��o .data porque no c�digo em C tst_results n�o est� definido como constante (const uint16_t tst_results...)
	.word	11, 457, 39439

	.section .bss
	; sec��o com dados globais n�o iniciados
;uint8_t error ;
error:
	.space	1
	
	.equ STACK_SIZE, 64
	.section .stack
	; sec��o stack para armazenamento de dados tempor�rios
	.space	STACK_SIZE
stack_top:
