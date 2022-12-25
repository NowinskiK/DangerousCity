         opt %100101


des      equ $b000
sou      equ $a000


         org $0600

* init
         pla
         ldx <sou
         ldy >sou
         stx $c0
         sty $c1
         ldx <des
         ldy >des
         stx $c2
         sty $c3

next     ldy #0         * sprawdza czy
         lda ($c0),y    * bajty
         bpl aa1
         jmp end
aa1      iny            * jednakowe...
         cmp ($c0),y
         beq komp       * takie same!

 * niejednakowe bajty

         ldy #0
         sta ($c2),y
         jsr _sou
         jsr _des
         jmp next

 * jednakowe bajty

komp     equ *

         clc
         adc #$80
         ldy #0
         sta ($c2),y
         jsr _des
         lda #2
         ldy #0
         sta ($c2),y
aa2      jsr _sou
         ldy #0
         lda ($c0),y
         iny
         cmp ($c0),y
         bne niejed
         ldy #0
         lda ($c2),y
         clc
         adc #1
         sta ($c2),y
         jmp aa2

niejed   jsr _sou
         jsr _des
         jmp next




_sou     inc $c0
         bne *+4
         inc $c1
         rts

_des     inc $c2
         bne *+4
         inc $c3
         rts

end      ldy #$00
         lda #$9b
         sta ($c2),y
         ldx $c2
         ldy $c3
         stx $d4
         sty $d5
         rts

