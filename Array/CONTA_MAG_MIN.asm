; Restituisci differenza conteggio maggiori e minori
	.ORIG	x3000
	LEA	R0,A
	LD	R1,B
	JSR	CONTA_MAG_MIN
END	BRNZP	END

A	.FILL	112
	.FILL	-27
	.FILL	-1232
	.FILL	450
	.FILL	15
	.FILL	0

B	.FILL	0
; inizio subp
CONTA_MAG_MIN
	ST	R2,BK2
	ST	R3,BK3
	AND	R2,R2,#0
	
CHECK	LDR	R3,R0,#0
	BRZ	FINE	; Se 0 finito
	ADD	R1,R1,#0
	BRZP	POS	; numero in R1 positivo
; qui numero R1 negativo
	ADD	R3,R3,#0
	BRP	INC	
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R3,R3,R1
	BRP	DEC
	BRN	INC

CONT	ADD	R0,R0,#1
	BRNZP	CHECK

POS	ADD	R3,R3,#0
	BRN	DEC	
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R3,R3,R1
	BRN	INC
	BRP	DEC
	BRNZP	CONT

INC	ADD	R2,R2,#1
	BRNZP	CONT

DEC	ADD	R2,R2,#-1
	BRNZP	CONT

FINE	ADD	R0,R2,#0
	LD	R2,BK2
	LD	R3,BK3
	RET


BK2	.BLKW	1	; Contatore (sommo se maggiore, sottraggo se minore)
BK3	.BLKW	1	; Elemento caricato

; fine subp

	.END