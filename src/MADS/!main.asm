            icl "atari_g2f.h"
            
admap       = $0700     ;tablica adresow do skompresowanych plansz
des         = $0800     ;bufor dla rozpakowanej planszy
zst_fnt     = $bc00     ;bufor dla backup'u fontow

            icl "loader_basic_off.asm"
            org $bc00
            icl "loader.asm"
            org $1000
            icl "title_sprites.asm"
            icl "game_sprites.asm"
            icl "variables.asm"

            org $1a40
rep         ins "muzyka\music.rep",6
cz_cmc      ins "muzyka\czolo.cmc",6
gra_cmc     ins "muzyka\gra.cmc",6
over_cmc    ins "muzyka\gameover.cmc",6
win_cmc     ins "muzyka\win.cmc",6
plansze     ins "plansze\pl",6

            .ALIGN $0400
gra_fnt     ins "fonty\gra.fnt"
cz_fnt      ins "fonty\cz.fnt"
fnt	        ins "newgfx\TYT10_PTODT4.fnt"

            icl "title.asm"

            .ALIGN $0400
            icl "DATA.asm"

start       jsr _backup_fnt
main        jsr main_title
            jsr dc
            jmp main

dc          icl "DC.asm"
            icl "PROC.ASM"


            run start
