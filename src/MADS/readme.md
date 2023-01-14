# Dangerous City 2023


http://atariki.krap.pl/index.php/Player/Missile_Graphics
https://g2f.atari8.info/edit_colors.png
http://atariki.krap.pl/index.php/Rejestry_GTIA#SIZEP0
http://atariki.krap.pl/index.php/ATASCII

# Assembler 6502




## Old compilation
`File: .\src\MADS\!main.xex  (Len=38078)`
Block #0: 1000-3CFC | Index = 0000 | Len = 6+11517
Block #1: 4000-7FFF | Index = 2D03 | Len = 4+16384
Block #2: A000-B12A | Index = 6D07 | Len = 4+4395
Block #3: 8000-9661 | Index = 7E36 | Len = 4+5730
Block #4: 0500-0517 | Index = 949C | Len = 4+24
Block #5: 02E0-02E1 | Index = 94B8 | Len = 4+2

22 1000-3CFC> AA AA +           ins "plansze\rys",6               --- to be removed
23 1A40 4C 9A 21 4C A3 1A +     ins "plansze\music.rep",6
24 2202 A0 E3 ED E3 A0 E4 +     ins "muzyka\czolo.cmc",6
25 2887 A0 E3 ED E3 A0 E4 +     ins "muzyka\gra.cmc",6
26 31FD A0 E3 ED E3 A0 E4 +     ins "muzyka\gameover.cmc",6
27 37BD A0 E3 ED E3 A0 E4 +     ins "muzyka\win.cmc",6

30 4000-7FFF> E7 07 7C 80 +     ins "plansze\pl",6
31 7400 00 00 00 00 00 00 +     ins "fonty\mirage.fnt",6       ---to be removed
32 7800 00 00 00 00 00 00 +     ins "fonty\a.fnt",6
33 7C00 00 00 00 00 00 00 +     ins "fonty\b.fnt",6

   8000-9661                    data + scenario
   A000-B12A                    icl "DC.asm"


mva #$40 nmien		;only NMI interrupts, DLI disabled

http://atariki.krap.pl/index.php/NMI
http://atariki.krap.pl/index.php/Rejestry_ANTIC-a#NMIEN

http://atariki.krap.pl/index.php/ANTIC_Display_List

## New gfx
Block #0: 2000-23C2 | Index = 0000 | Len = 6+963    kod + TYT10_PTODT4.scr
Block #1: 2400-2FFF | Index = 03C9 | Len = 4+3072    "TYT10_PTODT4.fnt"
Block #2: 3300-33FF | Index = 0FCD | Len = 4+256    SPRITES  (3300-37ff)
Block #3: 3500-3AD8 | Index = 10D1 | Len = 4+1497   kod (3800-)
Block #4: 02E0-02E1 | Index = 16AE | Len = 4+2

https://atarionline.pl/biblioteka/materialy_ksiazkowe/Podstawowe_procedury_systemu_operacyjnego.pdf
https://tajemnice.atari8.info/ksiazki/ppso/dodatki.html
## Adresy procedur OS
$5000 - TESTST - początek testu komputera
$5003 - TESTINI - inicjowanie testu komputera
$BDA7 - SIN - sinus liczby FP
$BDB1 - COS - cosinus liczby FP
$BE77 - ATAN - arcus tangens liczby FP
$BEE5 - SQR - pierwiastek kwadratowy z liczby FP
$C000 - CHSRO1 - suma kontrolna pierwszej części ROM
$C00C - NMIENBL - inicjowanie przerwań MNI
$C018 - NMIFIRST - rozpoznanie przerwania NMI
$C02C - JMPIRQV - skok według wektora VIMIRQ
$C030 - SINDRYI - rozpoznanie przerwania IRQ
$C092 - BREAKIRQ - przerwanie klawisza BREAK
$C0CD - PLARTI - powrót z przerwania
$C0CE - RTI - powrót z przerwania
$C0CF - MASKTAB - tabela masek bitowych dla SINDRYI
$C0D7 - VECTAB - tabela wektorów przerwań dla SINDRYI
$C0DF - WAIT - oczekiwanie na RESET
$C0E2 - SYSVBL - systemowe przerwanie synchronizacji (VBLK)
$C24F - JMPTIM1 - skok według wektora TIMVEC1
$C252 - JMPTIM2 - skok według wektora TIMVEC2
$C255 - DECTIM - zmniejszenie licznika systemowego
$C272 - SETVBLV - ustawianie wektorów przerwania VBLK
$C28A - EXITVBL - zakończenie przerwania VBLK
$C290 - RESETWM - gorący start systemu
$C2AA - RESET - start systemu po naciśnięciu RESET
$C2C8 - RESETCD - zimny start systemu
$C3C1 - GOMEMTST - skok do testu komputera
$C423 - COLDCART - skok według wektora CARTRUN
$C426 - DOSVECC - skok według wektora DOSVEC
$C429 - INITCART - skok według wektora CARTINI
$C42C - CLCRTS - rozkazy CLC i RTS
$C42E - INIT31A - tabela wartości dla HATABS
$C43D - DERRMSG - meldunek błędu "BOOT ERROR"
$C448 - NAME - nazwa edytora "E:"
$C44B - INIT200 - tabela wartości dla wektorów OS
$C471 - CARTGO - sprawdzenie cartridge'a
$C4A9 - GRAMHI - sprawdzenie wielkości RAM
$C4C9 - NEWCART - sprawdzenie cartridge'a
$C4DA - IOPORTIN - inicjowanie portów układów I/O
$C535 - SYSINIT - inicjowanie systemu komputerowego
$C58B - BOOT - wstępny odczyt z dyskietki
$C5BB - BLOCK1 - wstępny odczyt przy zimnym starcie
$C629 - BLOAD - odczyt adresu inicjowania
$C63B - DOSINITC - skok według wektora DOSINI
$C63E - DRDERR - wyświetlenie meldunku błędu
$C642 - PUTLINE - wyświetlenie linii tekstu
$C659 - GETBLK - odczyt bloku danych z urządzenia
$C66E - CASBOOT - wstępny odczyt z kasety
$C6A0 - CASINITC - skok według wektora CASINI
$C6A3 - DSKINIT - inicjowanie obsługi stacji dysków
$C6B3 - DSKINT - główna procedura dyskowa
$C8FC - SWITROM - wywołanie testu komputera
$C90C - NEWINIT - inicjowanie nowych urządzeń
$C933 - SIOINT - procedura obsługi złącza szeregowego
$C96E - NEWIOREQ - przerwanie IRQ nowego urządzenia
$CA21 - BITMASK - maski bitowe dla NEWIOREQ
$CC00 - CHARSET2 - zestaw znaków międzynarodowych
$D803 - DEVID1 - kod identyfikacyjny nowego urządzenia
$D808 - DEVINT - przerwanie IRQ nowego urządzenia
$D80B - DEVID2 - kod identyfikacyjny nowego urządzenia
$D819 - DEVINIT - inicjowanie nowego urządzenia
$D800 - AFP - zamiana ciągu ASCII na liczbę FP
$D8E6 - FASC - zamiana liczby FP na ciąg ASCII
$D9AA - IFP - zamiana liczby całkowitej na FP
$D9D2 - FPI - zamiana liczby FP na całkowitą
$DA44 - ZFR0 - zerowanie FR0
$DA48 - AF1 - zerowanie wg rejestru X
$DA51 - STBV - zapis wektora bufora
$DA5A - ROLZ2 - przesunięcie w lewo ZTEMP2
$DA60 - FSUB - odejmowanie liczb FP
$DA66 - FADD - dodawanie liczb FP
$DADB - FMUL - mnożenie liczb FP
$DB28 - FDIV - dzielenie liczb FP
$DB94 - INBCN - zamiana znaku z bufora
$DB8D - INCIX - zwiększenie indeksu
$DBA1 - INBSS - przeszukiwanie bufora
$DBAF - ADBT - zamiana znaku ASCII na kod BCD
$DBBB - ASCSS - przeszukiwanie ciągu ASCII
$DBE7 - ROLFR2 - przesunięcie w lewo liczby w FR2
$DBEB - ROLFR0 - przesunięcie w lewo liczby w FR0
$DC00 - NFR0 - poprawienie formatu liczby FP
$DC3A - ADJ0 - adjustowanie liczby z FR0
$DC3E - ADJ1 - adjustowanie liczby z FR1
$DC62 - SHR0 - przesunięcie w prawo FR0
$DC70 - STALB - zapis znaku ASCII do bufora
$DC9D - BTAD - zamiana kodu BCD na znak ASCII
$DC9F - STLB - zapis do bufora
$DCA4 - LBSR - przeszukiwanie bufora
$DCB9 - IDEX - wydzielenie cyfry
$DCC1 - DECIBP - zmniejszenie licznika bufora
$DCCF - SGNEV - obliczenie znaku przy mnożeniu i dzieleniu
$DCE0 - MVARG - przeniesienie argumentów
$DD01 - ADD01 - dodanie rejestrów FR0 i FR1
$DD05 - ADD02 - dodanie rejestrów FR0 i FR2
$DD09 - ADDE1 - dodanie rejestrów FRE i FR1
$DD0F - ADDE2 - dodanie rejestrów FRE i FR2
$DD40 - PLYEVL - przeliczenie wielomianowe
$DD89 - FLD0R - zapis liczby FP do FR0 według X,Y
$DD8D - FLD0P - zapis liczby FP do FR0 według FLPTR
$DD98 - FLD1R - zapis liczby FP do FR1 według X,Y
$DD9C - FLD1P - zapis liczby FP do FR1 według FLPTR
$DDA7 - FST0R - zapis liczby FP z FR0 według X,Y
$DDAB - FST0P - zapis liczby FP z FR0 według FLPTR
$DDB6 - FMOV01 - przepisanie z FR0 do FR1
$DD34 - FMOV0E - przepisanie z FR0 do FRE
$DD28 - FMOV12 - przepisanie z FR1 do FR2
$DDC0 - EXP - potęgowanie o podstawie e
$DDCC - EXP10 - potęgowanie o podstawie 10
$DE4D - TP10 - tabela współczynników potęgowania
$DE95 - RSQT - iloraz różnicowy
$DECD - LOG - logarytm naturalny
$DED1 - LOG10 - logarytm dziesiętny
$DF66 - TLOG - tabela współczynników logarytmowania
$DFAE - TATAN - tabela współczynników funkcji arctg
$E000 - CHARSET1 - standardowy zestaw znaków
$E400 - EDTVEC - wektory obsługi edytora
$E410 - SCRVEC - wektory obsługi ekranu
$E420 - KBDVEC - wektory obsługi klawiatury
$E430 - PRTVEC - wektory obsługi drukarki
$E440 - CASVEC - wektory obsługi magnetofonu
$E450 - JMPTAB - tabela skoków
$E450 - JDSKINIT - skok do DSKINIT
$E453 - JDSKINT - skok do DSKINT
$E456 - JCIOMAIN - skok do CIOMAIN
$E465 - JSIOINIT - skok do SIOINIT
$E46B - JNMIEN - skok do NMIENBL
$E46E - JCIOINIT - skok do CIOINIT
$E47A - JCASRDBL - skok do CASRDBL
$E47D - JCASOPIN - skok do CASOPIN
$E483 - JTESTST - skok do TESTST
$E49B - NEWINITC - skok do NEWINIT
$E4C1 - CIOINIT - inicjowanie obsługi urządzeń
$E4DC - CIONOPN - kanał I/O nie otwarty
$E4DF - CIOMAIN - procedura obsługi urządzeń
$E739 - LINKSOM - procedura dołączania urządzeń
$E95C - SIOINIT - inicjowanie złącza szeregowego
$EAAD - ISRODN - przerwanie zapisu danych
$EAEC - ISRXD - przerwanie końca transmisji
$EB2E - ISRSIR - przerwanie odczytu danych
$EC11 - TIM1INT - przerwanie licznika 1
$EC17 - SNDENBL - zezwolenie na zapis danych
$EEBC - NEWDEVC - wywołanie nowego urządzenia
$EF6E - POWERON - inicjowanie edytora
$F223 - TESTROM - skok do SWITROM
$FB51 - KEYDEF - tabela definicji klawiszy
$FC11 - FKDEF - tabela definicji klawiszy funkcyjnych
$FC19 - CPUIRQ - przerwanie IRQ klawiatury
$FCC4 - FSDL - przerwanie NMI programu ANTIC-a
$FCDB - CASINIT - inicjowanie magnetofonu
$FCF7 - CASOPIN - początek odczytu z magnetofonu
$FD8D - CASRDBL - odczyt bloku z magnetofonu
$FE99 - PRINIT - inicjowanie drukarki
$FF73 - CKROM1 - sprawdzenie pierwszej części ROM
$FF92 - CKROM2 - sprawdzenie drugiej części ROM
$FFA9 - GETCKS - zliczanie sumy kontrolnej
$FFD7 - CKSTAB - tabela adresów bloków pamięci ROM
$FFF8 - CHSRO2 - suma kontrolna drugiej części ROM
$FFFA - NMIVEC - wektor procedury przerwania NMI
$FFFC - RESETVEC - wektor procedury przerwania RESET
$FFFE - IRQVEC - wektor procedury przerwania IRQ

# Rejestry OS w pamięci RAM
  $00 - LNFLG - rejestr pomocniczy procedury RESET
  $01 - NGFLAG - rejestr pomocniczy procedury RESET
  $02 - CASINI - wektor inicjacji po odczycie z kasety
  $04 - RAMLO - wektor RAM dla testu wielkości pamięci
  $06 - TRAMSZ - rejestr tymczasowy dla testu wielkości RAM
  $08 - WARMST - znacznik gorącego startu
  $09 - BOOT? - znacznik odczytu wstępnego
  $0A - DOSVEC - wektor startowy programu dyskowego
  $0C - DOSINI - wektor inicjacji po odczycie z dyskietki
  $0E - APPMHI - najwyższy adres RAM zajęty przez program
  $10 - IRQENS - rejestr-cień IRQEN
  $11 - IRQSTAT - rejestr-cień IRQST
  $12 - RTCLOCK - zegar czasu rzeczywistego
  $30 - STATUS - status aktualnej operacji SIO
  $31 - CHKSUM - suma kontrolna dla operacji SIO
  $32 - BUFR - adres bufora danych dla SIO
  $34 - BUFEN - adres końca bufora danych dla SIO
  $38 - BUFRFL - znacznik zapełnienia bufora SIO
  $39 - RECVND - znacznik końca odczytu
  $3A - XMTDON - znacznik końca transmisji
  $3B - CHKSNT - znacznik nadania sumy kontrolnej
  $3C - NOCKSM - znacznik braku sumy kontrolnej
  $3E - GAPTYP - wskaźnik długości przerwy między blokami
  $41 - IOSNDEN - znacznik dźwięku przy transmisji
  $42 - CRITIC - znacznik krytycznych czasowo operacji I/O
  $4D - ATRACT - licznik trybu przyciągania uwagi
  $4E - ATRMSK - maska trybu przyciągania uwagi
  $4F - COLRSH - maska zmiany kolorów
  $52 - LMARGIN - lewy margines obrazu
  $53 - RMARGIN - prawy margines obrazu
  $60 - FKDEFP - wektor tabeli definicji klawiszy F1-F4
  $62 - PALNTS - wskaźnik systemu TV
  $6A - RAMTOP - liczba stron pamięci RAM
  $79 - KEYDEFP - wektor tabeli definicji klawiszy
  $8B - CKSUM - tymczasowy rejestr sumy kontrolnej
  $9E - TMPREG - tymczasowy rejestr sumy kontrolnej
  $D4 - FR0 - zerowy rejestr liczb FP
  $DA - FRE - dodatkowy rejestr liczb FP
  $E0 - FR1 - pierwszy rejestr liczb FP
  $E6 - FR2 - drugi rejestr liczb FP
  $EC - FRX - rejestr pomocniczy
  $ED - EEXP - rejestr wartości wykładnika
  $EE - NSIGN - rejestr znaku liczby
  $EF - ESIGN - rejestr znaku wykładnika
  $F0 - FCHRFLG - znacznik pierwszego znaku liczby
  $F1 - DIGRT - liczba cyfr po przecinku
  $F2 - CIX - indeks znaku w buforze
  $F3 - INBUFP - adres bufora wejściowego
  $F5 - ZTEMP1 - rejestr tymczasowy
  $F7 - ZTEMP2 - rejestr tymczasowy
  $F9 - ZTEMP3 - rejestr tymczasowy
  $FC - FLPTR - adres liczby FP
  $FE - FPTR2 - adres liczby FP
$0100 - STACK - stos mikroprocesora 6502
$0200 - DLIV - wektor przerwania programu ANTIC-a
$0202 - VPRCED - wektor przerwania portu A PIA
$0204 - VINTER - wektor przerwania portu B PIA
$0206 - VBREAK - wektor przerwania rozkazu BRK
$020A - VSERIN - wektor przerwania odczytu szeregowego
$020C - VSEROR - wektor przerwania zapisu szeregowego
$020E - VSEROC - wektor przerwania końca transmisji
$0210 - VTIMR1 - wektor przerwania licznika 1 POKEY-a
$0212 - VTIMR2 - wektor przerwania licznika 2 POKEY-a
$0214 - VTIMR4 - wektor przerwania licznika 4 POKEY-a
$0216 - VIMIRQ - główny wektor przerwania IRQ
$0218 - TIMCNT1 - pierwszy licznik systemu
$021A - TIMCNT2 - drugi licznik systemu
$021C - TIMCNT3 - trzeci licznik systemu
$021E - TIMCNT4 - czwarty licznik systemu
$0220 - TIMCNT5 - piąty licznik systemu
$0222 - VVBLKI - wektor natychmiastowego przerwania VBLK
$0224 - VVBLKD - wektor opóźnionego przerwania VBLK
$0226 - TIMVEC1 - wektor przerwania licznika TIMCNT1
$0228 - TIMVEC2 - wektor przerwania licznika TIMCNT2
$022B - SRTIMER - zegar powtarzania klawiatury
$022D - INTEMP - rejestr przejściowy procedury SETVBLV
$022F - DMACTLS - rejestr-cień DMACTL
$0230 - DLPTRS - rejestr-cień DLPTR
$0232 - SKCTLS - rejestr-cień SKCTL
$0234 - LPENHS - rejestr-cień LPENH
$0235 - LPENVS - rejestr-cień LPENV
$0236 - VBRKKEY - wektor przerwania klawisza BREAK
$0238 - VPIRQ - wektor przerwania nowego urządzenia
$0240 - DFLAG - znacznik operacji dyskowych
$0241 - DSECCNT - licznik sektorów dla operacji dyskowych
$0242 - BOOTAD - adres ładowania przy stępnym odczycie
$0244 - COLDST - znacznik zimnego startu systemu
$0246 - DSKTIM - wartość Timeout dla stacji dysków
$0248 - PDVRS - rejestr-cień PDVREG
$0249 - PINTMSK - maska przerwań nowych urządzeń
$026B - CHSPTR - wektor nieużywanego zestawu znaków
$026C - VSFLAG - znacznik przesuwu pionowego obrazu
$026D - KEYDIS - znacznik zablokowania klawiatury
$026F - GTICTLS - rejestr-cień GTIACTL
$0270 - PADDL0 - rejestr-cień POT0
$0278 - JSTICK0 - położenie joysticka 0
$0279 - JSTICK1 - położenie joysticka 1
$027A - JSTICK2 - położenie joysticka 2
$027B - JSTICK3 - położenie joysticka 3
$027C - PTRIG0 - przycisk potencjometru 0
$027D - PTRIG1 - przycisk potencjometru 1
$0284 - TRIG0S - przycisk joysticka 0, rejestr-cień TRIG0
$0285 - TRIG1S - przycisk joysticka 1, rejestr-cień TRIG1
$0286 - TRIG2S - rejestr-cień TRIG2
$0287 - TRIG3S - rejestr-cień TRIG3
$028C - NEWIOP - tymczasowy wektor skoku przerwań IRQ
$02BE - SHFLOK - znacznik klawiszy SHIFT i START
$02C0 - COLPM0S - rejestr-cień COLPM0
$02C1 - COLPM1S - rejestr-cień COLPM1
$02C2 - COLPM2S - rejestr-cień COLPM2
$02C3 - COLPM3S - rejestr-cień COLPM3
$02C4 - COLPF0S - rejestr-cień COLPF0
$02C5 - COLPF1S - rejestr-cień COLPF1
$02C6 - COLPF2S - rejestr-cień COLPF2
$02C7 - COLPF3S - rejestr-cień COLPF3
$02C8 - COLBAKS - rejestr-cień COLBAK
$02D5 - DSCTLN - długość sektora dyskowego
$02D9 - KRPDEL - czas opóźnienia powtarzania klawisza
$02DA - KEYREP - częstotliwość powtarzania klawisza
$02DC - HLPFLG - znacznik klawisza HELP
$02DD - DMASAV - rejestr do przechowywania DMACTLS
$02E4 - RAMSIZ - liczba stron pamięci RAM
$02E5 - MEMTOP - adres górnej granicy wolnej pamięci RAM
$02E7 - MEMLO - adres dolnej granicy wolnej pamięci RAM
$02EE - CBAUD - prędkość transmisji z magnetofonu
$02F0 - CRSINH - znacznik widoczności kursora
$02F1 - KEYDEL - wartość opóźnienia odczytu klawisza
$02F2 - OLDKBC - kod poprzednio naciśniętego klawisza
$02F3 - CHACT - rejestr-cień CHRCTL
$02F4 - CHBAS - rejestr-cień CHBASE
$02FC - KBCODES - rejestr-cień KBCODE
$02FF - SSFLAG - znacznik start/stop dla przesuwu obrazu
$0300 - DDEVIC - kod identyfikacyjny urządzenia
$0301 - DUNIT - numer identyfikacyjny urządzenia
$0302 - DCMND - bajt rozkazu dla urządzenia
$0304 - DBUFA - adres bufora danych
$030A - DAUX1 - rejestr pomocniczy dla operacji I/O
$030B - DAUX2 - rejestr pomocniczy dla operacji I/O
$0314 - PTIMOT - wartość Timeout dla drukarki
$0317 - TIMFLG - znacznik upłynięcia czasu Timeout
$031A - HATABS - tabela wektorów procedur obsługi
$033D - PUPBT1 - bajt kontrolny zimnego startu
$033E - PUPBT2 - bajt kontrolny zimnego startu
$033F - PUPBT3 - bajt kontrolny zimnego startu
$0340 - ICCHID - indeks wpisu urządzenia w HATABS
$0342 - ICCMD - kod rozkazu operacji I/O
$0344 - ICBUFA - adres bufora danych
$0346 - ICPUTB - adres procedury przesyłania danych
$0348 - ICBUFL - długość bufora danych
$034A - ICAX1 - rejestr pomocniczy dla operacji I/O
$03E9 - CKEY - znacznik klawisza START przy zimnym starcie
$03EA - CASSBT - znacznik odczytu z magnetofonu
$03EB - CARTCK - suma kontrolna cartridge'a
$03EC - DERRF - znacznik błędu przy otwieraniu edytora
$03F8 - BASICF - znacznik interpretera Atari Basic
$03FA - GINTLK - znacznik cartridge'a (kopia TRIG3)
$0400 - CASBUF - bufor magnetofonu
$057F - LBPR2 - prefiks bufora
$0580 - LBUFF - bufor wyjściowy operacji FP
$05E0 - PLYARG - argument przeliczania wielomianowego
$BFF0 - CART - blok informacji o cartridge'u
$BFFA - CARTRUN - adres uruchomienia cartridge'a
$BFFC - CARTINS - znacznik zainstalowania cartridge'a
$BFFD - CARTOPT - rejestr rodzaju cartridge'a
$BFFE - CARTINI - adres inicjowania cartridge'a
$D010 - TRIG0 - stan przycisku joysticka 0
$D011 - TRIG1 - stan przycisku joysticka 1
$D012 - COLPM0 - rejestr koloru gracza 0
$D013 - COLPM1 - rejestr koloru gracza 1
$D013 - TRIG3 - znacznik dołączenia cartridge'a
$D014 - COLPM2 - rejestr koloru gracza 2
$D014 - PAL - znacznik systemu TV
$D015 - COLPM3 - rejestr koloru gracza 3
$D016 - COLPF0 - rejestr koloru pola gry 0
$D017 - COLPF1 - rejestr koloru pola gry 1
$D018 - COLPF2 - rejestr koloru pola gry 2
$D019 - COLPF3 - rejestr koloru pola gry 3
$D01A - COLBAK - rejestr koloru tła
$D01B - GTIACTL - rejestr kontroli układu GTIA
$D01F - CONSOL - rejestr stanu klawiszy konsoli
$D1FF - PDVREG - rejestr wyboru nowego urządzenia
$D200 - POT0 - rejestr położenia potencjometru 0
$D205 - AUDC3 - rejestr kontroli dźwięku generatora 3
$D207 - AUDC4 - rejestr kontroli dźwięku generatora 4
$D208 - AUDCTL - rejestr kontroli generatorów dźwięku
$D209 - KBCODE - kod ostatnio naciśniętego klawisza
$D20A - SKSTRES - reset statusu złącza szeregowego
$D20B - POTGO - znacznik przetwornika analogowo-cyfrowego
$D20D - SEROUT - szeregowy rejestr wyjściowy
$D20D - SERIN - szeregowy rejestr wejściowy
$D20E - IRQST - status przerwań IRQ
$D20E - IRQEN - zezwolenia przerwań IRQ
$D20F - SKCTL - rejestr kontroli złącza szeregowego
$D20F - SKSTAT - rejestr statusu złącza szeregowego
$D300 - PORTA - port A układu PIA
$D301 - PORTB - port B układu PIA
$D302 - PACTL - rejestr kontroli portu A
$D303 - PBCTL - rejestr kontroli portu B
$D400 - DMACTL - rejestr kontroli dostępu do pamięci
$D401 - CHRCTL - rejestr kontroli wyświetlania znaków
$D402 - DLPTR - adres programu ANTIC-a
$D405 - VSCROL - znacznik pionowego przesuwu obrazu
$D409 - CHBASE - adres zestawu znaków
$D40C - LPENH - poziome położenie pióra świetlnego
$D40D - LPENV - pionowe położenie pióra świetlnego
$D40A - WSYNC - znacznik oczekiwania na synchronizację poziomą
$D40E - NMIEN - rejestr zezwoleń na przerwania NMI
$D40F - NMIST - rejestr statusu przerwań NMI

