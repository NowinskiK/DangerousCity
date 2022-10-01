
; Ten plik jest w tej chwili bezuzyteczny
; Czesc tekstow nie kompiluje sie na wlasciwe bajty ATASCII
; co powoduje, ze wiekszosc rzeczy w grze nie wyswietla sie prawidlowo.

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
         !byte $4e,<rys,>rys
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
     !text ""
     !byte $80,$0f,2
     !byte $20,$4f
     !word linijka
     !byte $42
     !word rzeczy_w
     !text "",$f0
     !byte 2,$20,2
     !byte $41,<dl,>dl


leg_t    ;equ *
     !PET "                                        "
     !PET "  NARESZCIE !  PO TAK DLUGIEJ PRACY NAD "
     !PET " ZDJECIAMI  DO  TWOJEGO  NOWEGO FILMU - "
     !text " NALEZY  CI  SIE  PORZADNY  ODPOCZYNEK. "
     !text " DLATEGO  WRACASZ  TERAZ  SAMOCHODEM DO "
     !text " SWOJEGO DOMU,  GDZIE MIESZKASZ WRAZ ZE "
     !text " SWOJA LICZNA RODZINA.                  "
     !text "                                        "

     !text "  BYLA TO BARDZO DLUGA I MECZACA PODRZ "
     !text " ALE JUZ NIEDALEKO DO CHATY.            "
     !text " - O KURCZE ! -  WRZASNALES SAM DO SIE- "
     !text " BIE.  WJECHALES W JAKAS BOCZNA ULICZKE "
     !text " I NIE ZNASZ WLASCIWEJ DROGI POWROTNEJ. "
     !text " OKAZALO SIE, ZE ZNALAZLES SIE W JAKIMS "
     !text " TAJEMNICZYM  MIESCIE,   GDZIE  NIE  MA "
     !text " LUDZI I WYJSCIA !!!                    "

     !text "  PENETRUJAC TEREN, WIDZIALES PO DRODZE "
     !text " JAKIES  PRZEDMIOTY,  ALE NIE ZNASZ ICH "
     !text " PRZEZNACZENIA.  I  TU  ROZPOCZYNA  SIE "
     !text " TWOJA  MISJA.  JEZDZAC PO TYM MIESCIE, "
     !text " MUSISZ BRAC PRZEDMIOTY  I  UZYWAC  ICH "
     !text " GDZIE TRZEBA.  ROBIAC TAK -  OTWORZYSZ "
     !text " BRAME  PROWADZACA  DO  WYJSCIA  Z TEGO "
     !text " PRZEKLETEGO MIASTA.                    "

     !text "                                        "
     !text " DOSTEPNE KLAWISZE :                    "
     !text "                                        "
     !text " "

;

;  UZYWANIE PRZEDMIOTOW
     !byte 0



;   KONIEC GRY
     !byte 0 



;  WLACZENIE / WYLACZENIE MUZYKI '
     !text "                                        "
     !text "                                        "
     !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     !byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
     !byte 0,0,0,0,0,0,0,0,0,0,0,0

ekr_over !text "   koniec gry   "    ;85ee

pasek    !text "                                "
;861e
ekr      !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
         !text "                              "
linijka  !text "                                "     ;87fe
plname   !text "                                "   ;881e
rzeczy_w !text "                                "   ;883e
         !text "                                "
         !text "                                "
         !text "                                "
kom      !text "                                        "  ;88be
rzc_wid  !text "                                        "  ;88e6


ekr_cz   !text " dangerous city "
t1_cz    !text "                                "  ;$891e
         !text "                                "
t2_cz    !text "                                "
         !text "                                "

tc1      !text "         PROGRAMOWANIE          "
         !text "             MUZYKA             "
         !text "       GRAFIKA PRZED GRA        "
         !text "         GRAFIKA DO GRY         "
         !text "       SCENARIUSZ I MAPA        "
         !text "           PRODUKCJA            "
         !text "          WROCLAW 1994          "

tc2  !text "        KAMIL  NOWINSKI         "
     !text "         KONRAD  GMUREK         "
     !text "        HUBERT NOWINSKI         "
     !text "        KAMIL NOWINSKI          "
     !text "    KAMIL,  HUBERT NOWINSCY     "
     !text "      MIRAGE SOFTWARE LTD.      "
     !text "                                "
     !text "                                "
     !text "                                "


mi_t !text "           ABCDEFGHI   JK               "
     !text "           LMNOP QRSTUVWXYZ[            "
     !text "           \]^_`abcdefghijkl            "

grat1    !text "---gratulacje---"     ;8c16
grat2    !text "    WYDOSTALES SIE Z MIASTA,    "
         !text "      W KTORYM ZABLADZILES      "
         !text "    I WYJEZDZAJAC Z BOCZNEJ     "
         !text "   ULICZKI PROWADZACEJ PRZEZ    "
         !text "    MROCZNY LAS - UDALES SIE    "
         !text "       WRESZCIE DO DOMU .       "
         !text "      JUZ WSZYSTKIE TWOJE       "
         !text "    KLOPOTY MINELY, LECZ NIE    "
         !text "     WIADOMO CO SIE JESZCZE     "
         !text "        MOZE ZDARZYC ...        "



tabzw    !text "         "  ;8d66

lewf    ; equ ;*   8d6f
     !byte %00000000 ;*0
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %01100111
     !byte %11011011
     !byte %11011011
     !byte %11011011
     !byte %11011011
     !byte %01100111
     !byte %00000000

     !byte %00000000 ;*1
     !byte %00000000
     !byte %00000001
     !byte %00000001
     !byte %00000001
     !byte %00000001
     !byte %00000000
     !byte %00000000
     !byte %00000000 ;*
     !byte %11001110
     !byte %10110110
     !byte %10110110
     !byte %10110110
     !byte %10110110
     !byte %11001110
     !byte %00000000

     !byte %00000000 ;*2
     !byte %00000001
     !byte %00000011
     !byte %00000011
     !byte %00000011
     !byte %00000011
     !byte %00000001
     !byte %00000000
     !byte %00000000 ;*
     !byte %10011100
     !byte %01101100
     !byte %01101100
     !byte %01101100
     !byte %01101100
     !byte %10011100
     !byte %00000000

     !byte %00000000 ;*3
     !byte %00000011
     !byte %00000110
     !byte %00000110
     !byte %00000110
     !byte %00000110
     !byte %00000011
     !byte %00000000
     !byte %00000000 ;*
     !byte %00111000
     !byte %11011000
     !byte %11011000
     !byte %11011000
     !byte %11011000
     !byte %00111000
     !byte %00000000

     !byte %00000000 ;*4
     !byte %00000110
     !byte %00001101
     !byte %00001101
     !byte %00001101
     !byte %00001101
     !byte %00000110
     !byte %00000000
     !byte %00000000 ;*
     !byte %01110000
     !byte %10110000
     !byte %10110000
     !byte %10110000
     !byte %10110000
     !byte %01110000
     !byte %00000000

     !byte %00000000 ;*5
     !byte %00001100
     !byte %00011011
     !byte %00011011
     !byte %00011011
     !byte %00011011
     !byte %00001100
     !byte %00000000
     !byte %00000000 ;*
     !byte %11100000
     !byte %01100000
     !byte %01100000
     !byte %01100000
     !byte %01100000
     !byte %11100000
     !byte %00000000

     !byte %00000000 ;*6
     !byte %00011001
     !byte %00110110
     !byte %00110110
     !byte %00110110
     !byte %00110110
     !byte %00011001
     !byte %00000000
     !byte %00000000 ;*
     !byte %11000000
     !byte %11000000
     !byte %11000000
     !byte %11000000
     !byte %11000000
     !byte %11000000
     !byte %00000000

     !byte %00000000 ;*7
     !byte %00110011
     !byte %01101101
     !byte %01101101
     !byte %01101101
     !byte %01101101
     !byte %00110011
     !byte %00000000
     !byte %00000000 ;*
     !byte %10000000
     !byte %10000000
     !byte %10000000
     !byte %10000000
     !byte %10000000
     !byte %10000000
     !byte %00000000


prawf    ;equ ;*  8def

     !byte %00000000 ;*0
     !byte %11100110
     !byte %11011011
     !byte %11011011
     !byte %11011011
     !byte %11011011
     !byte %11100110
     !byte %00000000
     !byte %00000000 ;*
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000
     !byte %00000000

     !byte %00000000 ;*1
     !byte %01110011
     !byte %01101101
     !byte %01101101
     !byte %01101101
     !byte %01101101
     !byte %01110011
     !byte %00000000
     !byte %00000000 ;*
     !byte %00000000
     !byte %10000000
     !byte %10000000
     !byte %10000000
     !byte %10000000
     !byte %00000000
     !byte %00000000

     !byte %00000000 ;*2
     !byte %00111001
     !byte %00110110
     !byte %00110110
     !byte %00110110
     !byte %00110110
     !byte %00111001
     !byte %00000000
     !byte %00000000 ;*
     !byte %10000000
     !byte %11000000
     !byte %11000000
     !byte %11000000
     !byte %11000000
     !byte %10000000
     !byte %00000000

     !byte %00000000 ;*3
     !byte %00011100
     !byte %00011011
     !byte %00011011
     !byte %00011011
     !byte %00011011
     !byte %00011100
     !byte %00000000
     !byte %00000000 ;*
     !byte %11000000
     !byte %01100000
     !byte %01100000
     !byte %01100000
     !byte %01100000
     !byte %11000000
     !byte %00000000

     !byte %00000000 ;*4
     !byte %00001110
     !byte %00001101
     !byte %00001101
     !byte %00001101
     !byte %00001101
     !byte %00001110
     !byte %00000000
     !byte %00000000 ;*
     !byte %01100000
     !byte %10110000
     !byte %10110000
     !byte %10110000
     !byte %10110000
     !byte %01100000
     !byte %00000000

     !byte %00000000 ;*5
     !byte %00000111
     !byte %00000110
     !byte %00000110
     !byte %00000110
     !byte %00000110
     !byte %00000111
     !byte %00000000
     !byte %00000000 ;*
     !byte %00110000
     !byte %11011000
     !byte %11011000
     !byte %11011000
     !byte %11011000
     !byte %00110000
     !byte %00000000

     !byte %00000000 ;*6
     !byte %00000011
     !byte %00000011
     !byte %00000011
     !byte %00000011
     !byte %00000011
     !byte %00000011
     !byte %00000000
     !byte %00000000 ;*
     !byte %10011000
     !byte %01101100
     !byte %01101100
     !byte %01101100
     !byte %01101100
     !byte %10011000
     !byte %00000000

     !byte %00000000 ;*7
     !byte %00000001
     !byte %00000001
     !byte %00000001
     !byte %00000001
     !byte %00000001
     !byte %00000001
     !byte %00000000
     !byte %00000000 ;*
     !byte %11001100
     !byte %10110110
     !byte %10110110
     !byte %10110110
     !byte %10110110
     !byte %11001100
     !byte %00000000

; mapa gry  ABCDEFGHIJKLMN     ;8e6f

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

     !text "CENTRUM "      ;*1
     !text " "
     !text " "
     !text " "
     !text "BANK "
     !text " "
     !text " "
     !text "STACJA PALIW "
     !text " "
     !text " "      ;*10
     !text "GOSPODARSTWO WIEJSKIE "
     !text " "
     !text " "
     !text "PRZEDSZKOLE "
     !text " "
     !text "BAR "
     !text "GRANICA MIASTA "
     !text " "
     !text "PARKING POGOTOWIA "
     !text " "      ;*20
     !text " "
     !text "OGRODKI DZIALKOWE "
     !text "OGRODKI DZIALKOWE "
     !text "OGRODKI DZIALKOWE "
     !text " "
     !text " "
     !text "CIEMNA ULICZKA "
     !text "STACJA PALIW "
     !text "PARK "
     !text "PARK "      ;*30
     !text "PARK "
     !text "PARK "
     !text " "
     !text "STACJA PALIW "
     !text "GRANICA MIASTA "
     !text " "
     !text "STACJA PALIW "
     !text " "
     !text " "
     !text "DOMEK "      ;*40
     !text "RONDO "
     !text "RONDO "
     !text "RONDO "
     !text "RONDO "
     !text "RONDO "
     !text "RONDO "
     !text "SLEPA ULICZKA "
     !text " "
     !text " "
     !text " "      ;*50
     !text "GRANICA MIASTA "
     !text " "
     !text " "
     !text "SUPER MARKET "
     !text " "
     !text " "
     !text "GRANICA MIASTA "
     !text " "
     !text " "
     !text " "      ;*60
     !text " "
     !text " "
     !text " "
     !text "SKLEP Z PUKAWKAMI "
     !text " "
     !text " "
     !text "STACJA PALIW "
     !text "ELEKTROWNIA NIEJADROWA "
     !text "ELEKTROWNIA NIEJADROWA "
     !text "ELEKTROWNIA NIEJADROWA "      ;*70
     !text "ELEKTROWNIA NIEJADROWA "

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


t1   !text "Sejf "
t2   !text "Pusty sejf "
t3   !text "Murek "
t4   !text "Studnia "
t5   !text "Piaskownica "
t6   !text "Sprzedawca w sklepie "
t7   !text "Nienasmarowana brama "
t8   !text "Ogrodzenie "
t9   !text "Goracy asfalt "
t10  !text "Dziura w murze "
t11  !text "Wystajace gwodzie "
t12  !text "Drzwi do domu "
t13  !text "Otwarty dom "
t14  !text "Obezwladniony sprzedawca "
t15  !text "Straznik "
t16  !text "Dziura w plocie "
t17  !text "Otruty straznik "
t20  !text " "

zrob !text "                    "
     !text "                    "
     !text "                    "
     !text "            "

plrzc !text "                    "
      !text "                    "
      !text "                    "
      !text "           "

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

     !text "SZMAL "
     !text "PIWO "
     !text "KLUCZ "
     !text "CYJANEK "
     !text "OTWIERACZ "
     !text "OTWARTE PIWO "
     !text "ZATRUTE PIWO "
     !text "BATERIA "
     !text "ZAROWECZKA "
     !text "LATARKA "
     !text "KOMPLETNA LATARKA "
     !text "SMAR "
     !text "SLUCHAWKI LEKARSKIE "
     !text "DETONATOR "
     !text "SEKATOR "
     !text "LOPATA "
     !text "DESKI "
     !text "GAZ LZAWIaCY "
     !text "DYNAMIT "
     !text "WIADRO WODY "
     !text "KIJ "
     !text "TASMA KLEJACA "
     !text "KINESKOP "
     !text "BUTELKA "
     !text "OPONA "
     !text "DETKA "
     !text "KSIAZKA "
     !text "BUDZIK "
     !text "KARABIN "
     !text "LATARKA Z ZAROWKA "
     !text "LATARKA Z BATERIA "


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



tt1  !text "Kupiles piwo."
     !hex  00
tt2  !text "W domu znalazles cyjanek."   ;94d7
     !hex  00
tt3  !text "Otworzyles piwo."
     !hex  00
tt4  !text "Dosypales cyjanku do piwa."
     !hex  00
tt5  !text "Wlozyles baterie do latarki."
     !hex  00
tt6  !text "Wkreciles zarowke do latarki."
     !hex  00
tt7  !text "Nasmarowales brame."
     !hex  00
tt8  !text "Otworzyles sejf i znalazles detonator."
     !hex  00
tt9  !text "Przeciales ogrodzenie."
     !hex  00
tt10 !text "Wykopales deski."
     !hex  00
tt11 !text "Polozyles deski na gwozdziach."
     !hex  00
tt12 !text "Obezwladniles sprzedawce i okradles go."
     !hex  00
tt13 !text "Wysadziles mur."
     !hex  00
tt14 !text "Ostudziles goracy asfalt."
     !hex  00
tt15 !text "Wcisnales ukryty w murze przycisk."
     !hex  00
tt16 !text "Otrules straznika."
     !hex  00


