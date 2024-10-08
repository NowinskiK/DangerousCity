        .ALIGN $0100
VBL_game
        lda #>gra_fnt
        sta CHBASE
        lda color_1
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

        lda #$14
        sta colpm0
        ldx pl
        lda plcols,x
        ora color_bri
        sta colpm1
        sta colpm2
        sta colpm3
        ; priorytety
        ;lda #%0000
        ;sta GTIACTL

        mwa #dli_1 VDSLST    ;$0200
        jsr playmus
        jsr video
        rts

dli_1   sta regA
        lda #>cz_fnt
        sta CHBASE

	lda #$0b
        sta color1
	lda #$34
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
	lda msg_col
        sta color1

        DLINEW dli_3 1 0 0

dli_3   sta regA

        sta wsync
	lda #$00
        sta colbak

        lda regA
        rti

playmus jsr rep+6
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

video   equ *
        lda msg_tmp
        beq vid2
        dec msg_tmp
        lda msg_tmp
        cmp #MSG_DEFCOL 
        bcs vid2
        sta msg_col
        cmp #0
        bne vid2
        lda #ACT_SHOW_SQ_STATE
        sta one_act

vid2    *
        lda color_bri
        beq vid3
        dec color_bri

vid3     lda #0
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
ag7      ldx #<(ekr + BAR1_BOTTM)
         ldy #>(ekr + BAR1_BOTTM)
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
ag9      ldx #<(ekr + BAR2_BOTTM)
         ldy #>(ekr + BAR2_BOTTM)
         jsr _rysslup

rts2     rts

_kode    equ *
         lda kbcodes
         cmp #KEY_NONE
         beq rts2
ah1      .if DEBUG_MODE
         jsr _setcolor
         .endif
         
         lda kbcodes
         ldy fki
         cpy #(kodend-kod)
         beq ah2
         cmp kod,y
         bne ah3
         inc fki
         iny
         cpy #(kodend-kod)
         bne ah2
         jmp flash
ah3      lda #0
         sta fki
ah2      ;rts

         lda kbcodes
         ldy ikd
         cpy #(nodend-nod)
         beq ah21
         cmp nod,y
         bne ah31
         inc ikd
         iny
         cpy #(nodend-nod)
         bne ah21
         lda #0
         sta damage
         sta ikd
         jsr _clr_fuel_bar
         jmp flashi
ah31     lda #0
         sta ikd
ah21     ;rts

         lda kbcodes
         ldy tnki
         cpy #(tnkend-tnk)
         beq tah2
         cmp tnk,y
         bne tah3
         inc tnki
         iny
         cpy #(tnkend-tnk)
         jmp flash
tah3     lda #0
         sta tnki
tah2     rts

flash   bne flend
flashi   lda #$0f
         sta color_bri
flend    rts


        .if DEBUG_MODE
_setcolor
        lda kbcodes
        cmp #KEY_RETURN
        bne ah41
        lda #$00
        sta color_index
        jsr _clrkom
        lda prompt
        sta kom+1
        lda #0
        sta kom+2
        sta kom+3
        rts
ah41    tay
        cpy #$C0
        bcs dlex
        lda (KEYDEFP),Y
        ldy color_index
        cpy #2 
        bcs dlex
        jsr char_to_0f
        tax
        lda tabhex,x
        sta kom+2,y
        txa
        cpy #$00
        bne dl7
        asl
        asl 
        asl
        asl
dl7     cpy #$01
        bne dl8
        clc
        adc color_v
dl8     sta color_v
        iny
        sty color_index
        cpy #2
        beq new_color_apply
dlex    rts
new_color_apply  *
        ldx pl
        sta plcols,x
        lda #0
        sta kom+1
        rts

char_to_0f
        sec
        sbc #$30
        cmp #$0a
        bcc dlj
        sbc #$07
dlj     and #$0f
        rts

        .endif


_music   lda kbcodes
         cmp #KEY_M
         bne as_ret
as2      ldx music
         inx
         cpx #2
         bcc as3
         ldx #0
as3      stx music
         beq as4
         lda #$60       ;replay music
         jmp rep+3
as4      lda #$50       ;pause music
         jmp rep+3
as_ret   rts

_rysslup *
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
