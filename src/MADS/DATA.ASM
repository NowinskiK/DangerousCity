
dl_gra   ;equ *
     dta $70,$70
     dta $42,a(pasek)
     dta $42,a(ekr)
 :14 dta $02
     dta $80,$0f,$02,$20
     dta $4f,a(linijka)
     dta $42,a(rzeczy_w)
     dta $02,$02,$02
     dta $40,$80,$30
     dta $02,$20,$02
     dta $a0
     dta $41,a(dl_gra)

pasek       .he 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00
ekr  :14    .he 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00
            .he 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00
         
linijka     .he 00 00 00 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 00 00 00 00
plname      .he 00 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00 00
rzeczy_w :4 .he 00 00 00 00 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 80 00 00 00 00

kom      :40 dta d " "
rzc_wid  :40 dta d " "

t1_cz     :32 dta d " "
          :32 dta d " "
t2_cz     :32 dta d " "
          :32 dta d " "

tabzw    .he 01 1c 02 1f 03 1d 04 1e 00      ;mapowanie zwrotow

.IF LANG = 'pl'
     icl "data_titles_pl.asm"
     icl "data_scenario_pl.asm"
     icl 'data_items_pl.asm'
.ELSE
     icl "data_titles_en.asm"
     icl "data_scenario_en.asm"
     icl 'data_items_en.asm'
.ENDIF
     icl "data_scenario.asm"
     icl "data_car.asm"
     icl "data_map.asm"
     icl "data_sprites.asm"
