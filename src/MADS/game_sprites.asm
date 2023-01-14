.MACRO	GAME_SPRITES
  :$300	 dta $00
game_missiles
  :$20	 dta $00
  :$70	 dta $ff
  :$70	 dta $00
game_player0
  :$20	 dta $00
  :$70	 dta $f0
  :$70	 dta $00
game_player1
  :$20	 dta $00
  :$70	 dta $ff
  :$70	 dta $00
game_player2
  :$20	 dta $00
  :$70	 dta $ff
  :$70	 dta $00
game_player3
  :$20	 dta $00
  :$70	 dta $ff
  :$70	 dta $00
.ENDM


.MACRO	GAME_SPRITES_COMPRESSED
;game_missiles
	.he 00 20
	.he ff 70
	.he 00 70
;game_player0
	.he 00 20
	.he f0 70
	.he 00 70
;game_player1
	.he 00 20
	.he ff 70
	.he 00 70
;game_player2
	.he 00 20
	.he ff 70
	.he 00 70
;game_player3
	.he 00 20
	.he ff 70
	.he 00 70
;end
	.he 9b

.ENDM
