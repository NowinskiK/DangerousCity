/***************************************/
/*  Use MADS http://mads.atari8.info/  */
/*  Mode: DLI (char mode)              */
/***************************************/

VBLKI   = 0			;wybor rodzaju przerwania VBLK
WIDTH	= 32
HEIGHT	= 30


; ---	MAIN PROGRAM

ant	dta $44,a(scr)
	dta $84,$04,$04,$04,$04                         ;dli11
	dta $84,$04          ;dli12
	dta $84,$04    ;dli2
	dta $84,$04,$04  ;dli13
	dta $84,$04   ;dli3
	dta $84   ;dli4
	dta $84     ;dli5
	dta $84   ;dli6
	dta $70
	dta $42,a(t1_cz)
	dta $70
	dta $42,a(t2_cz)
	dta $F0    ;dli7 (logo)
	dta $42,a(scr+22*32)
	dta $02,$02,$02,$02
	dta $82,$02,$22         ;dli8
	dta $41,a(ant)

scr	ins "newgfx\TYT10_PTODT4.scr"

	ift USESPRITES
	.ALIGN $0800
pmg	.ds $0300
	ift FADECHR = 0
	SPRITES
	els
	.ds $500
	eif
	eif

main_title

;	init cz
	jsr init_cz

; ---	init PMG
	mva >pmg pmbase		;missiles and players data address
	mva #$03 pmcntl		;enable players and missiles

	lda:cmp:req $14		;wait 1 frame

	sei
	mva #$00 nmien		;stop NMI interrupts
	sta dmactl
	mva #1 vscrol

;	INIT VBL
	.if VBLKI
	lda $0222
	sta oldvbl
	lda $0223
	sta oldvbl+1
	lda #$06		; VVBLKI (6)
	.else
	lda $0224
	sta oldvbl
	lda $0225
	sta oldvbl+1
	lda #$07		; VVBLKD (7)
	.endif
	ldx #>GlobalVBL
	ldy #<GlobalVBL
	jsr SETVBV      ;$E45C - JMP $c15d

	mva #$c0 nmien		;switch on NMI+DLI again
	cli

	; -- init screen
init_title
	lda #stage_title
	sta stage
	mwa #ant $0230
	mva #@dmactl(narrow|dma|lineX1|players|missiles) sdmctl	;set new screen width

	jsr wait_cz
	
stop_title  
	mva #$00 pmcntl		;PMG disabled
	tax
	sta:rne hposp0,x+

	; sei
	; mva #$00 nmien
	; .if VBLKI
	; lda oldvbl
	; sta $0222
	; lda oldvbl+1
	; sta $0223
	; .else
	; lda oldvbl
	; sta $0224
	; lda oldvbl+1
	; sta $0225
	; .endif
	; mva #$40 nmien		;only NMI interrupts, DLI disabled
	; cli			;IRQ enabled

	rts

; ---	DLI PROGRAM
        icl "title_dli.asm"
; ---

CHANGES = 1
FADECHR	= 0

SCHR	= 127

; ---

.proc	GlobalVBL		;General VBLK for all screens
	sta regA
	stx regX
	sty regY

	; ustaw wskaznik skoku w kontekscie biezacego ekranu
	lda stage
	asl
	tax
	lda tab_vblk,x
	sta vjp+1
	lda tab_vblk+1,x
	sta vjp+2

vjp	jsr VBL_title

quit 
	lda regA
	ldx regX
	ldy regY

	.if VBLKI
	jmp SYSVBV		; skok do natychmiastowego przerwania sys 
	.else
	jmp XITVBV		; wyjscie z opoznionego przerwania VBLK
	.endif
.endp


VBL_title

; Initial values

	lda >fnt+$400*$00
	sta chbase
c0	lda #$00
	sta colbak
c1	lda #$84
	sta color0
c2	lda #$0E
	sta color1
c3	lda #$14
	sta color2
c4	lda #$1C
	sta color3
	lda #$02
	sta chrctl
	lda #$04
	sta gtictl
s0	lda #$00
	sta sizep3
x0	lda #$71
	sta hposp3
x1	lda #$79
	sta hposm3
c5	lda #$1E
	sta colpm3
s1	lda #$00
	sta sizep2
x2	lda #$7C
	sta hposp2
x3	lda #$96
	sta hposm2
c6	lda #$1E
	sta colpm2
s2	lda #$00
	sta sizep1
x4	lda #$A3
	sta hposp1
c7	lda #$0C
	sta colpm1
x5	lda #$00
	sta hposp0
	sta hposm0
	sta hposm1
	sta sizep0
	sta sizem
	sta colpm0
	
	mwa #DLI.dli_start VDSLST    ;$0200

;this area is for yours routines
	jsr rep+6		; muzyka gra!
	jsr v_cz		; kod przesuwajacy napisy
	rts


oldvbl dta a(0)		;stary wektor przerwania


.MACRO	DLINEW
	; Również makro DLINEW musi ustawiać wektor DLI nie adres jmp dliv:DLI.dli_start
	mva <:1 VDSLST
	ift [>?old_dli]<>[>:1]
	mva >:1 VDSLST+1
	eif

	ift :2
	lda regA
	eif

	ift :3
	ldx regX
	eif

	ift :4
	ldy regY
	eif

	rti

	.def ?old_dli = *
.ENDM

