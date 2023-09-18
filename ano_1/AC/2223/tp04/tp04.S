    .equ INITIAL_OUTPORT, 0xFF               ; tinhamos que dar shift left e adicionar 1 do stimulus ativo
    .equ INITIAL_USER, 0x00
    .equ USER_MASk, 0x01
    .equ INPORT_ADDRESS, 0xFF80             
    .equ OUTPORT_ADDRESS, 0xFFC0
	.equ PTC_ADDRESS,  0xFF78         


; PORQUE É QUE VAO DE 2 EM 2???????????????????????????
    .equ PTC_TCR, 0                   
	.equ PTC_TMR, 2                   
	.equ PTC_TC,  4                   
	.equ PTC_TIR, 6                   
	.equ PTC_CMD_START, 0             
	.equ PTC_CMD_STOP, 1              

	.equ SYSCLK_FREQ, 249             
                                                                
    .equ STACK_SIZE, 64                
    .equ CPSR_BIT_I, 0b010000         
;----------------------------------------------------------------------------


; PERCEBER A STARTUP ??????????????????????????????????
	.section startup
	b	_start
	ldr	pc, isr_addr
_start:
	ldr	sp, tos_addr
	ldr	pc, main_addr

tos_addr:
	.word	tos
main_addr:
	.word	main
isr_addr:
	.word	isr

;---------------------------------------------------------------------------
	.text

;Send code to init which is the start of the program
main:
	b init


; ativa todos os leds da placa
init: 
    bl reset
    mov r0, #INITIAL_OUTPORT  ; R0 = INITIAL_OUTPORT
    bl outport_write
    bl inport_read
    mov r1, #USER_MASk
    and r0, r0, r1            ; ligar os leds
    cmp r0,r1 
    beq init 



; verifica se o user está a 1 para o programa começar 
check_USER:
    bl inport_read            ; ler o inport_read
    mov r1, #USER_MASk
    and r0, r0, r1
    cmp r0, r1                   
    bne check_USER               



;reads the time the user sets in which after it the stimulus will turn off
delay_time:
    mov r0, #0x01
    bl outport_write          ; desliga o result e deixa o stimulus ligado
    bl inport_read            ; lê o delay que o user quer
    lsr r0 , r0 , #4 
    mov r1 , #0x01
    cmp r0 , r1
    blo init 
    mov r1 , #0x0A
    cmp r1, r0
    blo init                  ; se não estiver entre 1 e 10 volta ao inicio
    bl reset
    push r0
    mov r0, #SYSCLK_FREQ      ; metemos a frequência a 250 ms
    bl ptc_init               ; inicializamos o ptc
    mrs	r0, cpsr              ; enable na rotina de interrupção
	mov	r1, #CPSR_BIT_I
	orr	r0, r0, r1
	msr	cpsr, r0
    pop r0
    bl delay_before           ; desliga o stimulus depois do tempo selecionado pelo user
    mov r0, #0x00
    bl outport_write
    bl ptc_stop
    bl reset                  ; faz remove porque vai ser necessário calcular quantidade de interrupções
    mov r0, #1                ; time measure + isr clocks / 50khz = 1,5
    bl ptc_init               ; mete o valor em r0

; para fazer a contagem bem é preciso fazer a contagem de 2 em 2 segundos 
; para fazer as duas rotinas (isr e time measure) demora sempre 1,5 seg
; TMR = 1 pq com TMR =  -> TIR = TMR


; mede o tempo que o user leva a desligar o interruptor
time_measure:
    bl inport_read
    mov r1, #0x01
    and r0, r0 , r1
    cmp r0, r1
    beq time_measure
    bl ptc_stop



; compara o tempo com os limites predefinidos
fix_result:
    bl sysclk_get_ticks                   ; carregar o valor que está no time measure no r0
    mov r1, #0x89 ; 137 ms
    cmp r1, r0
    bge out_of_range
    mov r1, #0x07 
    movt r1, #0x01; 263 ms
    cmp r0, r1
    bge out_of_range
    mov r1, #0xC8 ; 200 ms
    cmp r0, r1
    bge positive



; if it was below 200ms and in the range represents the difference beetween the time the user took with 200ms
; Set for the current position of the outport
negative:
    sub r0, r0, r1
    lsl r0, r0, #1 
    bl outport_write
    bl ptc_stop
    bl reset
    mov r0, #SYSCLK_FREQ
    bl ptc_init
    mov r0, #5                     ; delay = 5 seg
    bl delay_after
    b init



; if it was above 200ms and in the range represents the difference beetween the time the user took with 200ms
; Set for the current position of the outport
positive:
    sub r0, r0 , r1
    lsl r0, r0, #1 
    bl outport_write
    bl ptc_stop
    bl reset
    mov r0, #SYSCLK_FREQ
    bl ptc_init
    mov r0, #5 
    bl delay_after
    b init



; se o tempo estiver out of range apresenta -64
out_of_range:
    mov r0, #0x80
    bl outport_write
    bl ptc_stop
    bl reset
    mov r0, #SYSCLK_FREQ
    bl ptc_init
    mov r0, #5
    bl delay_after
    b init



;initial outport
outport_init:
	push	lr
	ldr	r1, outport_img_addr
	strb	r0, [r1]
	bl	outport_write
	pop	pc

outport_img_addr:
	.word	outport_img



;reads the inport
inport_read:
	ldr	r1, inport_addr
	ldrb	r0, [r1, #0]
	mov	pc, lr

;writes the outport
outport_write:
	ldr	r1, outport_addr
	strb	r0, [r1, #0]
	mov	pc, lr



outport_addr:
    .word OUTPORT_ADDRESS

inport_addr:
    .word INPORT_ADDRESS

ptc_addr_addr:
    .word PTC_ADDR



;starts the ptc
ptc_start:
    push r0
	ldr	r0, PTC_ADDR
	mov	r1, #PTC_CMD_START
	strb r1, [r0, #PTC_TCR]
    pop r0
	mov	pc, lr



;stops the ptc
ptc_stop:
    push r0
	ldr	r0, PTC_ADDR
	mov	r1, #PTC_CMD_STOP
	strb r1, [r0, #PTC_TCR]
    pop r0
	mov	pc, lr



;initializes the ptc
ptc_init:
	push lr
    push r0
    push r4
	push r5
	mov r5, r0
    bl ptc_stop
	ldr r4, PTC_ADDR
	strb r5, [r4, #PTC_TMR]
    strb     r5, [r4, #PTC_TIR] 
    bl ptc_start
	pop r5
	pop r4
    pop r0
    pop pc



;interrupt service routine
isr:
 	push    r0
    push    r1
    ldr r0, PTC_ADDR                ; carregamos o endereço de ptc_addr para r0
    strb r0, [r0, #PTC_TIR]         ; armazena-se PTC_TIR no endereço apontado por r0
    ldr    r0, sysclk_addr
    ldr    r1, [r0, #0]
    add    r1, r1, #1               ; incrementamos o contador de ticks
    str    r1, [r0, #0]             ; atualizamos o contador
    pop    r1
    pop    r0
    movs    pc, lr



;gets the ticks set
sysclk_get_ticks:
	ldr    r0, sysclk_addr
    ldr    r0, [r0, #0]
    mov    pc, lr



; aguarda um periodo de tempo especifico antes de desligar o estimulo
delay_before:
    push lr
    lsl r1, r0, #2
delay_loop_before:                 ; verifica continuamente o valor do contador de ticks
    bl user_break
    bl sysclk_get_ticks
    cmp r1, r0                     ; so sai do loop quando valor do contador de ticks == r1
    bne delay_loop_before
delay_end_before:
    pop pc



; aguarda 5 segundos apos desligar o stimulus
delay_after:                       
    push lr
    lsl r1, r0, #2
delay_loop_after:
   bl sysclk_get_ticks
   cmp r1, r0
   bne delay_loop_after
delay_end_after:
    pop pc

PTC_ADDR:
    .word    PTC_ADDRESS



; verifica continuamente se user está definido como 1, se não estiver o programa volta ao inicio
user_break:
    push lr
    push r1
    push r0
    bl inport_read
    mov r1, #USER_MASk
    and r0, r0, r1
    cmp r0,r1
    bne init
    pop r0
    pop r1
    pop pc



;resets the sysclk
reset:
    ldr r1, sysclk_addr
    mov r2, #0
    str r2,[r1]
    mov pc, lr

sysclk_addr:
    .word sysclk



;----------------------------------------------------------------------------

    .data

;----------------------------------------------------------------------------    

    .bss
sysclk:
	.space	2
outport_img:
	.space	1
	.align

;----------------------------------------------------------------------------

    .stack
    .space STACK_SIZE
tos: 


