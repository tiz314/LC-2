; Trova minimo valore assoluto
	.ORIG	x3000
	LEA	R0,A
	JSR	TROVA_MIN
END	BRNZP	END

A	.FILL	112
	.FILL	0

; Inizio subp
; Registri
; Input: R0: indirizzo array
; ---
; R1: minimo
; R2: elemento caricato
; ---
; output: R0: minimo valore asosluto

TROVA_MIN
	ST	R1,BK1
	ST	R2,BK2

	LDR	R1,R0,#0
	BRZ	FINE
	BRP	NO_CONV
	NOT	R1,R1
	ADD	R1,R1,#1
NO_CONV	ADD	R0,R0,#1
CHECK	LDR	R2,R0,#0
	BRZ	FINE
	BRN	NO
	NOT	R2,R2
	ADD	R2,R2,#1
NO	ADD	R2,R2,R1
	BRP	NEW_MIN
CONT	ADD	R0,R0,#1
	BRNZP	CHECK

NEW_MIN	LDR	R1,R0,#0
	BRP	CONT
	NOT	R1,R1
	ADD	R1,R1,#1
	BRNZP	CONT
FINE	ADD	R0,R1,#0
	LD	R1,BK1
	LD	R2,BK2
	RET

BK1	.BLKW	1
BK2	.BLKW	1

; Fine subp

	.END