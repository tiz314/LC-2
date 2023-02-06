; Restituisce in R0 il numero di simboli composti da un solo carattere, in R1 quelli composti da 2 caratteri
	.ORIG	x3000
	LEA	R0, FRASE
	JSR	CONTA_1_2
END	BRNZP	END

FRASE	.STRINGZ	"AB A BC AS F ED"

; Inizio subp
; utilizzo registri: 
; INPUT: R0: indirizzo frase
; R2: spazio (negativo)
; R3: elemento caricato
; R4: contatore 1 char
; R5: contatore 2 char
; OUTPUT R0: numero di simboli 1 char
; 	 R1: numero di simboli 2 char


CONTA_1_2
	ST	R2,BK2
	ST	R3,BK2
	ST	R4,BK4
	ST	R5,BK5
	
	AND	R4,R4,#0
	AND	R5,R5,#0
	
	LD	R2,SPACE

CHECK	LDR	R3,R0,#0
	BRZ	FINE		; Se 0 stringa vuota
	
	ADD	R3,R3,R2	; se nuovo elemento è uno spazio, incremento e ricomincio direttamente
	BRNP	CONT
	ADD	R0,R0,#1
	BRNZP	CHECK

CONT	ADD	R0,R0,#1
	LDR	R3,R0,#0	; Controllo anche successivo, in caso di stringa con un solo elemento
	BRZ	FINE
; Qui ho stringa con almeno due elementi (char o spazio)
	ADD	R3,R3,R2	; sommo spazio negativo
	BRZ	INC_1		; Se trovo spazio ho trovato simbolo da 1 char
	ADD	R5,R5,#1	; Altrimenti sicuramente 2 char essendo stringa ben formata
	ADD	R0,R0,#1	; qui incremento di 3 per saltare a nuovo elemento da controllare 
	BRNZP	CHECK

INC_1	ADD	R4,R4,#1
	ADD	R0,R0,#1	; in questo caso invece incremento solo di 2 per arrivare al nuovo elemento da controllare
	BRNZP	CHECK


FINE	ADD	R0,R4,#0
	ADD	R1,R5,#0
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	LD	R5,BK5
	RET

BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1
BK5	.BLKW	1


SPACE	.FILL	#-32

; Fine subp

	.END