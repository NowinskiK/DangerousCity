
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

zrob  :72 dta $00

plrzc :71 dta $00 

plrzc_z  equ *
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

char1     dta d '1.'*

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
