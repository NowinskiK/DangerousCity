;*=$8000-4
;!To "DATA.BIN", plain 
;dta dl_leg
;dta data_end-1

dl_leg   dta $70,$70,$70
         dta $70,$70,$f0
ax9      dta $42,<leg_t,>leg_t
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $70,2
         dta $41,<dl_leg,>dl_leg

leg_c    dta 0,0,0
         dta 0,0,0
         dta 0,0

leg_sp   dta 8    ;leg_sp   dta 8)
str_leg  dta 0    ;dta 0


dl_win   dta $70,$70,$70
         dta $47,<grat1,>grat1
         dta $70
         dta $42,<grat2,>grat2
         dta 0,2
         dta 0,2
         dta 0,2
         dta 0,2
         dta 0,2
         dta $70
         dta 0,2
         dta 0,2
         dta 0,2
         dta 0,2
         dta $f0
         dta $41,<dl_win,>dl_win

dl_cz    dta $70,$70
         dta $f0,$30
         dta $47,<ekr_cz,>ekr_cz
         dta $70,$00
         dta $4e,<rys,>rys
         .he  0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 0e 0e
         .he 0e 0e 0e 0e 0e 0e 
         dta $70,$f0
         dta $42,<t1_cz,>t1_cz
         dta $70
         dta $42,<t2_cz,>t2_cz
         dta $f0
         dta $44,<mi_t,>mi_t
         dta $04,$04
         dta $41,<dl_cz,>dl_cz


dl_over  ;equ *
     dta $70,$70
     dta $70,$70
     dta $70,$70
     dta $70,$f0
     dta $70,$70
     dta $47,<ekr_over,>ekr_over
     dta $41,<dl_over,>dl_over


dl       ;equ *
     dta a($7070)
     dta $42  
     dta a(pasek)
     dta $42
     dta a(ekr)
     :14 dta $02
     dta $80,$0f,$02
     dta $20,$4f
     dta a(linijka)
     dta $42
     dta a(rzeczy_w)
     .he 02 02 02 f0
     .he 02 20 02
     dta $41
     dta a(dl)

     ;icl "ekr_mapping.asm"
leg_t    ;equ *
     dta d "                                        "
     dta d "  NARESZCIE !  PO TAK DlUGIEJ PRACY NAD "
     dta d " ZDJeCIAMI  DO  TWOJEGO  NOWEGO FILMU - "
     dta d " NALEzY  CI  SIe  PORZaDNY  ODPOCZYNEK. "
     dta d " DLATEGO  WRACASZ  TERAZ  SAMOCHODEM DO "
     dta d " SWOJEGO DOMU,  GDZIE MIESZKASZ WRAZ ZE "
     dta d " SWOJa LICZNa RODZINa.                  "
     dta d "                                        "

     dta d "  BYlA TO BARDZO DlUGA I MeCZaCA PODRoz "
     dta d " ALE JUz NIEDALEKO DO CHATY.            "
     dta d " - O KURCZE ! -  WRZASNalEs SAM DO SIE- "
     dta d " BIE.  WJECHAlEs W JAKas BOCZNa ULICZKe "
     dta d " I NIE ZNASZ WlAsCIWEJ DROGI POWROTNEJ. "
     dta d " OKAZAlO SIe, zE ZNALAZlEs SIe W JAKIMs "
     dta d " TAJEMNICZYM  MIEsCIE,   GDZIE  NIE  MA "
     dta d " LUDZI I WYJsCIA !!!                    "

     dta d "  PENETRUJaC TEREN, WIDZIAlEs PO DRODZE "
     dta d " JAKIEs  PRZEDMIOTY,  ALE NIE ZNASZ ICH "
     dta d " PRZEZNACZENIA.  I  TU  ROZPOCZYNA  SIe "
     dta d " TWOJA  MISJA.  JEzDZaC PO TYM MIEsCIE, "
     dta d " MUSISZ BRAc PRZEDMIOTY  I  UzYWAc  ICH "
     dta d " GDZIE TRZEBA.  ROBIaC TAK -  OTWORZYSZ "
     dta d " BRAMe  PROWADZaCa  DO  WYJsCIA  Z TEGO "
     dta d " PRZEKLeTEGO MIASTA.                    "

     dta d "                                        "
     dta d " DOSTePNE KLAWISZE :                    "
     dta d "                                        "
     dta d " "
     .he d9 91 59 0d d9 94 59
     dta d "  UzYWANIE PRZEDMIOToW            "
     .he D9 A5 B3 A3 59 00 00 00 2B 2F 2E 29 25 23 00 27
     .he 32 39 00 00 00 00 00 00 00 00 00 00 00 00 00 00
     .he 00 00 00 00 00 00 00 D9 B3 A8 A9 A6 B4 59 00    
     dta d " WlaCZENIE / WYlaCZENIE MUZYKI          "
     dta d "                                        "
     dta d "                               "
     
     ;!CONVTAB raw
     ;!CT ' ',$00
     ;!CT '#',$80
     ;!CT '=',$FF

ekr_over dta d "   koniec gry   "    ;85ee

pasek    dta d "   ##########################   "
ekr      dta d "   #                        #   "   ;861e
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   #                        #   "
         dta d "   ##########################   "
         
linijka  dta d "    ========================    "     ;87fe
plname   dta d "    ########################    "   ;881e
rzeczy_w dta d "    ########################    "   ;883e
         dta d "    ########################    "
         dta d "    ########################    "
         dta d "    ########################    "
kom      dta d "                                        "  ;88be
rzc_wid  dta d "                                        "  ;88e6


ekr_cz   dta d " city dangerous "
t1_cz    dta d "                                "  ;$891e
         dta d "                                "
t2_cz    dta d "                                "
         dta d "                                "

;!source "ekr_mapping.asm"
tc1      dta d "         PROGRAMOWANIE          "
         dta d "             MUZYKA             "
         dta d "       GRAFIKA PRZED GRa        "
         dta d "         GRAFIKA DO GRY         "
         dta d "       SCENARIUSZ I MAPA        "
         dta d "           PRODUKCJA            "
         dta d "          WROClAW 1994          "

tc2  dta d "         KAMIL NOWInSKI         "
     dta d "         KONRAD  GMUREK         "
     dta d "        HUBERT  NOWInSKI        "
     dta d "         KAMIL NOWInSKI         "
     dta d "     KAMIL, HUBERT NOWInSCY     "
     dta d "      MIRAGE SOFTWARE LTD.      "
     dta d "                                "
     dta d "                                "
     dta d "                                "


mi_t .he 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6C 6D 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 6E 
     .he 41 41 41 41 41 41 41 41 41 41 42 43 44 45 46 46 47 48 49 4A 4B 4C 4D 4E 4F 50 51 52 53 54 41 41 41 41 41 41 41 41 41 41 
     .he 55 55 55 55 55 55 55 55 56 57 58 59 5A 5B 5B 5C 5D 5E 5F 60 61 62 63 64 65 66 67 68 69 69 69 6A 6B 55 55 55 55 55 55 55 

     ;!CONVTAB raw
     ;!CT '-',$0D
grat1    dta d "---gratulacje---"     ;8c16
    ;!source "ekr_mapping.asm"
    
grat2    dta d "    WYDOSTAlEs SIe Z MIASTA,    "
         dta d "      W KToRYM ZABlaDZIlEs      "
         dta d "    I WYJEzDZAJaC Z BOCZNEJ     "
         dta d "   ULICZKI PROWADZaCEJ PRZEZ    "
         dta d "    MROCZNY LAS - UDAlEs SIe    "
         dta d "       WRESZCIE DO DOMU .       "
         dta d "      JUz WSZYSTKIE TWOJE       "
         dta d "    KlOPOTY MINelY, LECZ NIE    "
         dta d "     WIADOMO CO SIe JESZCZE     "
         dta d "        MOzE ZDARZYc ...        "

tabzw    .he 01 1c 02 1f 03 1d 04 1e 00 ;8d66

     icl "data_car.asm"

;mapa gry     A  B  C  D  E  F  G  H  I  J  K  L  M  N     ;8e6f

map  .he 00 00 00 00 00 00 80 00 00 00 00 00 00 00 00 00
     .he 00 00 33 32 00 00 39 00 00 00 16 17 18 00 1C 00  ;1
     .he 00 00 00 31 30 00 38 00 25 24 15 00 19 1A 1B 00  ;2
     .he 00 00 00 2B 2A 29 28 27 26 00 14 00 00 1D 00 00  ;3
     .he 00 00 36 2C 2D 2E 00 00 00 00 13 37 00 1E 1F 00  ;4
     .he 00 00 35 34 00 2F 00 05 04 03 12 00 00 00 20 00  ;5
     .he 00 00 00 3A 00 00 00 00 0B 02 01 0C 0D 00 21 00  ;6 
     .he 00 3D 3C 3B 41 42 43 00 0A 00 06 00 0E 00 22 00  ;7 
     .he 00 3E 3F 00 00 44 00 00 09 08 07 00 0F 00 23 00  ;8
     .he 00 00 40 00 45 46 47 00 00 00 00 00 10 11 00 00  ;9
     .he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

cpn  .he 2B 2C 4B 4C 6B 6C ;$8F1F
kod  .he 05 3f 25 0d 00 08 3e 9b 

     icl "data_scenario.asm"


;data_end

