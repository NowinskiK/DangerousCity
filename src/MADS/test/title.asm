/***************************************/
/*  Use MADS http://mads.atari8.info/  */
/*  Mode: DLI (char mode)              */
/***************************************/

	icl "..\atari.h"

	org $f0

fcnt	.ds 2
fadr	.ds 2
fhlp	.ds 2
cloc	.ds 1
regA	.ds 1
regX	.ds 1
regY	.ds 1

	org $1a40
rep         ins "..\muzyka\music.rep",6
cz_cmc      ins "..\muzyka\czolo.cmc",6


	org $3000

SYSVBV       = $E45F         ;vector to process immediate VBLANK
SDMCTL  	 = $022F         ;SAVE DMACTL REGISTER

VBLKI        = 0			;wybor rodzaju przerwania VBLK
WIDTH	= 32
HEIGHT	= 30


; ---	MAIN PROGRAM

ant	dta $44,a(scr)
	dta $84,$04,$04,$04,$04,$84,$04,$84,$04,$84,$04,$04,$84,$04,$84,$84
	dta $84,$04,$04,$04,$04,$F0
	dta $02,$02,$02,$02,$02,$82,$22
	dta $41,a(ant)

scr	ins "..\newgfx\TYT10_PTODT4.scr"

	.ALIGN $0400
fnt	ins "..\newgfx\TYT10_PTODT4.fnt"

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
; ---	init PMG

;	INIT_MUSIC
	lda #$70
	ldx #<cz_cmc
	ldy #>cz_cmc
	jsr rep+3
	lda #0
	tax
	jsr rep+3

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
	lda #$06		; muzyka ; VVBLKI (6) lub VVBLKD (7)  - SETVBLV
	.else
	lda $0224
	sta oldvbl
	lda $0225
	sta oldvbl+1
	lda #$07		; muzyka ; VVBLKI (6) lub VVBLKD (7)  - SETVBLV
	.endif
	ldx #>MyVBL
	ldy #<MyVBL
	jsr SETVBV      ;$E45C - JMP $c15d

	mva #$c0 nmien		;switch on NMI+DLI again
	cli
	mwa #ant $0230
	;mva #@dmactl(narrow|dma|lineX1|players|missiles) dmactl	;set new screen width
	mva #@dmactl(narrow|dma|lineX1|players|missiles) sdmctl	;set new screen width

_lp	
    lda trig0		; FIRE #0
	beq stop

	lda trig1		; FIRE #1
	beq stop

	lda consol		; START
	and #1
	beq stop

	lda skctl
	and #$04
	bne _lp			;wait to press any key; here you can put any own routine

stop
	mva #$00 pmcntl		;PMG disabled
	tax
	sta:rne hposp0,x+

	;mva #$ff portb		;ROM switch on
	sei
	mva #$00 nmien
	.if VBLKI
	lda oldvbl
	sta $0222
	lda oldvbl+1
	sta $0223
	.else
	lda oldvbl
	sta $0224
	lda oldvbl+1
	sta $0225
	.endif
	mva #$40 nmien		;only NMI interrupts, DLI disabled
	cli			;IRQ enabled

	rts			;return to ... DOS

; ---	DLI PROGRAM

.local	DLI

dli_start

dli11  
	sta regA

c8	lda #$16
	sta wsync		;line=16
	sta color2
	sta wsync		;line=17
c9	lda #$18
	sta wsync		;line=18
	sta color2
	sta wsync		;line=19
c10	lda #$1A
	sta wsync		;line=20
	sta color2
	sta wsync		;line=21
c11	lda #$1C
	sta wsync		;line=22
	sta color2
	sta wsync		;line=23
c12	lda #$1E
	sta wsync		;line=24
	sta color2
	sta wsync		;line=25
c13	lda #$1A
	sta wsync		;line=26
	sta color2
	DLINEW dli12 1 0 0

dli12
	sta regA

	sta wsync		;line=56
	sta wsync		;line=57
	sta wsync		;line=58
	sta wsync		;line=59
c14	lda #$86
	sta wsync		;line=60
	sta color0
	sta wsync		;line=61
	sta wsync		;line=62
c15	lda #$78
	sta wsync		;line=63
	sta color0
c16	lda #$06
	sta wsync		;line=64
	sta color2
	sta wsync		;line=65
c17	lda #$68
	sta wsync		;line=66
	sta color0
	sta wsync		;line=67
	sta wsync		;line=68
c18	lda #$5A
	sta wsync		;line=69
	sta color0
	DLINEW DLI.dli2 1 0 0

dli2
	sta regA
	stx regX
	lda >fnt+$400*$01
c19	ldx #$4A
	sta wsync		;line=72
	sta chbase
	stx color0
	sta wsync		;line=73
	sta wsync		;line=74
c20	lda #$3A
	sta wsync		;line=75
	sta color0
	sta wsync		;line=76
	sta wsync		;line=77
c21	lda #$2C
	sta wsync		;line=78
	sta color0
	sta wsync		;line=79
	sta wsync		;line=80
c22	lda #$1C
	sta wsync		;line=81
	sta color0
	sta wsync		;line=82
	sta wsync		;line=83
c23	lda #$08
c24	ldx #$00
	sta wsync		;line=84
	sta color0
	stx color3
	DLINEW dli13 1 1 0

dli13
	sta regA
	stx regX

	sta wsync		;line=88
	sta wsync		;line=89
	sta wsync		;line=90
	sta wsync		;line=91
	sta wsync		;line=92
	sta wsync		;line=93
x6	lda #$52
c25	ldx #$28
	sta wsync		;line=94
	sta hposp3
	stx colpm3
	sta wsync		;line=95
	sta wsync		;line=96
x7	lda #$6E
c26	ldx #$28
	sta wsync		;line=97
	sta hposp2
	stx colpm2
	DLINEW dli3 1 1 0

dli3
	sta regA
	stx regX
	sty regY
	lda >fnt+$400*$02
x8	ldx #$8A
c27	ldy #$0C
	sta wsync		;line=112
	sta chbase
	stx hposp3
	sty colpm3
	sta wsync		;line=113
	sta wsync		;line=114
c28	lda #$58
	sta wsync		;line=115
	sta color2
	DLINEW dli4 1 1 1

dli4
	sta regA
	lda >fnt+$400*$00
	sta wsync		;line=128
	sta chbase
	DLINEW dli5 1 0 0

dli5
	sta regA
	lda >fnt+$400*$02
	sta wsync		;line=136
	sta chbase
	DLINEW dli6 1 0 0

dli6
	sta regA
	lda >fnt+$400*$00
	sta wsync		;line=144
	sta chbase
	DLINEW dli7 1 0 0

dli7
	sta regA
	stx regX
	sty regY
	lda >fnt+$400*$02
c29	ldx #$00
	ldy #$01
	sta wsync		;line=184
	sta chbase
	stx color2
	sty gtictl
	DLINEW dli8 1 1 1

dli8
	sta regA
	lda >fnt+$400*$00
	sta wsync		;line=232
	sta chbase

	lda regA
	rti

.endl

; ---

CHANGES = 1
FADECHR	= 0

SCHR	= 127

; ---

.proc	MyVBL

	sta regA
	stx regX
	sty regY

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
	jsr rep+6

quit ;DLINEW DLI.dli_start 1 1 1 
	lda regA
	ldx regX
	ldy regY

	.if VBLKI
	jmp SYSVBV		; skok do natychmiastowego przerwania sys 
	.else
	jmp XITVBV		; wyjscie z przerwania VBLK
	.endif

	; rti

.endp


oldvbl dta a(0)		;stary wektor przerwania

; ---
	run main_title
; ---
	icl "title_sprites.asm"
USESPRITES = 1

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

