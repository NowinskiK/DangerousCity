dl_over  ;equ *
     dta $70,$70
     dta $70,$70
     dta $70,$70
     dta $70,$f0
     dta $70,$70
     dta $47,a(ekr_over)
     dta $41,a(dl_over)

; ----------------------------------------------

gameover_pre        ;6 sec dead music - wait
         lda #$70
         ldx #<over_cmc
         ldy #>over_cmc
         jsr rep+3
         lda #0
         tax
         jsr rep+3
         ldx #$f0
         jsr _zegar

         ;sciemniaj ekran
at7      dec color1
         lda color1
         bmi at8
         ldx #2
         jsr _zegar
         ;jmp at7
at8      rts

gameover       ; Game over screen
         lda #stage_over
         sta ekran

         lda #$70
         ldx #<over_cmc
         ldy #>over_cmc
         jsr rep+3
         lda #0          ;play game over music
         ldx #1          ;song 2
         jsr rep+3

         lda #$e0
         sta $02f4
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

         lda #0
         sta $02c4
         sta $02c6
         sta $02c8
         jsr _keyoff

         ldx #10
         jsr _zegar

; --- wait for user
at9      jsr _joy
         lda kbcodes
         cmp #$ff
         bne az4
;         lda #0
;         sta consol
         lda CONSOL
         and #7
         cmp #7
         bne az4
         lda f
         beq at9

az4      jsr _keyoff
         rts

VBL_ov
	    mwa #dli_ov VDSLST    ;$0200
         jmp vmus        ;rts at the end
         ;rts

dli_ov   
         sta regA
         stx regX
         sty regY

         ldy #$00
at1      lda $0480,y
         sta wsync
         sta color2
         sta colbak
         iny
         cpy #$30
         bne at1
         lda #$00
         sta color2
         sta colbak

         lda regA
         ldx regX
         ldy regY

         rti