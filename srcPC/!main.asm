
!To "Release\DC.xex", plain 


; stale procedury komputera

key      = $f2f8
pr_a     = $f2b0
pr_t     = $c642
set_v    = $e45c
end_v    = $e462
end_v2   = $e45f
konsol   = $d01f

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


* = $1000-6-3
!WORD $ffff
!WORD begin1
!WORD End-1
begin1
      jmp run
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



