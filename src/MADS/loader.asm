        ; icl "atari_g2f.h"
        SDLSTL = $0230         
        SDLSTH = $0231
        ;org $1000

loader_fnt
        ins "newgfx\loadingscreen02.fnt",0,$0250
loader_scr
        ins "newgfx\loadingscreen02.scr",0
dl_loader
        dta $70,$70,$70
        dta $70,$70,$70
	dta $C4,a(loader_scr)
	dta $84,$04,$04,$04,$04,$04
	dta $41,a(dl_loader)

loader_init   *

        lda #>loader_fnt
        sta $02f4
        ldx #<dl_loader
        ldy #>dl_loader
        stx SDLSTL
        sty SDLSTH
	lda #$00
	sta colbaks
	lda #$1C
        sta colpf0s
	lda #$1E
	sta colpf1s
	lda #$1a
	sta colpf2s
	lda #$18
	sta colpf3s
	mva #@dmactl(narrow|dma|lineX1|players|missiles) sdmctl	
;-------------------------------
        LDA RTCLOK+2
        CMP RTCLOK+2
        BEQ *-4
        RTS


        ini loader_init

