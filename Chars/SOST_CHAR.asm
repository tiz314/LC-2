; Sostituisci char con dato, se trovato maiuscolo, sostituisci maiuscolo
	.ORIG	x3000
	LEA	R0,A
	LD	R1,B
	LD	R2,C
	TRAP	x22
	JSR	SOST_CHAR
	LEA	R0,A
	TRAP	x22
END	BRNZP	END

A 	.STRINGZ	"La lapvde rvporta la data MCMXXV"
B	.FILL		#118
C	.FILL		#105

; inizio subp

SOST_CHAR
	ST	R4,BK4	
	ST	R5,BK5

	ADD	R5,R1,#0
	LD	R4,OFFSET
	ADD	R5,R5,R4
	NOT	R5,R5
	ADD	R5,R5,#1	; R5 contiene carattere da cercare in negativo e maiuscolo

	NOT	R1,R1
	ADD	R1,R1,#1	; R1 contiene carattere da cercare in negativo e minuscolo

CHECK	LDR	R4,R0,#0
	BRZ	FINE		; stringa vuota
	
	ADD	R4,R4,R1
	BRZ	SWAP_MINUSC
	
	LDR	R4,R0,#0
	ADD	R4,R4,R5
	BRZ	SWAP_MAIUSC

CONT	ADD	R0,R0,#1
	BRNZP 	CHECK

FINE	LD	R4,BK4
	LD	R5,BK5
	RET


SWAP_MINUSC
	STR	R2,R0,#0
	BRNZP	CONT

SWAP_MAIUSC
	LD	R4,OFFSET
	ADD	R5,R2,R4
	STR	R5,R0,#0
	BRNZP	CHECK	
	


BK4	.BLKW	1	; elemento caricato
BK5	.BLKW	1	; carattere da eliminare cambiato di segno e maiuscolo
OFFSET	.FILL	#-32
; fine subp

	.END