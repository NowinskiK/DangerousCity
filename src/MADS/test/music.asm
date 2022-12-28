.MACRO INIT_MUSIC

        ift PLAY_MUSIC
         lda #$70
         ldx #<cz_cmc
         ldy #>cz_cmc
         jsr rep+3
         lda #0
         tax
         jsr rep+3

;http://atariki.krap.pl/index.php/SETVBLV
	 lda #$06         ; muzyka ; VVBLKI (6) lub VVBLKD (7)  - SETVBLV
	 ldx #>vmus
	 ldy #<vmus
         ift !ROMOFF
         jsr SETVBV      ;$E45C - JMP $c15d
         ;jsr SETVBLV      ;$c272
         els
         jsr SETVBV3
         eif
        eif
.ENDM


        ;ift ROMOFF
        VIMIRQ = $0216
        INTEMP = $022D
SETVBV2                
        ASL
        STA INTEMP
        PHP
        SEI
        TYA
        LDY $022D
        INC WSYNC
        STA VIMIRQ,Y
        TXA
        STA VIMIRQ+1,Y
        PLP
        RTS

SETVBV3
        ASL
        STA INTEMP
        TXA
        LDX #$05
        STA WSYNC
LOOP    DEX
        BNE LOOP
        LDX INTEMP
        STA VIMIRQ+1,X
        TYA
        STA VIMIRQ,X
        RTS

        ;eif

vmus ift PLAY_MUSIC
         jsr rep+6
     eif
         lda #0
         sta $4d
         jmp SYSVBV    ;E45F
