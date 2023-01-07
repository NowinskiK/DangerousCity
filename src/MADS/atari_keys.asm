
;-------------------------------------------------------------------------
; POKEY Address Equates
;-------------------------------------------------------------------------

POKEY     = $D200         ;POKEY area

; POKEY KBCODE Values

KEY_NONE    = $FF

KEY_0       = $32
KEY_1       = $1F
KEY_2       = $1E
KEY_3       = $1A
KEY_4       = $18
KEY_5       = $1D
KEY_6       = $1B
KEY_7       = $33
KEY_8       = $35
KEY_9       = $30

KEY_A       = $3F
KEY_B       = $15
KEY_C       = $12
KEY_D       = $3A
KEY_E       = $2A
KEY_F       = $38
KEY_G       = $3D
KEY_H       = $39
KEY_I       = $0D
KEY_J       = $01
KEY_K       = $05
KEY_L       = $00
KEY_M       = $25
KEY_N       = $23
KEY_O       = $08
KEY_P       = $0A
KEY_Q       = $2F
KEY_R       = $28
KEY_S       = $3E
KEY_T       = $2D
KEY_U       = $0B
KEY_V       = $10
KEY_W       = $2E
KEY_X       = $16
KEY_Y       = $2B
KEY_Z       = $17

KEY_COMMA       = $20
KEY_PERIOD      = $22
KEY_SLASH       = $26
KEY_SEMICOLON   = $02
KEY_PLUS        = $06
KEY_ASTERISK    = $07
KEY_DASH        = $0E
KEY_EQUALS      = $0F
KEY_LESSTHAN    = $36
KEY_GREATERTHAN = $37

KEY_ESC     = $1C
KEY_TAB     = $2C
KEY_SPACE   = $21
KEY_RETURN  = $0C
KEY_DELETE  = $34
KEY_CAPS    = $3C
KEY_INVERSE = $27
KEY_HELP    = $11

KEY_F1      = $03
KEY_F2      = $04
KEY_F3      = $13
KEY_F4      = $14

KEY_SHIFT   = $40
KEY_CTRL    = $80

; Composed keys

KEY_EXCLAMATIONMARK = KEY_1 | KEY_SHIFT
KEY_QUOTE           = KEY_2 | KEY_SHIFT
KEY_HASH            = KEY_3 | KEY_SHIFT
KEY_DOLLAR          = KEY_4 | KEY_SHIFT
KEY_PERCENT         = KEY_5 | KEY_SHIFT
KEY_AMPERSAND       = KEY_6 | KEY_SHIFT
KEY_APOSTROPHE      = KEY_7 | KEY_SHIFT
KEY_AT              = KEY_8 | KEY_SHIFT
KEY_OPENINGPARAN    = KEY_9 | KEY_SHIFT
KEY_CLOSINGPARAN    = KEY_0 | KEY_SHIFT
KEY_UNDERLINE       = KEY_DASH | KEY_SHIFT
KEY_BAR             = KEY_EQUALS | KEY_SHIFT
KEY_COLON           = KEY_SEMICOLON | KEY_SHIFT
KEY_BACKSLASH       = KEY_PLUS | KEY_SHIFT
KEY_CIRCUMFLEX      = KEY_ASTERISK | KEY_SHIFT
KEY_OPENINGBRACKET  = KEY_COMMA | KEY_SHIFT
KEY_CLOSINGBRACKET  = KEY_PERIOD | KEY_SHIFT
KEY_QUESTIONMARK    = KEY_SLASH | KEY_SHIFT
KEY_CLEAR           = KEY_LESSTHAN | KEY_SHIFT
KEY_INSERT          = KEY_GREATERTHAN | KEY_SHIFT

KEY_UP              = KEY_UNDERLINE | KEY_CTRL
KEY_DOWN            = KEY_EQUALS | KEY_CTRL
KEY_LEFT            = KEY_PLUS | KEY_CTRL
KEY_RIGHT           = KEY_ASTERISK | KEY_CTRL
