dl_over  ;equ *
     dta $70,$70
     dta $70,$70
     dta $70,$70
     dta $70,$f0
     dta $70,$70
     dta $47,a(ekr_over)
     dta $41,a(dl_over)

; ----------------------------------------------

gameover   ; equ *

         lda #$70
         ldx #<over_cmc
         ldy #>over_cmc
         jsr rep+3
         lda #0
         tax
         jsr rep+3
         ldx #$e0
         jsr _zegar
at7      dec $02c5
         lda $02c5
         bmi at8
         ldx #2
         jsr _zegar
         jmp at7
at8      lda #0
         ldx #1
         jsr rep+3
         lda #$40
         sta nmien
         lda #$e0
         sta $02f4
         ldy #$8a
         ldx #$c2
         lda #7
         jsr SETVBV
         ldx #<dl_over
         ldy #>dl_over
         stx $0230
         sty $0231
         stx $d402
         sty $d403
         ldx #<dli_ov
         ldy #>dli_ov
         stx $0200
         sty $0201
         lda #$c0
         sta nmien
         lda #0
         sta $02c4
         sta $02c6
         sta $02c8
         jsr _keyoff

at9      jsr _joy
         lda $02fc
         cmp #$ff
         bne az4
;*         lda #0
;*         sta konsol
         lda CONSOL
         and #7
         cmp #7
         bne az4
         lda f
         beq at9

az4      lda #$40
         sta nmien
         jsr _keyoff
         jmp play



dli_ov   pha
         txa
         pha
         tya
         pha

         ldy #$00
at1      lda $0480,y
         sta $d40a
         sta $d018
         sta $d01a
         iny
         cpy #$30
         bne at1
         lda #$00
         sta $d018
         sta $d01a

         jmp XITVBV