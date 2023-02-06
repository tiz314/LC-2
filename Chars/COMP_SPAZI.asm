; Rimozione spazi
	.ORIG	x3000
	LEA	R0,S
	LEA	R1,F
	TRAP	x22
	JSR	COMP_SPAZI
	LEA	R0,F
	TRAP	x22
END	BRNZP	END

S	.STRINGZ	"a b  c      e"
F	.BLKW		30

; inizio subp

COMP_SPAZI
	ST	R2,BK2	
	ST	R3,BK3

	LD	R3,SPACE

CHECK	LDR	R2,R0,#0
	BRZ	FINE
	ADD	R2,R2,R3
	BRZ	PRIMO_SPAZIO
CONT	LDR	R2,R0,#0
	STR	R2,R1,#0
	ADD	R1,R1,#1
	ADD	R0,R0,#1
	BRNZP	CHECK	

PRIMO_SPAZIO
	LDR	R2,R0,#0
	STR	R2,R1,#0
	ADD	R0,R0,#1
	ADD	R1,R1,#1
	LDR	R2,R0,#0
	ADD	R2,R2,R3
	BRNP	CHECK
ALTRI	LDR	R2,R0,#0
	ADD	R2,R2,R3
	BRNP	CHECK
	ADD	R0,R0,#1
	BRNZP	ALTRI

FINE	LD	R2,BK2
	AND	R0,R0,#0
	STR	R0,R1,#1	; Inserisco 0 finale
	RET


SPACE	.FILL	#-32
BK2	.BLKW	1
BK3	.BLKW	1
; fine subp

	.END