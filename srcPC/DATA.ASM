;*=$8000-4
;!To "DATA.BIN", plain 
;!word dl_leg
;!word data_end-1

dl_leg   !byte $70,$70,$70
         !byte $70,$70,$f0
ax9      !byte $42,<leg_t,>leg_t
         !byte $70,2
         !byte $70,2
         !byte $70,2
         !byte $70,2
         !byte $70,2
         !byte $70,2
         !byte $70,2
         !byte $41,<dl_leg,>dl_leg

leg_c    !byte 0,0,0
         !byte 0,0,0
         !byte 0,0

leg_sp   !byte 8    ;leg_sp   !byte 8)
str_leg  !byte 0    ;!byte 0


dl_win   !byte $70,$70,$70
         !byte $47,<grat1,>grat1
         !byte $70
         !byte $42,<grat2,>grat2
         !byte 0,2
         !byte 0,2
         !byte 0,2
         !byte 0,2
         !byte 0,2
         !byte $70
         !byte 0,2
         !byte 0,2
         !byte 0,2
         !byte 0,2
         !byte $f0
         !byte $41,<dl_win,>dl_win

dl_cz    !byte $70,$70
         !byte $f0,$30
         !byte $47,<ekr_cz,>ekr_cz
         !byte $70,$00
         ;!byte $4e,<rys,>rys
         !byte $4e,0,$10
         !hex  0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 0e 0e
         !hex  0e 0e 0e 0e 0e 0e 
         !byte $70,$f0
         !byte $42,<t1_cz,>t1_cz
         !byte $70
         !byte $42,<t2_cz,>t2_cz
         !byte $f0
         !byte $44,<mi_t,>mi_t
         !byte $04,$04
         !byte $41,<dl_cz,>dl_cz


dl_over  ;equ *
     !byte $70,$70
     !byte $70,$70
     !byte $70,$70
     !byte $70,$f0
     !byte $70,$70
     !byte $47,<ekr_over,>ekr_over
     !byte $41,<dl_over,>dl_over


dl       ;equ *
     !WORD $7070
     !byte $42  
     !WORD pasek
     !byte $42
     !word ekr
     !fill 14, $02
     !byte $80,$0f,$02
     !byte $20,$4f
     !word linijka
     !byte $42
     !word rzeczy_w
     !hex  02 02 02 f0
     !hex  02 20 02
     !byte 41
     !word dl

!source "ekr_mapping.asm"
leg_t    ;equ *
     !text "                                        "
     !text "  NARESZCIE !  PO TAK DlUGIEJ PRACY NAD "
     !text " ZDJeCIAMI  DO  TWOJEGO  NOWEGO FILMU - "
     !text " NALEzY  CI  SIe  PORZaDNY  ODPOCZYNEK. "
     !text " DLATEGO  WRACASZ  TERAZ  SAMOCHODEM DO "
     !text " SWOJEGO DOMU,  GDZIE MIESZKASZ WRAZ ZE "
     !text " SWOJa LICZNa RODZINa.                  "
     !text "                                        "

     !text "  BYlA TO BARDZO DlUGA I MeCZaCA PODRoz "
     !text " ALE JUz NIEDALEKO DO CHATY.            "
     !text " - O KURCZE ! -  WRZASNalEs SAM DO SIE- "
     !text " BIE.  WJECHAlEs W JAKas BOCZNa ULICZKe "
     !text " I NIE ZNASZ WlAsCIWEJ DROGI POWROTNEJ. "
     !text " OKAZAlO SIe, zE ZNALAZlEs SIe W JAKIMs "
     !text " TAJEMNICZYM  MIEsCIE,   GDZIE  NIE  MA "
     !text " LUDZI I WYJsCIA !!!                    "

     !text "  PENETRUJaC TEREN, WIDZIAlEs PO DRODZE "
     !text " JAKIEs  PRZEDMIOTY,  ALE NIE ZNASZ ICH "
     !text " PRZEZNACZENIA.  I  TU  ROZPOCZYNA  SIe "
     !text " TWOJA  MISJA.  JEzDZaC PO TYM MIEsCIE, "
     !text " MUSISZ BRAc PRZEDMIOTY  I  UzYWAc  ICH "
     !text " GDZIE TRZEBA.  ROBIaC TAK -  OTWORZYSZ "
     !text " BRAMe  PROWADZaCa  DO  WYJsCIA  Z TEGO "
     !text " PRZEKLeTEGO MIASTA.                    "

     !text "                                        "
     !text " DOSTePNE KLAWISZE :                    "
     !text "                                        "
     !text " "
     !hex  d9 91 59 0d d9 94 59
     !text "  UzYWANIE PRZEDMIOToW            "
     !hex  D9 A5 B3 A3 59 00 00 00 2B 2F 2E 29 25 23 00 27
     !hex  32 39 00 00 00 00 00 00 00 00 00 00 00 00 00 00
     !hex  00 00 00 00 00 00 00 D9 B3 A8 A9 A6 B4 59 00    
     !text " WlaCZENIE / WYlaCZENIE MUZYKI          "
     !text "                                        "
     !text "                               "
     
     !CONVTAB raw
     !CT ' ',$00
     !CT '#',$80
     !CT '=',$FF

ekr_over !text "   koniec gry   "    ;85ee

pasek    !text "   ##########################   "
ekr      !text "   #                        #   "   ;861e
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   #                        #   "
         !text "   ##########################   "
         
linijka  !text "    ========================    "     ;87fe
plname   !text "    ########################    "   ;881e
rzeczy_w !text "    ########################    "   ;883e
         !text "    ########################    "
         !text "    ########################    "
         !text "    ########################    "
kom      !text "                                        "  ;88be
rzc_wid  !text "                                        "  ;88e6


ekr_cz   !text " city dangerous "
t1_cz    !text "                                "  ;$891e
         !text "                                "
t2_cz    !text "                                "
         !text "                                "

!source "ekr_mapping.asm"
tc1      !text "         PROGRAMOWANIE          "
         !text "             MUZYKA             "
         !text "       GRAFIKA PRZED GRa        "
         !text "         GRAFIKA DO GRY         "
         !text "       SCENARIUSZ I MAPA        "
         !text "           PRODUKCJA            "
         !text "          WROClAW 1994          "

tc2  !text "         KAMIL NOWInSKI         "
     !text "         KONRAD  GMUREK         "
     !text "        HUBERT  NOWInSKI        "
     !text "         KAMIL NOWInSKI         "
     !text "     KAMIL, HUBERT NOWInSCY     "
     !text "      MIRAGE SOFTWARE LTD.      "
     !text "                                "
     !text "                                "
     !text "                                "


mi_t !hex  6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6C 6D
     !hex  6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E
     !hex  6E 6E 6E 6E 6E 6E 6E 6E 41 41 41 41 41 41 41 41
     !hex  41 41 42 43 44 45 46 46 47 48 49 4A 4B 4C 4D 4E
     !hex  4F 50 51 52 53 54 41 41 41 41 41 41 41 41 41 41
     !hex  55 55 55 55 55 55 55 55 56 57 58 59 5A 5B 5B 5C
     !hex  5D 5E 5F 60 61 62 63 64 65 66 67 68 69 69 69 6A
     !hex  6B 55 55 55 55 55 55 55 

     !CONVTAB raw
     !CT '-',$0D
grat1    !text "---gratulacje---"     ;8c16
    !source "ekr_mapping.asm"
    
grat2    !text "    WYDOSTAlEs SIe Z MIASTA,    "
         !text "      W KToRYM ZABlaDZIlEs      "
         !text "    I WYJEzDZAJaC Z BOCZNEJ     "
         !text "   ULICZKI PROWADZaCEJ PRZEZ    "
         !text "    MROCZNY LAS - UDAlEs SIe    "
         !text "       WRESZCIE DO DOMU .       "
         !text "      JUz WSZYSTKIE TWOJE       "
         !text "    KlOPOTY MINelY, LECZ NIE    "
         !text "     WIADOMO CO SIe JESZCZE     "
         !text "        MOzE ZDARZYc ...        "

tabzw    !hex 01 1c 02 1f 03 1d 04 1e 00 ;8d66

!source "car.asm"

;mapa gry     A  B  C  D  E  F  G  H  I  J  K  L  M  N     ;8e6f

map  !hex  00 00 00 00 00 00 80 00 00 00 00 00 00 00 00 00
     !hex  00 00 33 32 00 00 39 00 00 00 16 17 18 00 1C 00  ;1
     !hex  00 00 00 31 30 00 38 00 25 24 15 00 19 1A 1B 00  ;2
     !hex  00 00 00 2B 2A 29 28 27 26 00 14 00 00 1D 00 00  ;3
     !hex  00 00 36 2C 2D 2E 00 00 00 00 13 37 00 1E 1F 00  ;4
     !hex  00 00 35 34 00 2F 00 05 04 03 12 00 00 00 20 00  ;5
     !hex  00 00 00 3A 00 00 00 00 0B 02 01 0C 0D 00 21 00  ;6 
     !hex  00 3D 3C 3B 41 42 43 00 0A 00 06 00 0E 00 22 00  ;7 
     !hex  00 3E 3F 00 00 44 00 00 09 08 07 00 0F 00 23 00  ;8
     !hex  00 00 40 00 45 46 47 00 00 00 00 00 10 11 00 00  ;9
     !hex  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

cpn  !hex  2B 2C 4B 4C 6B 6C ;$8F1F
kod  !hex  05 3f 25 0d 00 08 3e 9b 

namepl_t ;equ *
     !CONVTAB raw
     !CT 'l',$0C, 'e',$05, 's',$13, 'z',$1A, 'a',$01, 'c',$03, 'n',$0E, 'o',$0F
     !text "CENTRUM",0      ;*1
     !text "",0
     !text "",0
     !text "",0
     !text "BANK",0
     !text "",0
     !text "",0
     !text "STACJA PALIW",0
     !text "",0
     !text "",0      ;*10
     !text "GOSPODARSTWO WIEJSKIE",0
     !text "",0
     !text "",0
     !text "PRZEDSZKOLE",0
     !text "",0
     !text "BAR",0
     !text "GRANICA MIASTA",0
     !text "",0
     !text "PARKING POGOTOWIA",0
     !text "",0      ;*20
     !text "",0
     !text "OGRoDKI DZIAlKOWE",0
     !text "OGRoDKI DZIAlKOWE",0
     !text "OGRoDKI DZIAlKOWE",0
     !text "",0
     !text "",0
     !text "CIEMNA ULICZKA",0
     !text "STACJA PALIW",0
     !text "PARK",0
     !text "PARK",0      ;*30
     !text "PARK",0
     !text "PARK",0
     !text "",0
     !text "STACJA PALIW",0
     !text "GRANICA MIASTA",0
     !text "",0
     !text "STACJA PALIW",0
     !text "",0
     !text "",0
     !text "DOMEK",0      ;*40
     !text "RONDO",0
     !text "RONDO",0
     !text "RONDO",0
     !text "RONDO",0
     !text "RONDO",0
     !text "RONDO",0
     !text "sLEPA ULICZKA",0
     !text "",0
     !text "",0
     !text "",0      ;*50
     !text "GRANICA MIASTA",0
     !text "",0
     !text "",0
     !text "SUPER MARKET",0
     !text "",0
     !text "",0
     !text "GRANICA MIASTA",0
     !text "",0
     !text "",0
     !text "",0      ;*60
     !text "",0
     !text "",0
     !text "",0
     !text "SKLEP Z PUKAWKAMI",0
     !text "",0
     !text "",0
     !text "STACJA PALIW",0
     !text "ELEKTROWNIA NIEJaDROWA",0
     !text "ELEKTROWNIA NIEJaDROWA",0
     !text "ELEKTROWNIA NIEJaDROWA",0      ;*70
     !text "ELEKTROWNIA NIEJaDROWA",0

tu_tab   ;equ *

     !byte 5,1,2
     !byte 10,3,20
     !byte 11,4,4
     !byte 14,5,5
     !byte 16,6,6
     !byte 19,7,20
     !byte 22,8,16
     !byte 56,9,20
     !byte 57,10,10
     !byte 50,11,20
     !byte 40,12,13
     !byte 64,6,14
     !byte 23,8,8
     !byte 68,15,17
     !byte 0

adt_tab  ;equ *

     !word (t1)
     !word (t2)
     !word (t3)
     !word (t4)
     !word (t5)
     !word (t6)
     !word (t7)
     !word (t8)
     !word (t9)
     !word (t10)
     !word (t11)
     !word (t12)
     !word (t13)
     !word (t14)
     !word (t15)
     !word (t16)
     !word (t17)
     !word (t20)
     !word (t20)
     !word (t20)

     !CONVTAB raw
     !CT '£',$7B, '$',$02, '!',$04, '%',$16
t1   !text "Sejf",0
t2   !text "Pusty sejf",0
t3   !text "Murek",0
t4   !text "Studnia",0
t5   !text "Piaskownica",0
t6   !text "Sprzedawca w sklepie",0
t7   !text "Nienasmarowana brama",0
t8   !text "Ogrodzenie",0
t9   !text "Gor!cy asfalt",0
t10  !text "Dziura w murze",0
t11  !text "Wystaj!ce gwo$dzie",0
t12  !text "Drzwi do domu",0
t13  !text "Otwarty dom",0
t14  !text "Obezw£adniony sprzedawca",0
t15  !text "Stra%nik",0
t16  !text "Dziura w p£ocie",0
t17  !text "Otruty stra%nik",0
t20  !text "",0

zrob  !fill 72,$00

plrzc !fill 71,$00 

plrzc_z  ;equ ;*

     !byte 0     ;*1
     !byte 9
     !byte 0
     !byte 0
     !byte 0
     !byte 0
     !byte 0
     !byte 0
     !byte 23
     !byte 0     ;*10
     !byte 20
     !byte 0
     !byte 0
     !byte 0
     !byte 25
     !byte 0
     !byte 0
     !byte 0
     !byte 0
     !byte 0     ;*20
     !byte 0
     !byte 16
     !byte 0
     !byte 15
     !byte 0
     !byte 0
     !byte 0
     !byte 12
     !byte 0
     !byte 21     ;*30
     !byte 0
     !byte 0
     !byte 3
     !byte 0
     !byte 0
     !byte 0
     !byte 26
     !byte 0
     !byte 0
     !byte 0     ;*40
     !byte 0
     !byte 22
     !byte 0
     !byte 0
     !byte 0
     !byte 0
     !byte 10
     !byte 0
     !byte 27
     !byte 0     ;*50
     !byte 18
     !byte 0
     !byte 5
     !byte 1
     !byte 13
     !byte 0
     !byte 0
     !byte 0
     !byte 29
     !byte 0     ;*60
     !byte 0
     !byte 24
     !byte 0
     !byte 0
     !byte 0
     !byte 0
     !byte 28
     !byte 0
     !byte 8
     !byte 0     ;*70
     !byte 0

rzc  !byte 22,11  ;*1
     !byte 0,0
     !byte 12,7
     !byte 0,0
     !byte 2,7
     !byte 0,0
     !byte 0,0
     !byte 6,1
     !byte 19,7
     !byte 12,10  ;*10
     !byte 0,0
     !byte 1,3
     !byte 20,11
     !byte 0,0
     !byte 14,1
     !byte 10,6
     !byte 0,0
     !byte 10,11
     !byte 0,0
     !byte 2,4  ;*20
     !byte 2,6
     !byte 7,1
     !byte 14,4
     !byte 1,12
     !byte 21,7
     !byte 1,12
     !byte 6,6
     !byte 14,10
     !byte 5,8
     !byte 0,0  ;*30
     !byte 0,0

rzc_nam  ;equ *
     !CONVTAB raw
     !CT 'l',$0C, 'e',$05, 's',$13, 'z',$1A, 'a',$01, 'c',$03, 'n',$0E, 'o',$0F
     !text "SZMAL",0
     !text "PIWO",0
     !text "KLUCZ",0
     !text "CYJANEK",0
     !text "OTWIERACZ",0
     !text "OTWARTE PIWO",0
     !text "ZATRUTE PIWO",0
     !text "BATERIA",0
     !text "zARoWECZKA",0
     !text "LATARKA",0
     !text "KOMPLETNA LATARKA",0
     !text "SMAR",0
     !text "SlUCHAWKI LEKARSKIE",0
     !text "DETONATOR",0
     !text "SEKATOR",0
     !text "lOPATA",0
     !text "DESKI",0
     !text "GAZ lZAWIaCY",0
     !text "DYNAMIT",0
     !text "WIADRO WODY",0
     !text "KIJ",0
     !text "TAsMA KLEJaCA",0
     !text "KINESKOP",0
     !text "BUTELKA",0
     !text "OPONA",0
     !text "DeTKA",0
     !text "KSIazKA",0
     !text "BUDZIK",0
     !text "KARABIN",0
     !text "LATARKA Z zARoWKa",0
     !text "LATARKA Z BATERIa",0


lit_t    ;equ *
     !byte (0),(0),(0),(0)

     !byte (2),(4),(4),(6)
     !byte (6),(8),(8),(10)
     !byte (10),(8),(8),(6)
     !byte (6),(4),(4),(2)


tlo_t    ;equ *
     !byte (2)
     !byte (4)
     !byte (4)
     !byte (6)
     !byte (6)
     !byte (8)
     !byte (8)
     !byte (10)
     !byte (10)
     !byte (10)
     !byte (12)
     !byte (12)

     !byte (12)
     !byte (12)
     !byte (10)
     !byte (10)
     !byte (10)
     !byte (8)
     !byte (8)
     !byte (6)
     !byte (6)
     !byte (4)
     !byte (4)
     !byte (2)


     !CONVTAB raw
     ;    l        s        a        z        e       x       o
     !CT '£',$7B, '$',$06, '!',$04, '%',$16, '*',$12, '\',$02, '@',$10
tt1  !text "Kupi£e$ piwo.",0
tt2  !text "W domu znalaz£e$ cyjanek.",0  ;94d7
tt3  !text "Otworzy£e$ piwo.",0
tt4  !text "Dosypa£e$ cyjanku do piwa.",0
tt5  !text "W£o%y£e$ bateri* do latarki.",0
tt6  !text "Wkr*ci£e$ %ar@wk* do latarki.",0
tt7  !text "Nasmarowa£e$ bram*.",0
tt8  !text "Otworzy£e$ sejf i znalaz£e$ detonator.",0
tt9  !text "Przeci!£e$ ogrodzenie.",0
tt10 !text "Wykopa£e$ deski.",0
tt11 !text "Po£o%y£e$ deski na gwo\dziach.",0
tt12 !text "Obezw£adni£e$ sprzedawc* i okrad£e$ go.",0
tt13 !text "Wysadzi£e$ mur.",0
tt14 !text "Ostudzi£e$ gor!cy asfalt.",0
tt15 !text "Wcisn!£e$ ukryty w murze przycisk.",0
tt16 !text "Otru£e$ stra%nika.",0

;data_end

