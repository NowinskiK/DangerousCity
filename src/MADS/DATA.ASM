
dl_gra   ;equ *
     dta $70,$70
     dta $42,a(pasek)
     dta $42,a(ekr)
     :14 dta $02
     dta $80,$0f,$02,$20
     dta $4f,a(linijka)
     dta $42,a(rzeczy_w)
     .he 02 02 02 f0
     .he 02 20 02
     dta $41,a(dl_gra)

pasek       .he 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00
ekr  :14    .he 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00
            .he 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00
         
linijka     .he 00 00 00 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 00 00 00 00
plname      .he 00 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00 00
rzeczy_w :4 .he 00 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00 00

kom      :40 dta d " "
rzc_wid  :40 dta d " "

ekr_over dta d "   koniec gry   "



PLI_Z    EQU $5A

leg_t    ;equ *
     dta d'                                        '
     dta d'  NARESZCIE !  PO TAK DUGIEJ PRACY NAD '
     dta d' ZDJCIAMI  DO  TWOJEGO  NOWEGO FILMU - '
     dta d' NALE',b(PLI_Z),d'Y  CI  SI  PORZDNY  ODPOCZYNEK. '
     dta d' DLATEGO  WRACASZ  TERAZ  SAMOCHODEM DO '
     dta d' SWOJEGO DOMU,  GDZIE MIESZKASZ WRAZ ZE '
     dta d' SWOJ LICZN RODZIN.                  '
     dta d'                                        '

     dta d'  BYA TO BARDZO DUGA I MCZCA PODR',b(PLI_Z),d' '
     dta d' ALE JU',b(PLI_Z),d' NIEDALEKO DO CHATY.            '
     dta d' - O KURCZE ! -  WRZASNE SAM DO SIE- '
     dta d' BIE.  WJECHAE W JAK BOCZN ULICZK '
     dta d' I NIE ZNASZ WACIWEJ DROGI POWROTNEJ. '
     dta d' OKAZAO SI, ',b(PLI_Z),d'E ZNALAZE SI W JAKIM '
     dta d' TAJEMNICZYM  MIECIE,   GDZIE  NIE  MA '
     dta d' LUDZI I WYJCIA !!!                    '

     dta d'  PENETRUJC TEREN, WIDZIAE PO DRODZE '
     dta d' JAKIE  PRZEDMIOTY,  ALE NIE ZNASZ ICH '
     dta d' PRZEZNACZENIA.  I  TU  ROZPOCZYNA  SI '
     dta d' TWOJA  MISJA.  JE',b(PLI_Z),d'DZC PO TYM MIECIE, '
     dta d' MUSISZ BRA PRZEDMIOTY  I  U',b(PLI_Z),d'YWA  ICH '
     dta d' GDZIE TRZEBA.  ROBIC TAK -  OTWORZYSZ '
     dta d' BRAM  PROWADZC  DO  WYJCIA  Z TEGO '
     dta d' PRZEKLTEGO MIASTA.                    '

     dta d'                                        '
     dta d' DOSTPNE KLAWISZE :                    '
     dta d'                                        '


     dta d " "
     .he d9 91 59 0d d9 94 59
     dta d '  U',b(PLI_Z),d'YWANIE PRZEDMIOTW            '
     .he D9 A5 B3 A3 59 00 00 00 2B 2F 2E 29 25 23 00 27
     .he 32 39 00 00 00 00 00 00 00 00 00 00 00 00 00 00
     .he 00 00 00 00 00 00 00 D9 B3 A8 A9 A6 B4 59 00    
     dta d " WCZENIE / WYCZENIE MUZYKI          "
     dta d "                                        "
     dta d "                               "
     


ekr_cz   dta d " city dangerous "
t1_cz    :64 dta d " "
t2_cz    :64 dta d " "

tc1  dta d '         PROGRAMOWANIE          '
     dta d '             MUZYKA             '
     dta d '       GRAFIKA PRZED GR        '
     dta d '         GRAFIKA DO GRY         '
     dta d '       SCENARIUSZ I MAPA        '
     dta d '      ORYGINALNA PRODUKCJA      '
     dta d '        REMAKE I WYDANIE        '
     dta d '  SPECJALNE PODZIKOWANIA DLA:  '

tc2  dta d "         KAMIL NOWISKI         "
     dta d "         KONRAD  GMUREK         "
     dta d "    KRZYSZTOF 'KAZ' ZIEMBIK     "
     dta d "         KAMIL NOWISKI         "
     dta d "     KAMIL, HUBERT NOWISCY     "
     dta d "          WROCAW 1994          "
     dta d "           PTODT 2023           "
     dta d "              PEBE              "

     dta d "                                "
     dta d "                                "

grat1    dta d "---gratulacje---"
    
grat2    dta d'    WYDOSTAE SI Z MIASTA,    '
         dta d'      W KTRYM ZABDZIE      '
         dta d'    I WYJE',b(PLI_Z),d'DZAJC Z BOCZNEJ     '
         dta d'   ULICZKI PROWADZCEJ PRZEZ    '
         dta d'    MROCZNY LAS - UDAE SI    '
         dta d'       WRESZCIE DO DOMU .       '
         dta d'      JU',b(PLI_Z),d' WSZYSTKIE TWOJE       '
         dta d'    KOPOTY MINY, LECZ NIE    '
         dta d'     WIADOMO CO SI JESZCZE     '
         dta d'        MO',b(PLI_Z),d'E ZDARZY ...        '

tabzw    .he 01 1c 02 1f 03 1d 04 1e 00

     icl "data_car.asm"

;mapa gry   A  B  C  D  E  F  G  H  I  J  K  L  M  N

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

cpn  .he 2B 2C 4B 4C 6B 6C
kod  .he 05 3f 25 0d 00 08 3e 
kodend dta CR 

     icl "data_scenario.asm"


