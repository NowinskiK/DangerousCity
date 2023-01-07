		org $0500
		
x        dta (10)
y        dta (7)
z        dta (1)
znak     dta (0)
p        dta (0)
t        dta (0)
s        dta (0)
f        dta (0)
fuel     dta (112)
pf       dta b(fuel_exp)
damage   dta (0)
pd       dta (0)
pozmap   dta a(map+106)
pl       dta (1)
k        dta (0)
rzecz    dta (0)
kieszen  dta (0),(0),(0),(0)
music    dta (1)
pms      dta (0)
fr       dta (0)

; tablica wewnetrznych skokow vblk
; ekran, wektor
tab_vblk  dta a(VBL_title)    ;0=title
          dta a(VBL_leg)      ;1=legend
          dta a(VBL_game)     ;2=game
          dta a(VBL_ov)       ;3=gameover
          dta a(VBL_ov)       ;4=win

stage_title  = 0
stage_legend = 1
stage_game   = 2
stage_over   = 3
stage_win    = 4


	org $f0

fcnt	.ds 2
fadr	.ds 2
fhlp	.ds 2
cloc	.ds 1
regA	.ds 1
regX	.ds 1
regY	.ds 1
ekran   .ds 1  ; dta 0  ;0=title, 1=legend, 2=game

