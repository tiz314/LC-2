; Conteggio frequenze
	.ORIG	x3000
	LEA	R0,A
	JSR	KCAL
END	BRNZP	END

A	.STRINGZ	"PPFPSPFSSP"

; inizio subp

KCAL
	ST	R1,BK1
	ST	R2,BK2
	ST	R3,BK3

	AND	R2,R2,#0

CHECK	LDR	R1,R0,#0
	BRZ	FINE

	LD	R3,P
	ADD	R1,R1,R3
	BRZ	INC_P
	LDR	R1,R0,#0
	LD	R3,F
	ADD	R1,R1,R3
	BRZ	INC_F
	BRNZP	INC_S

INC_P	ADD	R2,R2,#1
	BRNZP	CONT

INC_F	ADD	R2,R2,#2
	BRNZP	CONT

INC_S	ADD	R2,R2,#4

CONT	ADD	R0,R0,#1
	BRNZP	CHECK
	
FINE	ADD	R0,R2,#0
	LD	R2,BK2
	LD	R3,BK3
	LD	R1,BK1
	RET
	

BK1	.BLKW	1
BK2	.BLKW	1
BK3	.BLKW	1

P	.FILL	#-80
F	.FILL	#-70

; fine subp

	.END