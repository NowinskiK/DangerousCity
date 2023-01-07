dl_leg   dta $70,$70,$70
         dta $70,$70,$f0
ax9      dta $42,a(leg_t)
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $41,a(dl_leg)

leg_c    dta 0,0,0
         dta 0,0,0
         dta 0,0

leg_sp   dta 8    ;leg_sp   dta 8)
str_leg  dta 0    ;dta 0

; -----------------------------------------------

run_leg   ;      equ *   ;LEGENDA

         lda #stage_legend
         sta ekran

         lda #$22
         sta SDMCTL  ;$022f

         ldx #<dl_leg
         ldy #>dl_leg
         stx $0230
         sty $0231
         lda #0
         sta $02c6
         sta $02c8
         lda #>cz_fnt
         sta $02f4
         ldx #<leg_t
         ldy #>leg_t
         stx ax9+1
         sty ax9+2

         ldx #2
         jsr _zegar

         lda #0
         sta str_leg
ax12     lda #0
         ldy #7
ax1      sta leg_c,y
         dey
         bpl ax1

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
         ldx #2 ;;30
         jsr _zegar
         jmp ax3

ax4      lda #$ff
         sta kbcodes
az1      jsr _joy
         lda kbcodes
         cmp #$ff
         bne az2
         lda f
         bne az2
         jmp az1
az2      jsr _keyoff

        ; sciemnianie ekranu
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

; exit from legend
ax13    jmp init_title



VBL_leg
	mwa #dli_leg VDSLST    ;$0200
	jsr rep+6		; muzyka gra!
	rts


dli_leg  
         sta regA
         stx regX
         sty regY

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

         lda regA
         ldx regX
         ldy regY

         rti