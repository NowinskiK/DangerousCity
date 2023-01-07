
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
	lda >cz_fnt
	sta wsync		;line=144   ;d40a
	sta chbase    ;d409
	lda #0
	sta color2
	sta colbak
	lda #$0b
	sta color1
	DLINEW dli7 1 0 0

dli7
	sta regA
	stx regX
	sty regY
	lda #>cz_fnt
	lda >fnt+$400*$02
c29	ldx #$00
	ldy #$01
	sta wsync		;line=184
	sta chbase
	stx color2
	sty gtictl
	lda #$0F
	sta color1
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
