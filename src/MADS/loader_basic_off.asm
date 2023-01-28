        org $0600

basic_off   *

        lda PORTB
        ora #%10
        sta PORTB
        rts

        ini basic_off

