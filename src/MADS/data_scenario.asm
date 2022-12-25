EOL    EQU 0
PL_Z    EQU $1A
PL_O    EQU $0F
PL_L    EQU $0C

namepl_t ;equ *
     dta c "CENTRUM",0      ;*1
     dta 0
     dta 0
     dta 0
     dta c "BANK",0
     dta 0
     dta 0
     dta c "STACJA PALIW",0
     dta 0
     dta 0      ;*10
     dta c "GOSPODARSTWO WIEJSKIE",0
     dta 0
     dta 0
     dta c "PRZEDSZKOLE",0
     dta 0
     dta c "BAR",0
     dta c "GRANICA MIASTA",0
     dta 0
     dta c "PARKING POGOTOWIA",0
     dta 0      ;*20
     dta 0
     dta c "OGR",b(PL_O),c"DKI DZIA",b(PL_L),c"KOWE",0
     dta c "OGR",b(PL_O),c"DKI DZIA",b(PL_L),c"KOWE",0
     dta c "OGR",b(PL_O),c"DKI DZIA",b(PL_L),c"KOWE",0
     dta 0
     dta 0
     dta c "CIEMNA ULICZKA",0
     dta c "STACJA PALIW",0
     dta c "PARK",0
     dta c "PARK",0      ;*30
     dta c "PARK",0
     dta c "PARK",0
     dta 0
     dta c "STACJA PALIW",0
     dta c "GRANICA MIASTA",0
     dta 0
     dta c "STACJA PALIW",0
     dta 0
     dta 0
     dta c "DOMEK",0      ;*40
     dta c "RONDO",0
     dta c "RONDO",0
     dta c "RONDO",0
     dta c "RONDO",0
     dta c "RONDO",0
     dta c "RONDO",0
     dta c "LEPA ULICZKA",0
     dta 0
     dta 0
     dta 0      ;*50
     dta c "GRANICA MIASTA",0
     dta 0
     dta 0
     dta c "SUPER MARKET",0
     dta 0
     dta 0
     dta c "GRANICA MIASTA",0
     dta 0
     dta 0
     dta 0      ;*60
     dta 0
     dta 0
     dta 0
     dta c "SKLEP Z PUKAWKAMI",0
     dta 0
     dta 0
     dta c "STACJA PALIW",0
     dta c "ELEKTROWNIA NIEJDROWA",0
     dta c "ELEKTROWNIA NIEJDROWA",0
     dta c "ELEKTROWNIA NIEJDROWA",0      ;*70
     dta c "ELEKTROWNIA NIEJDROWA",0

tu_tab   ;equ *

     dta 5,1,2
     dta 10,3,20
     dta 11,4,4
     dta 14,5,5
     dta 16,6,6
     dta 19,7,20
     dta 22,8,16
     dta 56,9,20
     dta 57,10,10
     dta 50,11,20
     dta 40,12,13
     dta 64,6,14
     dta 23,8,8
     dta 68,15,17
     dta 0

adt_tab  ;equ *

     dta a(t1)
     dta a(t2)
     dta a(t3)
     dta a(t4)
     dta a(t5)
     dta a(t6)
     dta a(t7)
     dta a(t8)
     dta a(t9)
     dta a(t10)
     dta a(t11)
     dta a(t12)
     dta a(t13)
     dta a(t14)
     dta a(t15)
     dta a(t16)
     dta a(t17)
     dta a(t20)
     dta a(t20)
     dta a(t20)

     ;!CONVTAB raw
     ;!CT '{',$7B, '$',$02, '!',$04, '%',$16
t1   dta c "Sejf",0
t2   dta c "Pusty sejf",0
t3   dta c "Murek",0
t4   dta c "Studnia",0
t5   dta c "Piaskownica",0
t6   dta c "Sprzedawca w sklepie",0
t7   dta c "Nienasmarowana brama",0
t8   dta c "Ogrodzenie",0
t9   dta c 'Gorcy asfalt', b(EOL)
t10  dta c 'Dziura w murze', b(EOL)
t11  dta c 'Wystajce gwodzie', b(EOL)
t12  dta c "Drzwi do domu",0
t13  dta c "Otwarty dom",0
t14  dta c "Obezw{adniony sprzedawca",0
t15  dta c "Stranik",0
t16  dta c "Dziura w p{ocie",0
t17  dta c "Otruty stranik",0
t20  dta 0

zrob  :72 dta $00

plrzc :71 dta $00 

plrzc_z  ;equ ;*

     dta 0     ;*1
     dta 9
     dta 0
     dta 0
     dta 0
     dta 0
     dta 0
     dta 0
     dta 23
     dta 0     ;*10
     dta 20
     dta 0
     dta 0
     dta 0
     dta 25
     dta 0
     dta 0
     dta 0
     dta 0
     dta 0     ;*20
     dta 0
     dta 16
     dta 0
     dta 15
     dta 0
     dta 0
     dta 0
     dta 12
     dta 0
     dta 21     ;*30
     dta 0
     dta 0
     dta 3
     dta 0
     dta 0
     dta 0
     dta 26
     dta 0
     dta 0
     dta 0     ;*40
     dta 0
     dta 22
     dta 0
     dta 0
     dta 0
     dta 0
     dta 10
     dta 0
     dta 27
     dta 0     ;*50
     dta 18
     dta 0
     dta 5
     dta 1
     dta 13
     dta 0
     dta 0
     dta 0
     dta 29
     dta 0     ;*60
     dta 0
     dta 24
     dta 0
     dta 0
     dta 0
     dta 0
     dta 28
     dta 0
     dta 8
     dta 0     ;*70
     dta 0

rzc  dta 22,11  ;*1
     dta 0,0
     dta 12,7
     dta 0,0
     dta 2,7
     dta 0,0
     dta 0,0
     dta 6,1
     dta 19,7
     dta 12,10  ;*10
     dta 0,0
     dta 1,3
     dta 20,11
     dta 0,0
     dta 14,1
     dta 10,6
     dta 0,0
     dta 10,11
     dta 0,0
     dta 2,4  ;*20
     dta 2,6
     dta 7,1
     dta 14,4
     dta 1,12
     dta 21,7
     dta 1,12
     dta 6,6
     dta 14,10
     dta 5,8
     dta 0,0  ;*30
     dta 0,0

rzc_nam  ;equ *
     dta c'SZMAL', b(EOL)
     dta c'PIWO', b(EOL)
     dta c'KLUCZ', b(EOL)
     dta c'CYJANEK', b(EOL)
     dta c'OTWIERACZ', b(EOL)
     dta c'OTWARTE PIWO', b(EOL)
     dta c'ZATRUTE PIWO', b(EOL)
     dta c'BATERIA', b(EOL)
     dta b(PL_Z),c'AR',b(PL_O),'WECZKA', b(EOL)
     dta c'LATARKA', b(EOL)
     dta c'KOMPLETNA LATARKA', b(EOL)
     dta c'SMAR', b(EOL)
     dta c'SUCHAWKI LEKARSKIE', b(EOL)
     dta c'DETONATOR', b(EOL)
     dta c'SEKATOR', b(EOL)
     dta c'OPATA', b(EOL)
     dta c'DESKI', b(EOL)
     dta c'GAZ ZAWICY', b(EOL)
     dta c'DYNAMIT', b(EOL)
     dta c'WIADRO WODY', b(EOL)
     dta c'KIJ', b(EOL)
     dta c'TAMA KLEJCA', b(EOL)
     dta c'KINESKOP', b(EOL)
     dta c'BUTELKA', b(EOL)
     dta c'OPONA', b(EOL)
     dta c'DTKA', b(EOL)
     dta c'KSI',b(PL_Z),'KA', b(EOL)
     dta c'BUDZIK', b(EOL)
     dta c'KARABIN', b(EOL)
     dta c'LATARKA Z ',b(PL_Z),'AR',b(PL_O),'WK', b(EOL)
     dta c'LATARKA Z BATERI', b(EOL)


lit_t    ;equ *
     dta (0),(0),(0),(0)

     dta (2),(4),(4),(6)
     dta (6),(8),(8),(10)
     dta (10),(8),(8),(6)
     dta (6),(4),(4),(2)


tlo_t    ;equ *
     dta (2)
     dta (4)
     dta (4)
     dta (6)
     dta (6)
     dta (8)
     dta (8)
     dta (10)
     dta (10)
     dta (10)
     dta (12)
     dta (12)

     dta (12)
     dta (12)
     dta (10)
     dta (10)
     dta (10)
     dta (8)
     dta (8)
     dta (6)
     dta (6)
     dta (4)
     dta (4)
     dta (2)


tt1  dta c'Kupi{e piwo.', b(EOL)
tt2  dta c'W domu znalaz{e cyjanek.', b(EOL)
tt3  dta c'Otworzy{e piwo.', b(EOL)
tt4  dta c'Dosypa{e cyjanku do piwa.', b(EOL)
tt5  dta c'W{oy{e bateri do latarki.', b(EOL)
tt6  dta c'Wkrci{e arwk do latarki.', b(EOL)
tt7  dta c'Nasmarowa{e bram.', b(EOL)
tt8  dta c'Otworzy{e sejf i znalaz{e detonator.', b(EOL)
tt9  dta c'Przeci{e ogrodzenie.', b(EOL)
tt10 dta c'Wykopa{e deski.', b(EOL)
tt11 dta c'Po{oy{e deski na gwodziach.', b(EOL)
tt12 dta c'Obezw{adni{e sprzedawc i okrad{e go.', b(EOL)
tt13 dta c'Wysadzi{e mur.', b(EOL)
tt14 dta c'Ostudzi{e gorcy asfalt.', b(EOL)
tt15 dta c'Wcisn{e ukryty w murze przycisk.', b(EOL)
tt16 dta c'Otru{e stranika.',b(EOL)
