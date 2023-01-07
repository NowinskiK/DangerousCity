dl_win   dta $70,$70,$70
         dta $47,a(grat1)
         dta $70
         dta $42,a(grat2)
         dta $00,$02
         dta $00,$02
         dta $00,$02
         dta $00,$02
         dta $00,$02
         dta $70
         dta $00,$02
         dta $00,$02
         dta $00,$02
         dta $00,$02
         dta $f0
         dta $41,a(dl_win)

; -------------------------------------------------

run_win  lda #stage_win
         sta stage

         lda #$70
         ldx #<win_cmc
         ldy #>win_cmc
         jsr rep+3
         lda #0
         tax
         jsr rep+3

         ldx #<dl_win
         ldy #>dl_win
         stx $0230
         sty $0231
         stx $d402
         sty $d403
         ldx #<dli_ov
         ldy #>dli_ov
         stx VDSLST   ;$0200
         sty VDSLST+1 ;$0201

         ldx #2
         jsr _zegar

         lda #$3c
         sta $02c4
         lda #$56
         sta $02c5
         lda #0
         sta $02c6
         sta $02c8
         lda #>cz_fnt
         sta $02f4

         ldx #16
         jsr _zegar
        
aw6      jsr _joy
;*         lda #0
;*         sta konsol
         lda CONSOL
         and #7
         cmp #7
         bne aw7
         lda f
         beq aw6
aw7      rts
