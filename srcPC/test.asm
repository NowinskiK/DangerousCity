!To "Test.xex", plain 

* = $1000

 ; Naglowek pliku xex
!BYTE 0xFF, 0xFF     ; 00 - 01 $FFFF - Stala Wartosc oznaczajaca, ze to jest program
;!word rys
;!word Rys2-Rys1+rys

rys      = $1000

;Rys1
!BINARY "RYS",,2
!BINARY "MUSIC.REP",,2
!BINARY "music\CZOLO.CMC",,2
!BINARY "music\GRA.CMC",,2
!BINARY "music\GAMEOVER.CMC",,2
!BINARY "music\WIN.CMC",,2
;Rys2

;[ #1 RYS  CZOLO.CMC GRA.CMC GAMEOVER.CMC WIN.CMC 
;PL  A.FNT B.FNT DC.OBJ             




