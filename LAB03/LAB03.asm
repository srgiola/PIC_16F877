; ENTRADA RECEPTOR EN PORTC0
; CUANDO SE INTERRUMPE LA SE�AR LA ENTRADA ES 1

;RP1 RP0
; 00 BANCO 0 - 01 BANCO 1 - 10 BANCO 2 - 11 BANCO 3

CONFIGURACION
	ORG	0X00

	;BANCO 1
	BSF 	STATUS, RP0
	BCF		STATUS, RP1
	CLRF 	TRISB		;SALIDA
	BSF		TRISC, 0	;ENTRADA

	;BANCO 0
	BCF	STATUS, RP0

	MOVLW	B'00111111'	;SE MUESTRA EL CERO EN EL DISPLAY
	MOVWF	PORTB
	
START
	BTFSS 	PORTC, 0
	GOTO	START		;0
	GOTO	INCREMENTAR	;1

INCREMENTAR
	;SUBLW = (F - W)
	;SI LA RESTA = POSITIVA	,C=1 Z=0 PORTB - NUMERO > 0
	;SI LA RESTA = CERO	,C=1 Z=1 PORTB - NUMERO = 0
	;SI LA RESTA = NEGATIVA	,C=0 Z=1 PORTB - NUMERO < 0
	MOVF	PORTB, W
	SUBLW	B'00111111'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM2	;0
	GOTO	NUM1		;1
CHECKNUM2
	MOVF	PORTB, W
	SUBLW	B'00000110'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM3	;0
	GOTO	NUM2		;1
CHECKNUM3
	MOVF	PORTB, W
	SUBLW	B'01011011'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM4	;0
	GOTO	NUM3		;1
CHECKNUM4
	MOVF	PORTB, W
	SUBLW	B'01001111'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM5	;0
	GOTO	NUM4		;1
CHECKNUM5
	MOVF	PORTB, W
	SUBLW	B'01100110'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM6	;0
	GOTO	NUM5		;1
CHECKNUM6
	MOVF	PORTB, W
	SUBLW	B'01101101'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM7	;0
	GOTO	NUM6		;1
CHECKNUM7
	MOVF	PORTB, W
	SUBLW	B'01111101'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM8	;0
	GOTO	NUM7		;1
CHECKNUM8
	MOVF	PORTB, W
	SUBLW	B'00000111'
	BTFSS	STATUS, Z
	GOTO	CHECKNUM9	;0
	GOTO	NUM8		;1
CHECKNUM9
	MOVF	PORTB, W
	SUBLW	B'01111111'
	BTFSS	STATUS,	Z
	GOTO	NUM0		;0
	GOTO	NUM9		;1

NUM0
	MOVLW	B'00111111'
	MOVWF	PORTB
	GOTO 	FIN
NUM1
	MOVLW	B'00000110'
	MOVWF	PORTB
	GOTO	FIN
NUM2
	MOVLW	B'01011011'
	MOVWF	PORTB
	GOTO	FIN
NUM3
	MOVLW	B'01001111'
	MOVWF	PORTB
	GOTO	FIN
NUM4
	MOVLW	B'01100110'
	MOVWF	PORTB
	GOTO	FIN
NUM5
	MOVLW	B'01101101'
	MOVWF	PORTB
	GOTO	FIN
NUM6
	MOVLW	B'01111101'
	MOVWF	PORTB
	GOTO	FIN
NUM7
	MOVLW	B'00000111'
	MOVWF	PORTB
	GOTO	FIN
NUM8
	MOVLW	B'01111111'
	MOVWF	PORTB
	GOTO	FIN
NUM9
	MOVLW	B'01101111'
	MOVWF	PORTB
	GOTO	FIN
FIN
	GOTO START
	END