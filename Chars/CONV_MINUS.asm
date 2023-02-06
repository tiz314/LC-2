; Converti in minuscolo e restituisci num lettere convertite
	.ORIG	x3000
	LEA	R0,S
	JSR	CONV_MINUS
END	BRNZP	END


S	.STRINGZ	"Un eSEmpio dI uSo STRano deLLe LETTeRe"

; Inizio subp
; Utilizzo registri
; Input: R0 stringa
; R1: elemento caricato
; R2: contatore conversioni
; R3: check e offset conversione
; Output: R0 numero lettere convertite

CONV_MINUS
	ST	R1,BK1
	ST	R2,BK2
	ST	R3,BK3

	AND	R2,R2,#0
	
CHECK	LDR	R1,R0,#0
	BRZ	FINE		; Se 0 stringa vuota

	LD	R3,MIN	
	ADD	R1,R1,R3
	BRN	CONT
	LD	R3,MAX
	LDR	R1,R0,#0
	ADD	R1,R1,R3
	BRP	CONT
	LD	R3,OFFSET
	LDR	R1,R0,#0
	ADD	R1,R1,R3
	STR	R1,R0,#0
	ADD	R2,R2,#1
CONT	ADD	R0,R0,#1
	BRNZP	CHECK

FINE	ADD	R0,R2,#0
	LD	R1,BK1
	LD	R2,BK2
	LD	R3,BK3
	RET


BK1	.BLKW	1
BK2	.BLKW	1
BK3	.BLKW	1

OFFSET	.FILL	#32
MIN	.FILL	#-65 		; se maiusc deve essere positivo o nullo
MAX	.FILL	#-90		; Se maiusc deve essere negativo o nullo

; Fine subp

	.END