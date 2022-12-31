            icl "atari.h"
            icl "title_sprites.asm"

; zmienne dane
rys          = $1000
fuel_exp     = 8            ;Zuzycie paliwa: 4 oryginalne, 8 - wolniejsze
SYSVBV       = $E45F         ;vector to process immediate VBLANK
USESPRITES   = 1


            org $0500
            icl "variables.asm"

            org $0c00
gra_fnt     ins "fonty\gra.fnt",6
cz_fnt      ins "fonty\cz.fnt",6

            org $1a40
rep         ins "muzyka\music.rep",6
cz_cmc      ins "muzyka\czolo.cmc",6
gra_cmc     ins "muzyka\gra.cmc",6
over_cmc    ins "muzyka\gameover.cmc",6
win_cmc     ins "muzyka\win.cmc",6
plansze     ins "plansze\pl",6

            icl "title.asm"

            .ALIGN $0100
            .ds $0400
main        jsr main_title
            ;jmp leg
            jsr dc
            jmp main

dc          icl "DC.asm"
            icl "PROC.ASM"
            icl "DATA.asm"

            .ALIGN $0400
fnt	        ins "newgfx\TYT10_PTODT4.fnt"

            run main
