
; -----------------------------------------------------------------------------
; Ficheiro:  lab01.S
; Descricao: Codigo de suporte a realizacao da 1a atividade laboratorial de AC.
; Autor:     Tiago M Dias (tiago.dias@isel.pt)
; Data:      11-03-2022
; -----------------------------------------------------------------------------

	; r0 guarda o valor da variavel M
	; r1 guarda o valor da variavel m
	; r2 guarda o valor da variavel p
	; r3 e utilizado para guardar valores temporariamente

	mov r2, #0         ; p = 0
if_cond:
	mov	r3, #0         ; guarda-se o zero temporariamente num registo
	cmp r0, r3         ; M != 0
	beq if_end
if_cond2:
    cmp r1, r0
    bhs else_while
while:
	mov r3, #0		   ; guarda-se o zero temporariamente num registo
	cmp	r3, r1         ; m > 0
	bhs	while_end
	add	r2, r2, r0     ; p = p + M
	sub	r1, r1, #1     ; m--
	b	while
else_while:
    mov r3, #0		   ; guarda-se o zero temporariamente num registo
	cmp	r3, r0         ; M > 0
	bhs	while_end
	add	r2, r2, r1     ; p = p + m
	sub	r0, r0, #1     ; M--
	b	else_while
while_end:
if_end:
	b   .
