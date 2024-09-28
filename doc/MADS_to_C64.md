# Doc
[HTML](file:/D:/ATARI/Tools/Mad-Assembler-2.1.5/doc/mads.html)


# icl "TYT10_PTODT4.h"

`icl "TYT10_PTODT4.h"`
> Pseudo rozkaz ICL pozwala na dołączenie dodatkowego pliku źródłowego i jego asemblację.
C64:
```
!source "variables.asm"
```


# scr ins "TYT10_PTODT4.scr"
`scr ins "TYT10_PTODT4.scr"`

C64:
```
!bin "TYT10_PTODT4.scr"
```

# lda:cmp:req $14
`A5 14 C5 14 F0 FC		lda:cmp:req $14`

```
     LDA $14
here CMP $14
     BEQ here
```

file:///D:/ATARI/C64Studio/Doc/asm_cpu_6502.html

# ift USESPRITES

```
ift USESPRITES
eif
```
C64:
```
!ifdef MUSIC_PLAYING{
          ldx #0
        } else {
          lda #7
        }
```

# .ALIGN $0400
`.ALIGN $0400`

C64:
```

```


# mva & mwa
`mva #$fe portb`  generates: `A9 FE 8D 01 D3`
C64:
```
LDA #$fe
STA $D301
```


`mwa #NMI $fffa` generates: `A9 0d 8D FA FF A9 20 8D FB FF ....`
C64:
```
LDA #$0d
STA $FFFA
LDA #$20
STA $FFFB
```



# .proc	NMI
```
.proc test
pole nop
.endp
```




# .ds
```
org $f0
fcnt  .ds 2  
fadr  .ds 2
```

C64:
```
fcnt   = $f0
fadr   = $f2
```

# org $2000
`org $2000`
```
* = $2000
```

# .he 
`.he 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00`
C64:
```
!hex 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
```
