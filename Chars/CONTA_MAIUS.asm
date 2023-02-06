; Conta maiuscole e altre occorrenze	
	.ORIG	x3000
	LEA	R0,STRI
	JSR	CONTA_MAIUS
END	BRNZP	END


STRI	.STRINGZ "Buon Lunedi 18 aprile 2011"
; Utilizzo registri: 
; INPUT: R0 stringa
; OUTPUT: R0: numero lettere maiuscole
; 	  R1: numero altri caratteri
; R2: Contatore maiuscole
; R1: Contatore altro
; R3: elemento caricato
; R4: check
; inizio subp

CONTA_MAIUS
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4

	AND	R1,R1,#0
	AND	R2,R2,#0

CHECK	LDR	R3,R0,#0
	BRZ	FINE		; Fine raggiunta
	
	LD	R4,MA_MIN
	ADD	R3,R3,R4
	BRN	NO
	LDR	R3,R0,#0
	LD	R4,MA_MAX
	ADD	R3,R3,R4
	BRP	NO
	ADD	R2,R2,#1
CONT	ADD	R0,R0,#1
	JMP 	CHECK
	

NO	ADD	R1,R1,#1
	JMP	CONT

FINE	ADD	R0,R2,#0
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	RET


MA_MIN	.FILL	#-65
MA_MAX	.FILL	#-90

BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1
; Fine subp

	.END