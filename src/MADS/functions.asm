
_dekomp  *
ah5      ldy #0
         lda ($c0),y
         cmp #EOL
         bne ah6
         jmp ending
ah6      cmp #$80     ;* rozpakuj !
         bcs depack
         ldy #0
         sta ($c2),y
         jsr _sou
         jsr _des
         jmp ah5
depack   eor #$80
         sta $cf
         jsr _sou
         ldy #0
         lda ($c0),y
         tax
         jsr _sou
         ldy #0
ah7      lda $cf
         sta ($c2),y
         jsr _des
         dex
         bne ah7
         jmp ah5
_sou     inc $c0
         bne *+4
         inc $c1
         rts
_des     inc $c2
         bne *+4
         inc $c3
ending   rts

_dekompff  *        ;byte / amount
         ldy #0
         lda ($c0),y
         cmp #EOL
         bne ffdepack
ffending rts
ffdepack sta $cf    ;value
         jsr _sou
         ldy #0
         lda ($c0),y
         tax        ;amount of bytes
         jsr _sou
         ldy #0
ffah7    lda $cf
         sta ($c2),y
         jsr _des
         dex
         bne ffah7
         jmp _dekompff


_decmp_tit_spr *
		ldx #<(compr_spr_title)
		ldy #>(compr_spr_title)
		stx $c0
		sty $c1
		ldx #$00
		ldy #>(pmg + $0300)
		stx $c2
		sty $c3
		jsr _dekompff
		rts
