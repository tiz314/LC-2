; Conversione maiuscole
	.ORIG	x3000
	LEA	R0,A
	TRAP	x22
	JSR	CONV_MAIUS
	LEA	R0,A
	TRAP	x22
END	BRNZP	END

A	.STRINGZ	"Antani"
; inizio subp

CONV_MAIUS
	ST	R3,BK3
	ST	R4,BK4
	ST	R6,BK6

	AND	R4,R4,#0

CHECK	LDR	R3,R0,#0
	BRZ	FINE

	LD	R6,CH_MIN
	ADD	R3,R3,R6
	BRN	CONT
	LDR	R3,R0,#0
	LD	R6,CH_MAX
	ADD	R3,R3,R6
	BRP	CONT
	LDR	R3,R0,#0
	LD	R6,OFFSET
	ADD	R3,R3,R6
	STR	R3,R0,#0
	ADD	R4,R4,#1
CONT	ADD	R0,R0,#1
	JMP	CHECK
	
FINE	ADD	R0,R4,#0
	LD	R3,BK3
	LD	R4,BK4
	LD	R6,BK6
	RET

BK3	.BLKW	1
BK4	.BLKW	1
BK6	.BLKW	1
CH_MIN	.FILL	#-97
CH_MAX	.FILL	#-122
OFFSET	.FILL 	#-32
; fine subp

	.END