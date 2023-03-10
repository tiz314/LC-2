; Annulla spazi duplicati
	.ORIG	x3000
	LEA	R0,A
	LEA	R1,B
	JSR	ANNULLA_SPAZI
END	BRNZP	END


A	.STRINGZ	" a b  c   f        t"
B	.BLKW		10

ANNULLA_SPAZI
	ST	R3,BK3
	ST	R4,BK4

	AND	R4,R4,#0

	LD	R3,OFFSET

CHECK	LDR	R2,R0,#0
	BRZ	FINE
	
	ADD	R2,R2,R3
	BRZ	PRIMO
	LDR	R2,R0,#0
	STR	R2,R1,#0
	ADD	R0,R0,#1
	ADD	R1,R1,#1
	BRNZP	CHECK	

PRIMO	LDR	R2,R0,#0
	STR	R2,R1,#0
	ADD	R0,R0,#1
	ADD	R1,R1,#1
DUPL	LDR	R2,R0,#0
	BRZ	FINE
	ADD	R2,R2,R3
	BRNP	CHECK
	ADD	R0,R0,#1	; trovato uno spazio extra
	ADD	R4,R4,#1
	BRNZP	DUPL

FINE	AND	R2,R2,#0
	STR	R2,R1,#1
	ADD	R2,R4,#0
	LD	R3,BK3
	LD	R4,BK4
	RET
	
BK3	.BLKW	1
BK4	.BLKW	1
OFFSET	.FILL	#-32
	.END