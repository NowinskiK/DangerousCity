_proc   LDA $85
        CMP #$3F
        BNE _rts
        RTS
;--------------------------------------------------
_rts    RTS
;--------------------------------------------------
        PLA
        JMP reset  


_movrzc  ldy #70
az6      lda plrzc_z,y
         sta plrzc,y
         lda #0
         sta zrob,y
         dey
         bpl az6

         ldy #3
         lda #0
az8      sta kieszen,y
         dey
         bpl az8
         rts


_ustres  lda #2
         ldx #<reset
         ldy #>reset
         sta $09
         stx $02
         sty $03
         lda #0
         sta $0244
         lda #$c0
         sta $6a
         rts

reset   ;    equ *
         lda $85
         cmp #$3F
         bne zs
         lda CONSOL
         and #7
         cmp #7
         beq az3
zs       lda #$ff    ;* zimny start
         sta $0244
         jmp $e474
az3      jmp play

        icl "legend.asm"
        icl "win.asm"


init_cz    ;   equ *
         ;jsr _ustres   ;KN: what the hell is this?
         jsr _usttc
         lda #31
         sta $e4
         lda #0
         sta $e5
         lda #$80
         sta $e6
         lda #0
         sta $e7
         sta $e8
        lda #stage_title
        sta ekran   ;ustaw znacznik gdzie jest gra

         lda #$70
         ldx #<cz_cmc
         ldy #>cz_cmc
         jsr rep+3
         lda #0
         tax
         jsr rep+3
        rts

wait_cz  ldx #16
         jsr _zegar
         jsr _proc
aw3      jsr _joy
         lda CONSOL
         and #1         ;START = Play game
         beq aw8
         lda CONSOL
         and #4         ;OPTION = Legenda
         bne aw9
         jmp run_leg
aw9      lda f
         beq aw3

aw8      rts


v_cz     ;equ *
         lda $e7
         beq av7
         dec $e7
         jmp av5
av7      jsr _praut
         lda $e6
         bmi av3
         inc $e4
         dec $e5
         jmp av4
av3      dec $e4
         inc $e5
av4      lda $e4
         bmi av8
         jmp av6
av8      lda #$ff
         sta $e7
         lda #0
         sta $e6
         jmp av5
av6      cmp #32
         bne av5

         lda #$80
         sta $e6

         lda $e0
         clc
         adc #32
         sta $e0
         bcc aw1
         inc $e1

aw1      lda $e2
         clc
         adc #32
         sta $e2
         bcc aw2
         inc $e3
aw2      lda #31
         sta $e4
         lda #0
         sta $e5
         inc $e8
         lda $e8
         cmp #((tc2-tc1)/32)
         bcc av5
         lda #0
         sta $e8
         jsr _usttc

av5      rts   ;jmp XITVBV

_usttc   ldx #<tc1
         ldy #>tc1
         stx $e0
         sty $e1
         ldx #<tc2
         ldy #>tc2
         stx $e2
         sty $e3
         rts


_praut   ldy #127
         lda #0
av9      sta t1_cz,y
         dey
         bpl av9

         ldy $e4
         ldx #0
av1      lda ($e0),y
         sta t1_cz,x
         inx
         iny
         cpy #32
         bcc av1

         ldy $e5
         ldx #31
av2      lda ($e2),y
         sta t2_cz,x
         dex
         dey
         bpl av2
         rts

        icl "gameover.asm"


_save    ;    equ *

         stx $f2
         asl 
         lsr 
         sta $f3
         lda #$00
         ldy #$0f
at5      sta ($f0),y
         dey
         bpl at5

         lda $f3
         bne at2
         rts

at2      lda $f3
         clc
         adc $f2
         sta $f4
         ldx #7
         ldy #8
         stx $f5
         sty $f6
at4      lda $f4
         ldy $f5
         sta ($f0),y
         ldy $f6
         sta ($f0),y
         dec $f5
         inc $f6
         dec $f4
         dec $f4
         dec $f3
         dec $f3
         lda $f3
         beq at3
         bpl at4

at3      rts


_uzyj    lda kbcodes
         cmp #key_esc
         bne az7
         jsr gameover_pre
         jsr gameover
         rts

az7      ldx #0
         cmp #KEY_1
         bne *+4
         ldx #1
         cmp #KEY_2
         bne *+4
         ldx #2
         cmp #KEY_3
         bne *+4
         ldx #3
         cmp #KEY_4
         bne *+4
         ldx #4

         jsr _keyoff
         cpx #0
         bne an1
         jmp newruch

an1      txa
         tay
         dey
         lda kieszen,y
         bne an4
         jmp zz1
an4      tax
         lda pl

;* szmal

         cpx #1
         bne an2
         cmp #16
         bne an2
         lda #2
         sta kieszen,y
         ldx #<tt1
         ldy #>tt1
         jmp uzyl

;* klucz

an2   ;      equ *
         cpx #3
         bne an3
         cmp #40
         bne an3
         lda #4
         sta kieszen,y
         jsr _ok
         ldx #<tt2
         ldy #>tt2
         jmp uzyl

;* otwieracz

an3      cpx #5
         bne an5
         sty $cf
         lda #2
         jsr _szk
         bpl an6
         jmp zz1
an6      lda #6
         sta kieszen,y
         lda #0
         ldy $cf
         sta kieszen,y
         ldx #<tt3
         ldy #>tt3
         jmp uzyl

;* cyjanek

an5      cpx #4
         bne as1
         sty $cf
         lda #6
         jsr _szk
         bpl an8
         jmp zz1
an8      lda #7
         sta kieszen,y
         lda #0
         ldy $cf
         sta kieszen,y
         ldx #<tt4
         ldy #>tt4
         jmp uzyl

;* zatrute piwo

as1      cpx #7
         bne an7
         cmp #68
         bne an7
         lda #0
         sta kieszen,y
         jsr _ok
         ldx #<tt16
         ldy #>tt16
         jmp uzyl

;* bateria do latarki

an7      cpx #8
         bne ao1
         sty $cf
         lda #10
         jsr _szk
         bpl ao2
         ldy $cf
         lda pl
         jmp ao1
ao2      lda #31
         sta kieszen,y
         lda #0
         ldy $cf
         sta kieszen,y
         ldx #<tt5
         ldy #>tt5
         jmp uzyl

;* bateria do latarki+zarowki

ao1      cpx #8
         bne ao5
         sty $cf
         lda #30
         jsr _szk
         bpl ao4
         lda pl
         ldy $cf
         jmp ao5
ao4      lda #11
         sta kieszen,y
         ldy $cf
         lda #0
         sta kieszen,y
         ldx #<tt5
         ldy #>tt5
         jmp uzyl

;* zarowka do latarki

ao5      cpx #9
         bne ao6
         sty $cf
         lda #10
         jsr _szk
         bpl ao8
         lda pl
         ldy $cf
         jmp ao6
ao8      lda #30
         sta kieszen,y
         ldy $cf
         lda #0
         sta kieszen,y
         ldx #<tt6
         ldy #>tt6
         jmp uzyl

;* zarowka do latarki+baterii

ao6      cpx #9
         bne ao7
         sty $cf
         lda #31
         jsr _szk
         bpl ao9
         jmp zz1
ao9      lda #11
         sta kieszen,y
         ldy $cf
         lda #0
         sta kieszen,y
         ldx #<tt6
         ldy #>tt6
         jmp uzyl

;* smar (olej)

ao7      cpx #12
         bne ap9
         cmp #19
         bne ap9
         lda #0
         sta kieszen,y
         jsr _ok
         ldx #<tt7
         ldy #>tt7
         jmp uzyl

;* sluchawki l.

ap9      cpx #13
         bne aq1
         cmp #5
         bne aq1
         lda #14
         sta kieszen,y
         jsr _ok
         ldx #<tt8
         ldy #>tt8
         jmp uzyl

;* sekator

aq1      cpx #15
         bne ar1
         cmp #22
         bne ar1
         lda #0
         sta kieszen,y
         jsr _ok
         ldx #<tt9
         ldy #>tt9
         jmp uzyl

;* lopata

ar1      cpx #16
         bne ar2
         cmp #14
         bne ar2
         lda #17
         sta kieszen,y
         jsr _ok
         ldx #<tt10
         ldy #>tt10
         jmp uzyl

;* deski

ar2      cpx #17
         bne ar3
         cmp #50
         bne ar3
         lda #0
         sta kieszen,y
         jsr _ok
         ldx #<tt11
         ldy #>tt11
         jmp uzyl

;* gaz

ar3      cpx #18
         bne ar4
         cmp #64
         bne ar4
         lda #19
         sta kieszen,y
         jsr _ok
         ldx #<tt12
         ldy #>tt12
         jmp uzyl

;* detonator + dynamit

ar4      cpx #14
         bne ar5
         cmp #10
         bne ar5
         sty $cf
         lda #19
         jsr _szk
         bpl ar6
         jmp zz1
ar6      lda #0
         sta kieszen,y
         ldy $cf
         sta kieszen,y
         jsr _ok
         ldx #<tt13
         ldy #>tt13
         jmp uzyl

;* wiadro wody

ar5      cpx #20
         bne ar7
         cmp #56
         bne ar7
         lda #0
         sta kieszen,y
         jsr _ok
         ldx #<tt14
         ldy #>tt14
         jmp uzyl

;* kij

ar7      cpx #21
         bne ar8
         cmp #57
         bne ar8
         lda #0
         sta kieszen,y
         jsr _ok
         ldx #<tt15
         ldy #>tt15
         jmp uzyl

ar8      jmp zz1



uzyl     jsr _prkom
         jsr _mazanie
         jsr _prkiesz
         lda t
         bmi zz1
         lda #0
         sta t
zz1      jmp _czruch


_szk     ldy #0
         sta $ce
an10     lda kieszen,y
         cmp $ce
         beq an9
         iny
         cpy #4
         bne an10
         ldy #$80
an9      rts

_ok      ldy pl
         dey
         lda #1
         sta zrob,y
         rts


_ciemno   ;  equ *
         lda pl
         cmp #27
         bne ap2
         jmp _clso
ap2      cmp #28
         bne ap3
         jmp _jasno
ap3      cmp #26
         bne ap4
         jmp _jasno
ap4      rts

_jasno   ;   equ *
         ldy #0
ap8      lda zst_fnt,y
         sta gra_fnt,y
         lda zst_fnt+$0100,y
         sta gra_fnt+$0100,y
         lda zst_fnt+$0200,y
         sta gra_fnt+$0200,y
         lda zst_fnt+$0300,y
         sta gra_fnt+$0300,y
         iny
         bne ap8
         rts

_clso    lda #11
         jsr _szk
         bmi ap7
         rts
ap7      lda #0
         ldy #0
ap5      sta gra_fnt,y
         sta gra_fnt+$0100,y
         sta gra_fnt+$0200,y
         sta gra_fnt+$0300,y
         iny
         bne ap5
         ldy #$e0
ap6      lda zst_fnt+$0200,y
         sta gra_fnt+$0200,y
         iny
         bne ap6
         rts

_movafnt   ; equ *
         ldy #0
ap1      lda gra_fnt,y
         sta zst_fnt,y
         lda gra_fnt+$0100,y
         sta zst_fnt+$0100,y
         lda gra_fnt+$0200,y
         sta zst_fnt+$0200,y
         lda gra_fnt+$0300,y
         sta zst_fnt+$0300,y
         iny
         bne ap1
         rts


_mazanie  ;; equ *
         ldy pl
         dey
         lda zrob,y
         bne aq9
         rts
aq9      lda #0
         ldx pl
         cpx #40
         bne aq2
         sta ekr+202
         sta ekr+234
         rts
aq2      cpx #19
         bne aq3
         sta ekr+306
         sta ekr+307
         sta ekr+308
         sta ekr+338
         sta ekr+339
         sta ekr+340
         rts
aq3      cpx #22
         bne aq4
         sta ekr+239
         rts
aq4      cpx #50
         bne aq5
         sta ekr+261
         sta ekr+262
         sta ekr+263
         sta ekr+264
         rts
aq5      cpx #10
         bne aq6
         sta ekr+13
         sta ekr+14
         sta ekr+15
         rts
aq6      cpx #56
         bne aq7
         sta ekr+174
         sta ekr+175
         sta ekr+176
         sta ekr+206
         sta ekr+207
         sta ekr+208
         sta ekr+238
         sta ekr+239
         sta ekr+240
         rts
aq7      cpx #57
         bne aq8
         sta ekr+110
         sta ekr+111
         sta ekr+112
         sta ekr+142
         sta ekr+143
         sta ekr+144
         rts
aq8      cpx #68
         bne aq10
         sta ekr+238
         sta ekr+239
         sta ekr+240
         sta ekr+270
         sta ekr+271
         sta ekr+272
aq10     rts

