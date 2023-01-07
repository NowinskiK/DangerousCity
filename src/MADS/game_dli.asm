VBL_game
        lda #>gra_fnt
        sta CHBASE

        mwa #dli_1 VDSLST    ;$0200
        ;jsr rep+6		; muzyka gra!
        jsr vmus
        rts

dli_1   sta regA
        lda #>cz_fnt
        sta CHBASE

        DLINEW dli_2 1 0 0

dli_2   sta regA

        lda #$22
        sta $d400

        lda regA
        rti

vmus    jsr _music
        jsr rep+6
        jsr _zapisz
        lda #0
        sta $4d
        rts
;          jmp SYSVBV    ;E45F
