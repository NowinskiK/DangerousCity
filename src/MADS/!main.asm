    icl "atari.h"

; zmienne dane

rys      = $1000
rep      = $1a40
cz_cmc   = $2202
gra_cmc  = $2887
over_cmc = $31fd
win_cmc  = $37bd
plansze  = $4000
mi_fnt   = $7400
gra_fnt  = $7800
cz_fnt   = $7c00

fuel_exp = 8    ;Zuzycie paliwa: 4 oryginalne, 8 - wolniejsze

SYSVBV  = $E45F         ;vector to process immediate VBLANK


    org $1000
    ins "plansze\rys",6
    ins "plansze\music.rep",6
    ins "muzyka\czolo.cmc",6
    ins "muzyka\gra.cmc",6
    ins "muzyka\gameover.cmc",6
    ins "muzyka\win.cmc",6

    org $4000
    ins "plansze\pl",6
    ins "fonty\mirage.fnt",6
    ins "fonty\a.fnt",6
    ins "fonty\b.fnt",6

    org $a000
main
    icl "DC.asm"
    icl "PROC.ASM"

    org $8000
    icl "DATA.asm"

    org $0500
    icl "variables.asm"

    org $02e0
    dta a(main)
