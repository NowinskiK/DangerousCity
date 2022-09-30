         opt %100101
         org $a000

end_v    equ $e462
set_v    equ $e45c
cz_fnt   equ $7c00


         jmp leg

rep      nop
         nop
         rts
         jmp rep
         jmp rep

leg      equ *
         lda #$40
         sta $d40e
         lda #7
         ldx #$c2
         ldy #$8a
         jsr set_v
         ldx <dl_leg
         ldy >dl_leg
         stx $0230
         sty $0231
         lda #0
         sta $02c6
         sta $02c8
         lda >cz_fnt
         sta $02f4
         ldx <leg_t
         ldy >leg_t
         stx ax9+1
         sty ax9+2
         ldx <dli_leg
         ldy >dli_leg
         stx $0200
         sty $0201
         ldx #2
         jsr _zegar

ax12     lda #0
         sta str_leg
         ldy #7
ax1      sta leg_c,y
         dey
         bpl ax1

         lda #$c0
         sta $d40e

         ldy #0
ax3      lda leg_c,y
         cmp #15
         beq ax2
         clc
         adc #1
         sta leg_c,y
         ldx #2
         jsr _zegar
         jmp ax3

ax2      cpy #7
         beq ax4
         iny
         ldx #30
         jsr _zegar
         jmp ax3

ax4      lda $02fc  * joy !!!
         cmp #$ff
         beq ax4
         jsr _keyoff

ax8      lda leg_c
         beq ax10
         sec
         sbc #1
         sta leg_c
         sta leg_c+1
         sta leg_c+2
         sta leg_c+3
         sta leg_c+4
         sta leg_c+5
         sta leg_c+6
         sta leg_c+7
         ldx #2
         jsr _zegar
         jmp ax8

ax10     inc ax9+2
         lda ax9+1
         clc
         adc #$40
         sta ax9+1
         bcc ax11
         inc ax9+2
ax11     inc str_leg
         lda str_leg
         cmp #4
         beq ax13
         jmp ax12

ax13     jmp ax13




dli_leg  pha
         txa
         pha
         tya
         pha

         ldy #0
ax6      lda leg_c,y
         ldx #8
ax5      sta $d017
         sta $d40a
         dex
         bne ax5

         ldx leg_sp
ax7      sta $d40a
         dex
         bne ax7

         iny
         cpy #8
         bne ax6

         jmp end_v


         org $b000


dl_leg   dta b($70),b($70),b($70)
         dta b($70),b($70),b($f0)
ax9      dta b($42),a(leg_t)
         dta b($70),b(2)
         dta b($70),b(2)
         dta b($70),b(2)
         dta b($70),b(2)
         dta b($70),b(2)
         dta b($70),b(2)
         dta b($70),b(2)
         dta b($41),a(dl_leg)

leg_c    dta b(0),b(0),b(0)
         dta b(0),b(0),b(0)
         dta b(0),b(0)

leg_sp   dta b(8)
str_leg  dta b(0)

leg_t    equ *
     dta d'                                        '
     dta d'  NARESZCIE !  PO TAK DUGIEJ PRACY NAD '
     dta d' ZDJCIAMI  DO  TWOJEGO  NOWEGO FILMU - '
     dta d' NALEY  CI  SI  PORZDNY  ODPOCZYNEK. '
     dta d' DLATEGO  WRACASZ  TERAZ  SAMOCHODEM DO '
     dta d' SWOJEGO DOMU,  GDZIE MIESZKASZ WRAZ ZE '
     dta d' SWOJ LICZN RODZIN.                  '
     dta d'                                        '

     dta d'  BYA TO BARDZO DUGA I MCZCA PODR '
     dta d' ALE JU NIEDALEKO DO CHATY.            '
     dta d' - O KURCZE ! -  WRZASNE SAM DO SIE- '
     dta d' BIE.  WJECHAE W JAK BOCZN ULICZK '
     dta d' I NIE ZNASZ WACIWEJ DROGI POWROTNEJ. '
     dta d' OKAZAO SI, E ZNALAZE SI W JAKIM '
     dta d' TAJEMNICZYM  MIECIE,   GDZIE  NIE  MA '
     dta d' LUDZI I WYJCIA !!!                    '

     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '
     dta d'                                        '









_zegar   lda $14
         cmp $14
         beq *-2
         dex
         bne _zegar
         rts

_keyoff  lda #$ff
         sta $02fc
         rts

