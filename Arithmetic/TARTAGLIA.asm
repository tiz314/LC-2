; Triangolo di Tartaglia
	.ORIG	x3000
	LEA	R0,A
	LEA	R1,T
	JSR	TARTAGLIA
END	BRNZP	END


A	.FILL	1
	.FILL	3
	.FILL	3
	.FILL	1
	.FILL	0
T	.BLKW	5
; inizio subp

TARTAGLIA
	ST	R2,BK2
	ST	R3,BK3

	LDR	R2,R0,#0
	BRZ	FINE
	ADD	R2,R2,#-1
	BRNP	CHECK
	LDR	R2,R0,#0
	STR	R2,R1,#0
	ADD	R3,R2,#0
	ADD	R0,R0,#1
	ADD	R1,R1,#1
	
CHECK	LDR	R2,R0,#0
	BRZ	FINE
	ADD	R2,R2,#-1
	BRZ	UNO
	LDR	R2,R0,#0
	ADD	R2,R2,R3
	STR	R2,R1,#0
CONT	LDR	R2,R0,#0
	ADD	R3,R2,#0
	ADD	R0,R0,#1
	ADD	R1,R1,#1
	BRNZP	CHECK
		
UNO	LDR	R2,R0,#0
	ADD	R2,R2,R3	
	STR	R2,R1,#0
	BRNZP	CONT

FINE	AND	R2,R2,#0
	ADD	R2,R2,#1
	STR	R2,R1,#0
	LD	R2,BK2
	LD	R3,BK3
	RET

BK2	.BLKW	1
BK3	.BLKW	1
; fine subp
	.END