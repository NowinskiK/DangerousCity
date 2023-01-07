            icl "atari_g2f.h"
            icl "title_sprites.asm"
            
admap       = $0700
des         = $0800
zst_fnt     = $bc00


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
            jsr dc
            jmp main

            icl "DATA.asm"
dc          icl "DC.asm"
            icl "PROC.ASM"

            .ALIGN $0400
fnt	        ins "newgfx\TYT10_PTODT4.fnt"

            run main
