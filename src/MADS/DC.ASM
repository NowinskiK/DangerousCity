play     *
         lda #stage_game
         sta stage
 
         jsr _movrzc
         lda #$70
         ldx #<gra_cmc
         ldy #>gra_cmc
         jsr rep+3
         lda #0
         tax
         jsr rep+3

         lda #0
         sta SDMCTL
         ldx #<dl_gra
         ldy #>dl_gra
         stx $0230
         sty $0231
         ldx #<ekr
         ldy #>ekr
         stx $58
         sty $59

         lda #$0f
         sta color_1
         lda #0
         sta $02c6
         sta $02c8

         lda #1
         sta $02f0

         jsr _init_spr
         jsr _initmap
         jsr _initgra
         jsr _prmap  ;* rysuj mape
         jsr _show_pocket
         
         mva >pmg pmbase
         mva #$03 pmcntl
         mva #%00 sizep0      ;1x width for player 0
         lda #%11             ;4x width for players 1-3
         sta sizep1
         sta sizep2
         sta sizep3
         mva #%01 sizem       ;2x width for 1.missile

         lda #@dmactl(narrow|dma|lineX1|players|missiles)  ;3d
         sta SDMCTL   ;022f game
         lda #1
         sta fr

; narysowanie samochodu w miejscu

newruch  lda z
         cmp #5
         bcs newruch

aa1      ldy #0         ;* przygotowanie
aa2      lda tabzw,y    ;* znaku
         beq aa1        ;* do
         cmp z          ;* wyswietlenia
         beq aa3
         iny
         jmp aa2
aa3      iny
         lda tabzw,y
         sta znak

         jsr _ust

         lda znak
         jsr _ai
         ldy #0
         sta ($c0),y

;* zapamietanie znaku przed toba !

         ldx z
         cpx #1
         bne ab1
         lda #32
         jmp minus
ab1      cpx #3
         bne ab2
         lda #32
         jmp plus
ab2      cpx #2
         bne ab3
         lda #1
         jmp plus
ab3      lda #1
         jmp minus

plus     sta $c2
         lda $c0
         clc
         adc $c2
         sta $c0
         bcc ab5
         inc $c1
ab5      jmp ab6

minus    sta $c2
         lda $c0
         sec
         sbc $c2
         sta $c0
         bcs ab6
         dec $c1

ab6      ldy #0
         lda ($c0),y
         sta t

;* czekanie na ruch

_czruch  jsr _joy

         lda fr
         beq az5
         lda #0
         sta fr
         jmp _ruch

az5      lda kbcodes
         cmp #KEY_NONE
         beq am10
         jmp _uzyj
am10     lda s
         cmp #15
         beq ab7
         jmp _zmz
ab7      lda f
         beq _czruch

;* jazda w przod !

         jmp _ruch

;* zmiana zwrotu

_zmz     jsr _keyoff
         jsr _ust

         lda s
         cmp #11
         bne ab8
         dec z
         jmp ab9
ab8      cmp #7
         bne ab20
         inc z

ab9      lda z
         bne ab10
         lda #4
         sta z
ab10     cmp #5
         bne ab20
         lda #1
         sta z

ab20     ldx #9
         jsr _zegar
         jmp newruch


_ruch    lda t
         beq af5

         jmp kolizja

af5      jsr _mfuel
         lda z
         cmp #1
         bne ac1
         jmp _gora
ac1      cmp #3
         bne ac9
         jmp _dol
ac9      cmp #4
         bne ad8
         jmp _lewo
ad8      jmp _prawo
ae8      jsr _keyoff
         jmp _czruch
ad1      ift NO_DAMAGE = 0
         jsr _pdmg
         eif
         jmp ae8

_gora    ;equ *

         jsr _ust
         lda $c0
         sec
         sbc #32
         sta $c0
         bcs ac2
         dec $c1
ac2      ldy #0
         lda #26
         sta ($c0),y
         ldy #32
         lda #27
         sta ($c0),y

         jsr _msr
         lda #8
         sta $c2

ac6      ldy $c2
         ldx #0
ac5      lda gra_fnt+736,x
         sta ($d2),y
         iny
         inx
         cpx #8
         bne ac5

         lda #0
         sta ($d2),y

         ldx #1
         jsr _zegar

         dec $c2
         bne ac6

;ac7       
         ldy #32
         lda p
         sta ($c0),y
         dec y

         jsr _keyoff

         jmp newruch

_dol     ; equ *

         jsr _ust
         ldy #0
         lda #26
         sta ($c0),y
         ldy #32
         lda #27
         sta ($c0),y

         jsr _msr
         lda #0
         sta $c2

ac11     ldx #0
         ldy $c2
ac8      lda gra_fnt+744,x
         sta ($d2),y
         iny
         inx
         cpx #8
         bne ac8

         tya
         sec
         sbc #9
         tay
         bmi ac10
         lda #0
         sta ($d2),y


ac10     ldx #1
         jsr _zegar

         inc $c2
         lda $c2
         cmp #8
         bne ac11

         ldy #0
         lda p
         sta ($c0),y
         inc y

         jsr _keyoff

         jmp newruch

_lewo    ; equ *

         jsr _ust
         dec $c0
         ldx $c0
         inx
         bne ad2
         dec $c1
ad2      ldy #0
         lda #26
         sta ($c0),y
         iny
         lda #27
         sta ($c0),y

         ldx #<lewf
         ldy #>lewf
         stx $d0
         sty $d1

         jsr _plmov

         ldy #1
         lda p
         sta ($c0),y

         dec x
         jsr _keyoff
         jmp newruch

_prawo   jsr _ust
         ldy #0
         lda #26
         sta ($c0),y
         iny
         lda #27
         sta ($c0),y

         ldx #<prawf
         ldy #>prawf
         stx $d0
         sty $d1

         jsr _plmov

         ldy #0
         lda p
         sta ($c0),y
         inc x
         jsr _keyoff
         jmp newruch

_plmov    ;equ *

         lda #0
         sta $c2

ad6      ldy #15
ad3      lda ($d0),y
         sta ($d2),y
         dey
         bpl ad3

         ldx #1
         jsr _zegar

         inc $c2
         lda $c2
         cmp #8
         beq ad4

         lda $d0
         clc
         adc #16
         sta $d0
         bcc ad5
         inc $d1
ad5      jmp ad6
ad4      rts

_init_spr    *    ;Decompress sprites
         ldx #<(compr_spr)
         ldy #>(compr_spr)
         stx $c0
         sty $c1
         ldx #$00
         ldy #>(pmg + $0300)
         stx $c2
         sty $c3
         jsr _dekompff
         rts

         icl "functions.asm"

_show_pocket *
         ldx #<(rzeczy_w+4)
         ldy #>(rzeczy_w+4)
         stx $c2
         sty $c3
         lda #0
         sta $c4

am9      lda #$80        ;clean pocket's line
         ldy #23
am7      sta ($c2),y
         dey
         bpl am7

     ift NB_ITEMS = 1
         lda char1
         clc
         adc $c4
         ldy #1
         sta ($c2),y
         lda char1+1
         iny
         sta ($c2),y
     eif
         ldx #<rzc_nam
         ldy #>rzc_nam
         stx $c0
         sty $c1
         ldy $c4
         lda pocket,y
         beq am6         ; no item
         ldx #0
         jsr _szuk
         ldx #0
         stx $cf
         jsr _get_len
         sty $cf
         lda #24
         sec
         sbc $cf
         lsr 
         adc #NB_ITEMS
         sta $ca
         lda #0
         sta $cb
am5      ldy $cb
         lda ($c0),y
         beq am6
         jsr _ai
         eor #$80
         ldy $ca
         sta ($c2),y
         inc $cb
         inc $ca
         bne am5
am6      lda $c2         ;prep next line
         clc
         adc #32
         sta $c2
         bcc am8
         inc $c3
am8      inc $c4
         lda $c4
         cmp #4
         bne am9
         rts




_wezrzc   ;  equ *
         jsr _wolne
         beq am4
         lda rzecz
         sta pocket-1,y
         ldy pl
         dey
         lda #0
         sta plrzc,y
         jsr _show_ava_item
         jsr _show_pocket
         jmp af5
am4      jmp newruch

_wolne   ldy #0
am2      lda pocket,y
         beq am3
         iny
         cpy #4
         bne am2
         ldy #0
         rts
am3      iny
         rts

_show_ava_item *
         lda #0
         ldy #39
al2      sta rzc_wid,y
         dey
         bpl al2
         ldy pl
         dey
         lda plrzc,y
         sta rzecz
         bne *+3
         rts
         sec
         sbc #1
         asl 
         tay
         lda rzc,y
         sta $ce
         iny
         lda rzc,y
         sta $cf

         ldx #<(ekr+4)
         ldy #>(ekr+4)
         stx _rsl
         sty _rsl+1
         lda #32
         ldx $cf
         jsr _mul
         lda _rsl
         clc
         adc $ce
         sta _rsl
         bcc al1
         inc _rsl+1
al1      lda #84
         ldx _rsl
         ldy _rsl+1
         stx $c0
         sty $c1
         ldy #0
         sta ($c0),y

         ldx #<rzc_nam
         ldy #>rzc_nam
         stx $c0
         sty $c1
         ldx #0
         lda rzecz
         beq al5
         jsr _szuk
         lda #0
         sta $cf
         jsr _get_len
         sty $cf
         lda #40
         sec
         sbc $cf
         lsr 
         tax
         ldy #0
al4      lda ($c0),y
         beq al5
         jsr _ai
         sta rzc_wid,x
         inx
         iny
         bne al4
al5      rts


_show_sq_state *
         lda pl
         sta $cf
         tay
         dey
         lda zrob,y
         sta $ce
         ldy #0
ak1      lda tu_tab,y
         bne ak8
         lda #20
         bne ak7
ak8      iny
         iny
         iny
         cmp $cf
         bne ak1
         dey
         dey
         lda $ce
         beq ak2
         iny
ak2      lda tu_tab,y
ak7      sec
         sbc #1
         asl 
         tay
         lda adt_tab,y
         sta $c0
         lda adt_tab+1,y
         sta $c1
         ldx $c0
         ldy $c1
         jsr _show_msg
         rts

_show_msg *
         stx $c0
         sty $c1
         jsr _clrkom
         ldy #0
ak5      lda ($c0),y
         beq ak4
         jsr _ai
         sta kom,y
         iny
         bne ak5
ak4      jsr _blink_msg
         rts

_clrkom  ldy #39
         lda #0
ak3      sta kom,y
         dey
         bpl ak3
         rts

_blink_msg *
          lda msg_col
          cmp #$ff
          beq bmie
          cmp #$0f
          beq bm2
          inc msg_col
          ldx #$02
          jsr _zegar
          jmp _blink_msg
bm2       lda msg_col
          cmp #MSG_DEFCOL
          beq bme
          dec msg_col
          ldx #$02
          jsr _zegar
          jmp bm2
bme       ;lda #MSG_DEFCOL
          ;sta msg_col
bmie      rts

_show_sq_name *

         lda #$80
         ldx #24
         ldy #$04
aj5      sta plname,y
         iny
         dex
         bne aj5

         ldx #<namepl_t
         ldy #>namepl_t
         stx $c0
         sty $c1
         ldx #0
         lda pl
         jsr _szuk
         lda #0
         sta $cf
         jsr _get_len
         sty $cf
         lda #32
         sec
         sbc $cf
         lsr 
         sta $cf
         tax
         ldy #0
al6      lda ($c0),y
         beq al7
         jsr _ai
         eor #$80
         sta plname,x
         inx
         iny
         bne al6
al7      rts


_initgra lda #1
         sta z
         sta pd
         sta pf
         lda #0
         sta t
         sta p
         sta k
         sta damage
         lda #MAX_FUEL
         sta fuel
         ldx #10
         ldy #7
         stx x
         sty y
         ldx #<(map+106)
         ldy #>(map+106)
         stx pozmap
         sty pozmap+1

         ldx #<(pasek+30)
         ldy #>(pasek+30)
         stx $c0
         sty $c1
         ldx #16

aj4      lda #0
         tay
         sta ($c0),y

         lda $c0
         clc
         adc #32
         sta $c0
         bcc *+4
         inc $c1
         dex
         bne aj4
         jsr _jasno
         rts



_initmap   ; equ *

         ldx #<(admap+2)
         ldy #>(admap+2)
         stx $cd
         sty $ce
         lda #2
         sta $cc

         ldx #<plansze
         ldy #>plansze
         stx $c0
         sty $c1
         stx admap
         sty admap+1

ah9      lda #2
         ldx #$9b
         jsr _szuk

         ldy #0
         lda $c0
         sta ($cd),y
         iny
         lda $c1
         sta ($cd),y

         lda $cd
         clc
         adc #2
         sta $cd
         bcc ah8
         inc $ce
ah8      ldx $cc
         inx
         stx $cc
         cpx #73
         bcc ah9
         rts


_szuk    equ *
         cmp #1
         bne aj1
         rts
aj1      stx $cf
         tax
         dex
aj2      ldy #0
         lda ($c0),y
         jsr _dod
         cmp $cf
         bne aj2
         dex
         bne aj2
         rts
_dod     inc $c0
         bne aj3
         inc $c1
aj3      rts

_get_len *     ;$c0 - txt pointer, $cf - EOL, Y - result
         ldy #0
al3      lda ($c0),y
         cmp $cf
         beq al8
         iny
         bne al3
al8      rts

tankuj   lda fuel
         cmp #MAX_FUEL
         bcs ag8
         inc fuel
         ldx #1
         jsr _zegar
         jmp tankuj
ag8      jmp newruch

kolizja  equ *

         bpl af6
         jmp nextpl

af6      ldy #(cpnend-cpn-1)
ag6      lda cpn,y
         cmp t
         bne ag5
         jmp tankuj
ag5      dey
         bpl ag6

         lda t
         cmp #84
         bne am1
         jmp _wezrzc

am1      ift NO_OBSTACLES = 0
          jmp ad1
         els
          jmp af5
         eif


nextpl    ;   equ *
         ldx pozmap
         ldy pozmap+1
         stx $c0
         sty $c1

         lda z
         cmp #1
         bne af7
         lda #16
         jmp nm
af7      cmp #3
         bne af8
         lda #16
         jmp np
af8      cmp #2
         bne af9
         lda #1
         jmp np
af9      lda #1
         jmp nm

np       sta $c2
         lda $c0
         clc
         adc $c2
         sta $c0
         bcc af10
         inc $c1
af10     jmp af11

nm       sta $c2
         lda $c0
         sec
         sbc $c2
         sta $c0
         bcs af11
         dec $c1
af11     ;equ *
         ldy #0
         lda ($c0),y
         bne af13
         jmp ad1

af13     ldx $c0
         ldy $c1
         stx pozmap
         sty pozmap+1
         jsr _prmap
         lda #0
         sta t

         lda z
         ldx x
         ldy y
         cmp #1
         bne ag1
         ldy #13
ag1      cmp #3
         bne ag2
         ldy #0
ag2      cmp #2
         bne ag3
         ldx #0
ag3      cmp #4
         bne ag4
         ldx #23
ag4      stx x
         sty y

         jmp newruch


_prmap    ;equ *

         ldx pozmap
         ldy pozmap+1
         stx $c0
         sty $c1
         ldy #0
         lda ($c0),y
         sta pl
         bpl aw5
         pla
         pla
         jmp run_win

aw5      sec
         sbc #1
         asl 
         tay
         lda admap,y
         sta $c0
         lda admap+1,y
         sta $c1
         ldx #<des
         ldy #>des
         stx $c2
         sty $c3
         jsr _dekomp     ;Decompress map

         ldx #<des
         ldy #>des
         stx $c0
         sty $c1

         ldx #<(ekr+4)
         ldy #>(ekr+4)
         stx $c2
         sty $c3

         lda #14
         sta $c4

af4      ldx #24
         ldy #0
af1      lda ($c0),y
         sta ($c2),y
         iny
         dex
         bne af1

         lda $c0
         clc
         adc #24
         sta $c0
         bcc af2
         inc $c1
af2      lda $c2
         clc
         adc #32
         sta $c2
         bcc af3
         inc $c3
af3      dec $c4
         bne af4

         lda #$ff
         sta msg_col
         jsr _ciemno
         jsr _mazanie
         jsr _show_sq_name
         jsr _show_sq_state
         jsr _show_ava_item
         lda #MSG_DEFCOL
         sta msg_col
         rts

_mul eor #%11111111
     sta _bta

     stx _btb
     ldx #0
     stx _btb+1

     ldx #8

_lop lsr _bta
     bcs _nxt

     lda _btb
     adc _rsl
     sta _rsl
     lda _btb+1
     adc _rsl+1
     sta _rsl+1

_nxt asl _btb
     rol _btb+1

     dex
     bne _lop
     rts

_bta dta b (0)
_btb dta a (0)
_rsl dta a (0)

        icl "game_dli.asm"

_pdmg    lda pd
         beq ae9
         dec pd
         jmp ae7
ae9      inc damage
         lda #3
         sta pd
         jsr _mfuel
         ldx #2
         jsr _zegar
         lda damage
         cmp #MAX_DAMAGE
         beq _ove
         rts
_ove     pla
         pla
         jsr gameover_pre
         jsr gameover
         rts


_mfuel   ldy k 
         lda kod,y
         cmp #CR
         bne ah4
         rts
ah4      dec pf
         bne ae7
         lda #FUEL_EXP
         sta pf
         dec fuel
         beq _ove
ae7      rts

_keyoff  lda #KEY_NONE
         sta kbcodes
         rts

_msr     ldx #<(gra_fnt+$d0)  ;208
         ldy #>(gra_fnt+$d0)
         stx $d2
         sty $d3
         ldy #15
         lda #0
ac3      sta ($d2),y
         dey
         bpl ac3
         rts

_joy     lda $0278
         sta s
         cmp #15
         lda #0   ;_joyf1
         sta f
         lda $0284
         bne _joyf2
         lda #1   ;_joyf3
         sta f
_joyf2   rts


_ust     ldx #<ekr
         ldy #>ekr
         stx $c0
         sty $c1

         lda y
         ldx #32
         jsr _mn
         lda x
         clc
         adc #4
         sta $c2

         lda $c0
         clc
         adc $c2
         sta $c0
         bcc aa9
         inc $c1
aa9      rts

_zegar   lda $14
         cmp $14
         beq *-2
         dex
         bne _zegar
         rts

         sta $c2    ;_mnc
         lda #0
         sta $c0
         sta $c1
         lda $c2
_mn      sta $c2
         cpx #0
         beq aa4
aa6      lda $c0
         clc
         adc $c2
         sta $c0
         bcc aa5
         inc $c1
aa5      dex
         bne aa6
aa4      rts

_ai      cmp #96
         bcs aa7
         cmp #32
         bcc aa8
         sec
         sbc #32
         jmp aa7
aa8      clc
         adc #64
aa7      rts



; Koniec Programu

