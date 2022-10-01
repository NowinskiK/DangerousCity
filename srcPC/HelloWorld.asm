 ; Wygeneruj plik z czystym skomplilowanym kodem (plain)
 ; Jest mozliwosc bezposredniego generowania np obrazow dyskow
 ; lub wsadow do cartridge
 
 !To "Hello.xex", plain 
 
 * = $0600 ; Adres, pod ktory program bedzie zaladowany do pamieci Atari

 ; Naglowek pliku xex
 !BYTE 0xFF, 0xFF     ; 00 - 01 $FFFF - Stala Wartosc oznaczajaca, ze to jest program
 !BYTE <Start, >Start ; 02 - 03 Adres Startu Programu (dolny potem gorny bajt)
 !BYTE <End, >End     ; 04 - 05 Adres Konca Programu  (dolny potem gorny bajt)
 
 ; Kilka Waznych adresow
 ICHID = $0340 ; IOCB Identyfikator
 ICCOM = $0342 ; IOCB Komenda
 ICBAL = $0344 ; Adres Bufora - dolny bajt
 ICBAH = $0345 ; Adres Bufora - gorny bajt
 ICBLL = $0348 ; Dlugosc Bufora - dolny bajt
 ICBLH = $0349 ; Dlugosc Bufora - gorny bajt
 CIOV  = $E456 ; Wektor CIO

 Start: ; Poczatek programu -
 
 ; Ustaw parametry odwolania do CIO
     LDX #0             ; Zaladuj zero do rejestru X
     LDA #9             ; Zaladuj 9 do Akumulatora
     STA ICCOM,X        ; Ustaw Komende 
     LDA #(<Tekst)      ; Zaladuj adres startu tekstu - dolny bajt
     STA ICBAL,X        ; Wstaw Wartosc
     LDA #(>Tekst)      ; Zaladuj adres konca tekstu - gorny bajt
     STA ICBAH,X        ; Wstaw Wartosc
     LDA <(End - Tekst) ; Dlugosc Tekstu dolny bajt
     STA ICBLL,X        ; Wstaw Wartosc
     LDA >(End - Tekst) ; Dlugosc Tekstu gorny bajt
     STA ICBLH,X        ; Wstaw Wartosc
 ; Call CIO
     JSR CIOV           ; Wykonac !
     
 Opowiesc:
     jmp Opowiesc;      ; Niekonczaca sie opowiesc

 Tekst:    
!text "Hello World!!!",$9B ; - $9B oznacza przejscie do nowej linii

 End: ; Koniec Programu
  