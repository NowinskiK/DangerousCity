            icl "atari.h"

; zmienne dane
rys          = $1000
fuel_exp     = 8            ;Zuzycie paliwa: 4 oryginalne, 8 - wolniejsze
SYSVBV       = $E45F         ;vector to process immediate VBLANK
PLAY_MUSIC   = 1

            org $1a00
            icl "variables.asm"

            org $1a40
rep         ins "muzyka\music.rep",6
cz_cmc      ins "muzyka\czolo.cmc",6
gra_cmc     ins "muzyka\gra.cmc",6
over_cmc    ins "muzyka\gameover.cmc",6
win_cmc     ins "muzyka\win.cmc",6

plansze     ;ins "plansze\pl",6

            ;org $4000
            .ALIGN $0400
gra_fnt     ;ins "fonty\gra.fnt",6
cz_fnt      ins "fonty\cz.fnt",6
logo_fnt = fnt + $0800



            ;org $2000
            .ALIGN $0400
main        jsr main_title
            jmp dc

            icl "title.asm"
dc          icl "DC.asm"
            icl "PROC.ASM"
            icl "DATA.asm"
            icl "music.asm"


            run main
