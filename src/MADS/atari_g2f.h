	opt l-

.enum	@dmactl
	blank	= %00
	narrow	= %01
	standard= %10
	wide	= %11
	missiles= %100
	players	= %1000
	lineX1	= %10000
	lineX2	= %00000
	dma	= %100000
.ende

scr48	= @dmactl(wide|dma|players|missiles|lineX1)		;screen 48b
scr40	= @dmactl(standard|dma|players|missiles|lineX1)		;screen 40b
scr32	= @dmactl(narrow|dma|players|missiles|lineX1)		;screen 32b

.enum	@pmcntl
	missiles= %1
	players	= %10
	trigs	= %100
.ende

.enum	@gtictl
	prior0	= %0
	prior1	= %1
	prior2	= %10
	prior4	= %100
	prior8	= %1000
	ply5	= %10000	; Fifth Player Enable
	mlc	= %100000	; Multiple Color Player Enable
	mode9	= %01000000
	mode10	= %10000000
	mode11	= %11000000
.ende


* ---------------------------------------------------------------------------------------------
* ---	OS
* ---------------------------------------------------------------------------------------------

ramlo	=	$04	; (2) wektor RAM dla testu wielko?ci pami?ci

warmst	=	$08	; znacznik gor?cego startu
boot?	=	$09	; znacznik odczytu wst?pnego
dosvec	=	$0A	; (2) wektor startowy programu dyskowego
dosini	=	$0C	; (2) wektor inicjacji po odczycie z dyskietki

rtclok	=	$12	; (3) zegar czasu rzeczywistego

lmargin	=	$52
rmargin	=	$53
rowcrs	=	$54	; wiersz  kursora
colcrs	=	$55	; (2) Kolumna kursora

keydef	=	$79	; (2) tablica konwersji kod?w klawiatury na ATASCII


vdslst	=	$0200	; (2) wektor przerwa? NMI listy displejowej
timcnt3	=	$021C	; trzeci licznik systemu
vvblki	=	$0222	; (2) wektor NMI natychmiastowego VBI
vvblkd	=	$0224	; (2) wektor NMI op??nionego VBI
timflg3	=	$022a	; znacznik wyzerowania licznika TIMCNT3
SDMCTL  	 = $022F         ;SAVE DMACTL REGISTER

colpf0s	=	$02C4	; rejestr-cie? COLPF0
colpf1s	=	$02C5	; rejestr-cie? COLPF1
colpf2s	=	$02C6	; rejestr-cie? COLPF2
colpf3s	=	$02C7	; rejestr-cie? COLPF3
colbaks	=	$02C8	; rejestr-cie? COLBAK

dsctln	=	$02D5	; (2) Disk sector size register; default of 128 ($80) bytes
dvstat	=	$02EA	; (4) device status
HLPFLG  =   $02DC   ; zapisywany jest tam kod kombinacji klawisza HELP z ewentualnymi klawiszami SHIFT lub CONTROL

crsinh	=	$02F0	; znacznik widoczno?ci kursora
chact	=	$02F3	; rejestr cien CHRCTL
chbas	=	$02F4	; rejestr cien CHBASE

atachr	=	$02Fb	; numer koloru dla PLOT, DRAW (kod ATASCII znaku)
kbcodes	=	$02Fc	; kod ostatnio naci?ni?tego klawisza, $ff je?li ?aden nie zosta? naci?ni?ty (KBCODE)
fildat	=	$02Fd	; numer koloru dla FILL
chart	=	$02F3	; cie? rejestru kontroli wy?wietlania znak?w (CHRCTL)

ddevic	=	$0300	; Device Control Block, identyfikator urz?dzenia
dunit	=	$0301	; Numer urz?dzenia; w przypadku stacji dysk?w numer nap?du
dcmnd	=	$0302	; Komenda dla urz?dzenia.
dstats	=	$0303	; Przed wywo?aniem SIO nale?y ustawi? tu rodzaj operacji ($40 odczyt, $80 zapis, $C0 zapis i odczyt, $00 brak transferu danych). Po powrocie z systemu znajduje si? tu status operacji (kod b??du).
dbufa	=	$0304	; (2) Adres bufora. Przy operacji zapisu i odczytu jednocze?nie (DSTATS = $C0) bufor na odczytywane dane znajduje si? w tym samym miejscu, co bufor danch przeznaczonych do zapisu.
dtimlo	=	$0306	; Czas oczekiwania na pozytywn? odpowied? urz?dzenia, tzw. timeout, najczesciej = 7
dunuse	=	$0307	; Bajt nieu?ywany, zarezerwowany do przysz?ych zastosowa?.
dbyt	=	$0308	; (2) Wielko?? bufora; musi by? zgodna z wielko?ci? transmitowanego bloku danych. Zero oznacza 64 kilobajty.
daux1	=	$030A	; Pierwszy bajt pomocniczy. W operacjach dyskowych m?odszy bajt numeru sektora.
daux2	=	$030B	; Drugi bajt pomocniczy. W operacjach dyskowych starszy bajt numeru sektora.
casflg	=	$030F	; When set to zero, the current operation is a standard SIO operation; when non-zero, it is a cassette operation.

hatabs	=	$031A	; tabela wektor?w procedur obs?ugi

iocb	=	$0340	; IOCB 0..7 ($340, $350, $360 ...)
iocom	=	iocb+2	; Komenda dla IOCB
ioadr	=	iocb+4	; (2) Adres bufora dla IOCB
ioaux1	=	iocb+10	; Bajt pomocniczy 1 IOCB
ioaux2	=	iocb+11	; Bajt pomocniczy 2 IOCB

icchid	=	$0340
icdno	=	$0341
iccmd	=	$0342	; kod rozkazu operacji I/O
icstat	=	$0343	; status operacji I/O
icbufa	=	$0344	; (2) adres bufora danych dla operacji I/O
icputb	=	$0346	; (2) adres procedury przesy?ania danych
icbufl	=	$0348	; (2) d?ugo?? bufora danych dla operacji I/O
icax1	=	$034A	; rejestr pomocniczy dla operacji I/O
icax2	=	$034B	; rejestr pomocniczy dla operacji I/O
icax3	=	$034C	; rejestr pomocniczy dla operacji I/O
icax4	=	$034D	; rejestr pomocniczy dla operacji I/O
icax5	=	$034E	; rejestr pomocniczy dla operacji I/O
icax6	=	$034F	; rejestr pomocniczy dla operacji I/O

casbuf	=	$0400	; bufor magnetofonu
casben	=	$047F	; koniec bufora magnetofonu

setvbv	=	$E45C
xitvbv	=	$E462
ciov	=	$E456	; Wektor do CIOMAIN
jsioint	=	$E459	; Wektor do SIO
jdskint	=	$E453	; Wektor do sterownika dyskowego

* ---------------------------------------------------------------------------------------------
* ---	KEY ($d209)
* ---------------------------------------------------------------------------------------------

	icl "atari_keys.asm"

* ---------------------------------------------------------------------------------------------
* ---	GTIA
* ---------------------------------------------------------------------------------------------

hposp0	=	$D000	; pozioma pozycja gracza 0 (Z)
hposp1	=	$D001	; pozioma pozycja gracza 1 (Z)
hposp2	=	$D002	; pozioma pozycja gracza 2 (Z)
hposp3	=	$D003	; pozioma pozycja gracza 3 (Z)
hposm0	=	$D004	; pozioma pozycja pocisku 0 (Z)
hposm1	=	$D005	; pozioma pozycja pocisku 1 (Z)
hposm2	=	$D006	; pozioma pozycja pocisku 2 (Z)
hposm3	=	$D007	; pozioma pozycja pocisku 3 (Z)
sizep0	=	$D008	; poziomy rozmiar gracza 0 (Z)
sizep1	=	$D009	; poziomy rozmiar gracza 1 (Z)
sizep2	=	$D00A	; poziomy rozmiar gracza 2 (Z)
sizep3	=	$D00B	; poziomy rozmiar gracza 3 (Z)
sizem	=	$D00C	; poziomy rozmiar pocisk?w (Z)
grafp0	=	$D00D	; rejestr grafiki gracza 0 (Z)
grafp1	=	$D00E	; rejestr grafiki gracza 1 (Z)
grafp2	=	$D00F	; rejestr grafiki gracza 2 (Z)
grafp3	=	$D010	; rejestr grafiki gracza 3 (Z)
grafm	=	$D011	; rejestr grafiki pocisk?w (Z)
colpm0	=	$D012	; rejestr koloru gracza i pocisku 0 (Z)
colpm1	=	$D013	; rejestr koloru gracza i pocisku 1 (Z)
colpm2	=	$D014	; rejestr koloru gracza i pocisku 2 (Z)
colpm3	=	$D015	; rejestr koloru gracza i pocisku 3 (Z)
colpf0	=	$D016	; rejestr koloru pola gry 0 (Z)
colpf1	=	$D017	; rejestr koloru pola gry 1 (Z)
colpf2	=	$D018	; rejestr koloru pola gry 2 (Z)
colpf3	=	$D019	; rejestr koloru pola gry 3 (Z)
colpf4	=	$D01A
colbak	=	$D01A	; rejestr koloru t?a (Z)

color0	=	colpf0
color1	=	colpf1
color2	=	colpf2
color3	=	colpf3
color4  =   colbaks

kolm0pf	=	$D000	; kolizja pocisku 0 z polem gry (O)
kolm1pf	=	$D001	; kolizja pocisku 1 z polem gry (O)
kolm2pf	=	$D002	; kolizja pocisku 2 z polem gry (O)
kolm3pf	=	$D003	; kolizja pocisku 3 z polem gry (O)
kolp0pf	=	$D004	; kolizja gracza 0 z polem gry (O)
kolp1pf	=	$D005	; kolizja gracza 1 z polem gry (O)
kolp2pf	=	$D006	; kolizja gracza 2 z polem gry (O)
kolp3pf	=	$D007	; kolizja gracza 3 z polem gry (O)
kolm0p	=	$D008	; kolizja pocisku 0 z graczem (O)
kolm1p	=	$D009	; kolizja pocisku 1 z graczem (O)
kolm2p	=	$D00A	; kolizja pocisku 2 z graczem (O)
kolm3p	=	$D00B	; kolizja pocisku 3 z graczem (O)
kolp0p	=	$D00C	; kolizja gracza 0 z innym graczem (O)
kolp1p	=	$D00D	; kolizja gracza 1 z innym graczem (O)
kolp2p	=	$D00E	; kolizja gracza 2 z innym graczem (O)
kolp3p	=	$D00F	; kolizja gracza 3 z innym graczem (O)
trig0	=	$D010	; stan przycisku joysticka 0 (O)
trig1	=	$D011	; stan przycisku joysticka 1 (O)
trig3	=	$D013	; znacznik do??czenia cartridge-a (O)
pal	=	$D014	; znacznik systemu TV (O) PAL = 1, NTSC = 15

gtictl	=	$D01B	; rejestr kontroli uk?adu GTIA
gtiactl	=	gtictl

vdelay	=	$D01C	; licznik op??nienia pionowego P/MG
pmcntl	=	$D01D	; rejestr kontroli graczy i pocisk?w
hitclr	=	$D01E	; rejestr kasowania rejestr?w kolizji
consol	=	$D01F	; rejestr stanu klawiszy konsoli

* ---------------------------------------------------------------------------------------------
* ---	POKEY
* ---------------------------------------------------------------------------------------------

irqens	=	$0010	; rejestr-cie? IRQEN
irqstat	=	$0011	; rejestr-cie? IRQST

audf1	=	$d200	; cz?stotliwo?? pracy generatora 1 (Z)
audc1	=	$d201	; rejestr kontroli d?wi?ku generatora 1 (Z)
audf2	=	$d202	; cz?stotliwo?? pracy generatora 2 (Z)
audc2	=	$d203	; rejestr kontroli d?wi?ku generatora 2 (Z)
audf3	=	$d204	; cz?stotliwo?? pracy generatora 3 (Z)
audc3	=	$d205	; rejestr kontroli d?wi?ku generatora 3 (Z)
audf4	=	$d206	; cz?stotliwo?? pracy generatora 4 (Z)
audc4	=	$d207	; rejestr kontroli d?wi?ku generatora 4 (Z)

audctl	=	$D208	; rejestr kontroli generator?w d?wi?ku (Z)
stimer	=	$D209	; rejestr zerowania licznik?w (Z)
kbcode	=	$D209	; kod ostatnio naci?ni?tego klawisza (O)
skstres	=	$D20A	; rejestr statusu z??cza szeregowego (Z)
random	=	$D20A	; rejestr liczby losowej (O)
serout	=	$D20D	; szeregowy rejestr wyj?ciowy (Z)
serin	=	$D20D	; szeregowy rejestr wej?ciowy (O)
irqen	=	$D20E	; zezwolenie przerwa? IRQ (Z)
irqst	=	$D20E	; status przerwa? IRQ (O)
skctl	=	$D20F	; rejestr kontroli z??cza szeregowego (Z)
skstat	=	$D20F	; rejestr statusu z??cza szeregowego (O)

* ---------------------------------------------------------------------------------------------
* ---	PIA
* ---------------------------------------------------------------------------------------------

porta	=	$D300	; port A uk?adu PIA
portb	=	$D301	; port B uk?adu PIA
pactl	=	$D302	; rejestr kontroli portu A
pbctl	=	$D303	; rejestr kontroli portu B

* ---------------------------------------------------------------------------------------------
* ---	ANTIC
* ---------------------------------------------------------------------------------------------

dmactl	=	$D400	; rejestr kontroli dost?pu do pami?ci
chrctl	=	$D401	; rejestr kontroli wy?wietlania znak?w
dlptr	=	$D402	; adres programu ANTIC-a
hscrol	=	$D404	; znacznik poziomego przesuwu obrazu
vscrol	=	$D405	; znacznik pionowego przesuwu obrazu
pmbase	=	$D407	; adres pami?ci graczy i pocisk?w
chbase	=	$D409	; adres zestawu znak?w
wsync	=	$D40A	; znacznik oczekiwania na synchronizacj? poziom?
vcount	=	$D40B	; licznik linii obrazu
lpenh	=	$D40C	; poziome po?o?enie pi?ra ?wietlengo
lpenv	=	$D40D	; pionowe po?o?enie pi?ra ?wietlnego
nmien	=	$D40E	; rejestr zezwole? na przerwania NMI
nmist	=	$D40F	; rejestr statusu przerwa? NMI

* ---------------------------------------------------------------------------------------------
* ---	HARDWARE
* ---------------------------------------------------------------------------------------------

nmivec	=	$FFFA	; wektor przerwania NMI
resetvec=	$FFFC	; wektor przerwania RESET
irqvec	=	$FFFE	; wektor przerwania IRQ

	opt l+
