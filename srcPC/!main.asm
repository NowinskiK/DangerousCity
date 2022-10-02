
!To "Release\DC.xex", plain 

!source "atari.inc"

; zmienne dane

admap    = $0700
des      = $0a00
zst_fnt  = $0c00

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


* = $1000-6
!WORD $ffff
!WORD *+4
!WORD End-1

!bin "plansze\rys",,6
!bin "plansze\music.rep",,6
!bin "muzyka\czolo.cmc",,6
!bin "muzyka\gra.cmc",,6
!bin "muzyka\gameover.cmc",,6
!bin "muzyka\win.cmc",,6
!source "variables.asm"

* = $4000
!bin "plansze\pl",,6
!bin "fonty\mirage.fnt",,6
!bin "fonty\a.fnt",,6
!bin "fonty\b.fnt",,6


*=$8000
;!source "DATA.asm"
!source "DATA-QA.asm"

* = $a000
!source "DC.asm"
!source "PROC.ASM"

End  ; Koniec Programu

!WORD $02e0
!WORD $02e1
!WORD run
