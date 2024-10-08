		org $0500
		
x        dta (10)
y        dta (7)
z        dta (1)
znak     dta (0)
p        dta (0)
t        dta (0)
s        dta (0)
f        dta (0)
fuel     dta (MAX_FUEL)
pf       dta b(FUEL_EXP)
damage   dta (0)
pd       dta (0)
pozmap   dta a(map+106)
pl       dta (1)
fki      dta (0)
ikd      dta (0)
tnki     dta (0)
rzecz    dta (0)
pocket   dta (0),(0),(0),(0)
music    dta (1)
fr       dta (0)
stage    dta (0)
msg_col  dta b(MSG_DEFCOL)
msg_tmp  dta b(0)
one_act  dta b(0)

color_index  dta b(2)
color_v      dta b(0)
prompt       dta d'>'
color_bri    dta b(0)

; tablica wewnetrznych skokow vblk
; stage / wektor
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

;    VER
        icl "ver.asm"


	org $f0

regA	.ds 1
regX	.ds 1
regY	.ds 1
color_1 equ $f8

; CONST
ASCZER     = $00           ;ASCII ZERO
COLON      = $3A           ;ASCII COLON
CR         = $9B           ;SYSTEM EOL (CARRIAGE RETURN)
EOL        = $9B           ;end of line (RETURN)
USESPRITES = 1
MAX_FUEL   = 14*8 ;112
MAX_DAMAGE = 14*8 ;112
FUEL_EXP   = 8            ;Zuzycie paliwa: 4 - oryginalne, 8 - wolniejsze
FADECHR	   = 1            ;1 = left only buffer for sprites and decompress
NB_ITEMS   = 1            ;1 = Show number (1,2,3,4.) in the pocket; 0 - no
SCHR	   = 127
KEYDEFP    = $79
MSG_DEFCOL = $0B
LEN32      = $20
BAR1_BOTTM = LEN32 * 12 + 1
BAR2_BOTTM = LEN32 * 12 + 30

; One action
ACT_SHOW_SQ_STATE = 1

; Special characters
PLI_Z      = $5A
PL_Z    EQU $1A
PL_O    EQU $0F
PL_L    EQU $0C

; Language
LANG    = 'pl'          ; pl - Polish, en - English
;LANG    = 'en'

; Trick flags
NO_DAMAGE    = 0
NO_OBSTACLES = 0
DEBUG_MODE   = 0
