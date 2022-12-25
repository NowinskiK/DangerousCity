

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

SYSVBV  = $E45F         ;vector to process immediate VBLANK


    org $1000
    ins "plansze\rys",6
    ins "plansze\music.rep",6
    ins "muzyka\czolo.cmc",6
    ins "muzyka\gra.cmc",6
    ins "muzyka\gameover.cmc",6
    ins "muzyka\win.cmc",6
    icl "variables.asm"

    org $4000
    ins "plansze\pl",6
    ins "fonty\mirage.fnt",6
    ins "fonty\a.fnt",6
    ins "fonty\b.fnt",6

    org $8000
    icl "DATA.asm"

    org $a000
    icl "DC.asm"
    icl "PROC.ASM"


;!WORD $02e0
;!WORD $02e1
;!WORD run
