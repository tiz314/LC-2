	.ORIG	x3000
	
	LEA	R0,S
	LD	R1,A
	LD	R2,B
	JSR	TROVA_COPPIA
END	BRNZP	END

A	.FILL	109
B	.FILL	97
S	.STRINGZ	"ciao papa"
; inizio subp

TROVA_COPPIA
	ST	R3,BK3
	ST	R4,BK4

	AND	R4,R4,#0
	ADD	R4,R4,#1

	NOT	R1,R1
	ADD	R1,R1,#1
	NOT	R2,R2
	ADD	R2,R2,#1
	

CHECK	LDR	R3,R0,#0
	BRZ	NOT_FOUND
	LDR	R3,R0,#1
	BRZ	NOT_FOUND

	LDR	R3,R0,#0

	ADD	R3,R3,R1
	BRNP	CONT
	LDR	R3,R0,#1
	ADD	R3,R3,R2
	BRZ	FINE
CONT	ADD	R0,R0,#1
	ADD	R4,R4,#1
	BRNZP	CHECK
FINE	ADD	R0,R4,#0
	LD	R3,BK3
	LD	R4,BK4
	RET

NOT_FOUND
	AND	R4,R4,#0
	BRNZP	FINE
	
BK3	.BLKW	1
BK4	.BLKW	1
; fine subp
	.END