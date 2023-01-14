        .ALIGN $0100
VBL_game
        lda #>gra_fnt
        sta CHBASE
	lda #$0f
        sta color1

        lda #$44
        sta hposp0
        lda #$50
        sta hposp1
        lda #$50+8*4
        sta hposp2
        lda #$50+8*4*2
        sta hposp3
        lda #$b8
        sta hposm0
        lda #$b8+2
        sta hposm1

        lda #$02  ;34   ;f6
        sta colpm0
        lda #$d2
        sta colpm1
        sta colpm2
        sta colpm3
        ; priorytety
        ;lda #%0000
        ;sta GTIACTL

        mwa #dli_1 VDSLST    ;$0200
        jsr vmus
        jsr video
        rts

dli_1   sta regA
        lda #>cz_fnt
        sta CHBASE

	lda #$0b
        sta color1
	lda #$24
        sta color2
        sta wsync
        sta wsync
        sta wsync
        sta wsync
        sta wsync
        sta wsync
        sta wsync
        sta wsync
        sta wsync
        sta wsync
	lda #$72
        sta color2

        DLINEW dli_2 1 0 0

dli_2   sta regA

        lda #scr40    ;$22
        sta dmactl    ;$d400

        sta wsync
	lda #$42
        sta color2
        sta colbak

        DLINEW dli_3 1 0 0

dli_3   sta regA

        sta wsync
	lda #$00
        sta colbak

        lda regA
        rti

vmus    jsr _music
        jsr rep+6
        jsr _zapisz
        lda #0
        sta $4d
        rts

_zapisz  ldx #$80
         ldy #$04
         stx $f0
         sty $f1

         lda rep+9
         ldx #$10
         jsr _save

         lda #$90
         sta $f0
         lda rep+10
         ldx #$a0
         jsr _save

         lda #$a0
         sta $f0
         lda rep+11
         ldx #$50
         jmp _save

video    equ *
         jsr _kode
         lda #0
         sta $4d
         lda #$7e
         ldx #<(gra_fnt+$03f0)
         ldy #>(gra_fnt+$03f0)
         sta $f5
         stx $f6
         sty $f7
         lda fuel
         cmp #MAX_FUEL+1
         bcc ag7
         lda #MAX_FUEL
         sta fuel
ag7      ldx #<(ekr+417)
         ldy #>(ekr+417)
         jsr _rysslup

         lda #$7f
         ldx #<(gra_fnt+$03f8)
         ldy #>(gra_fnt+$03f8)
         sta $f5
         stx $f6
         sty $f7
         lda damage
         cmp #MAX_DAMAGE+1
         bcc ag9
         lda #MAX_DAMAGE
         sta damage
ag9      ldx #<(ekr+446)
         ldy #>(ekr+446)
         jsr _rysslup

         rts

_kode    equ *
         lda kbcodes
         cmp #KEY_NONE
         bne ah1
ah2      rts
ah1      ldx #KEY_NONE
         ;stx kbcodes
         ldy k
         cpy #(kodend-kod)
         beq ah2
         cmp kod,y
         bne ah3
         inc k  ;idxk
         rts
ah3      lda #0
         sta k
         rts


_music   lda pms
         beq as5
         dec pms
         rts
as5      lda $d20f
         and #8
         beq as2
         rts
as2      lda #16
         sta pms
         ldx music
         inx
         cpx #2
         bcc as3
         ldx #0
as3      stx music
         beq as4
         lda #$60
         jmp rep+3
as4      lda #$50
         jmp rep+3


_rysslup   ; equ *
         stx $f0
         sty $f1
         sta $f2
         lsr 
         lsr 
         lsr 
         sta $f3

         tax
         beq ae3
ae2      lda #$80
         ldy #0
         sta ($f0),y
         jsr _odj
         dex
         bne ae2
ae3      lda $f3
         asl 
         asl 
         asl 
         sta $f3
         lda $f2
         sec
         sbc $f3
         sta $f4
         beq ae4
         ldy #0
         lda $f5
         sta ($f0),y

         ldy #7
         lda #0
ae6      sta ($f6),y
         dey
         bpl ae6

         ldy #7
         ldx $f4
         lda #$ff
ae5      sta ($f6),y
         dey
         dex
         bne ae5

         jsr _odj
ae4      lda #0
         tay
         sta ($f0),y

         rts

_odj     lda $f0
         sec
         sbc #32
         sta $f0
         bcs ae1
         dec $f1
ae1      rts
