
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
