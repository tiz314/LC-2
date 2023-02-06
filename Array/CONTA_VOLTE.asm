; Data stringa e lettera maiuscola, restituisci numero di occorrenze della lettera maiuscola e della lettera minuscola
	.ORIG	x3000
	LEA	R0, STRINGA
	LD	R1, LETT
	JSR	CONTA_VOLTE
END	BRNZP	END


STRINGA	.STRINGZ	"Buon Lunedi 7 febbraio 2011"
LETT	.FILL		66

; Inizio subp
; Utilizzo registri
; INPUT: R0: array
; 	 R1: lettera cercata (negativa)
; R2: elemento caricato
; R3: offset negativo
; R4: conta maiusc
; R5: conta minusc
; OUPUT: R0: occorrenze maiuscola
;	 R1: occorrenze minuscola


CONTA_VOLTE
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4
	ST	R5,BK5

	AND	R4,R4,#0
	AND	R5,R5,#0

	NOT	R1,R1
	ADD	R1,R1,#1 	; rendo lettera cercata negativa

	LD	R3,SPACE

CHECK	LDR	R2,R0,#0
	BRZ	FINE		; Se 0 fine stringa ed esco

	ADD	R2,R2,R1
	BRZ	INC_MAIUSC
	ADD	R2,R2,R3	; Altrimenti provo a sottrarre offset necessario per minuscola
	BRZ	INC_MINUSC
; Qui niente, proseguo
CONT	ADD	R0,R0,#1
	BRNZP	CHECK

INC_MAIUSC
	ADD	R4,R4,#1
	BRNZP	CONT

INC_MINUSC	
	ADD	R5,R5,#1
	BRNZP	CONT

FINE	ADD	R0,R4,#0
	ADD	R1,R5,#0
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	LD	R5,BK5
	RET


SPACE 	.FILL	#-32

BK1	.BLKW	1
BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1
BK5	.BLKW	1

; Fine subp

	.END