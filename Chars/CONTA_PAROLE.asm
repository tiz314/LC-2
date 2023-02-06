; Conta parole
	.ORIG	x3000
	LEA	R0,STRINGA
	LEA	R1,LAST
	ADD	R1,R1,#-2
	JSR	CONTA_PAROLE
END	BRNZP	END


STRINGA .STRINGZ "Nel mezzo del cammin di nostra vita, mi ritrovai per una selva oscura, che' la diritta via era smarrita."
LAST	.BLKW	1

; Inizio subp
; Utilizzo registri
; INPUT: R0: stringa
; 	 R1: ultimo char
; R2: spazio
; R3: char caricato
; R4: contatore
; R4: check pos
; OUTPUT: numero di parole nella frase

CONTA_PAROLE
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4
	ST	R5,BK5
	
	LD	R2,SPACE
	AND	R4,R4,#0

	NOT	R1,R1
	ADD	R1,R1,#1

CHECK	ADD	R5,R1,R0
	BRP	FINE
	LDR	R3,R0,#0
	ADD	R3,R3,R2
	BRNP	CONT
	ADD	R4,R4,#1
CONT	ADD	R0,R0,#1
	BRNZP	CHECK

FINE	ADD	R0,R4,#1
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	RET		

BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1
BK5	.BLKW	1
SPACE	.FILL	-32

; Fine subp

	.END