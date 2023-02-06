; Cerca posizione numero passato in input
	.ORIG	x3000
	LEA	R0,ARRAY
	LD	R1,NUM
	JSR	CERCA_POS
END	BRNZP	END

ARRAY	.FILL	-56
	.FILL	15
	.FILL	-9
	.FILL	12
	.FILL	27
	.FILL	0
NUM	.FILL	-9

; inizio subp
; R2: elemento caricato
; R3: indice posizione

CERCA_POS
	ST	R2,BK2
	ST	R3,BK3
	
	AND	R3,R3,#0
	ADD	R3,R3,#1
	
CHECK	LDR	R2,R0,#0
	BRZ	NOT_FOUND	; Qui array vuoto

	ADD	R1,R1,#0
	BRP	CERCATO_POS
	ADD	R2,R2,#0
	BRP	CONT
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRZ	INC

CONT	ADD	R0,R0,#1
	ADD	R3,R3,#1
	BRNZP	CHECK

CERCATO_POS
	ADD	R2,R2,#0
	BRN	CONT
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRZ	INC
	BRNZP	CONT

INC	ADD	R0,R3,#0
	BRNZP   RESTORE
	
NOT_FOUND
	AND	R0,R0,#0
RESTORE	LD	R2,BK2
	LD	R3,BK3
	RET

BK2	.BLKW	1
BK3	.BLKW	1

; fine subp

	.END