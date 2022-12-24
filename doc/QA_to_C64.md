# Mapping between Quick Assembler & C64 Studio

## DTA A(adres)
QA generuje słowo (2 bajty) wypełniając je podaną wartością.  
QA:  `dta a(leg_t)`  
C64: `!byte <leg_t, >leg_t`  
     `!word (leg_t)`

## DTA B(bajt)
QA generuje bajt.  
QA:  `dta b($70),b(0)` 
C64: `!byte $70, 0` 

`dta b(%01100111)`

## DTA C'tekst'
QA generuje ciąg kodów [ATASCII](https://en.wikipedia.org/wiki/ATASCII) podanych znaków.  
QA:  `dta c'Sejf '`  
QA DATA:  `53 65 6A 66 20`
C64: `!text "Sejf "`  
C64 DATA: `53 65 6A 66 20`


## DTA D'tekst' - rozbieznosci!
QA generuje ciąg kodów ekranowych (internal) podanych znaków.  
QA:  ` dta d'   koniec GRY   '`  
QA DATA:       `00 00 00 6B 6F 6E 69 65 63 00 27 32 39 00 ...`  
C64: `!TEXT "   koniec GRY   "`  
C64 TEXT DATA: `20 20 20 6B 6F 6E 69 65 63 00 47 52 59 20 ...`  
C64: `!PET "   koniec GRY   "`  
C64 PET DATA:  `20 20 20 4B 4F 4E 49 45 43 20 C7 D2 D9 20 ...`  
C64: `!SCR "   koniec GRY   "`  
C64 SCR DATA:  `20 20 20 0B 0F 0E 09 05 03 20 47 52 59 20 ...`  
C64: `!RAW "   koniec GRY   "`  
C64 RAW DATA:  `20 20 20 6B 6F 6E 69 65 63 00 47 52 59 20 ...`  

> Ani `!text`, ani `!pet` nie są prawidłowym odzwierciedleniem komendy `DTA D` z QA.


## DTA L(adres)
QA generuje młodszy bajt z podanej wartości.  
QA:  ``  
C64: ``  


## DTA H(adres)
QA generuje starszy bajt z podanej wartości.  
QA:  ``   
C64: ``  

## ORG & ICL
QA: 
```
ORG $600
ICL 'D8:PG8.TXT'
```
C64:
```
* = $0600
!bin "fonty\b.fnt",,6
!source "DATA-QA.asm"
```

# ATASCII
https://en.wikipedia.org/wiki/ATASCII  
41-4F = A-O  
50-5A = P-Z  
61-6F = a-o  
70-7A = p-z  

