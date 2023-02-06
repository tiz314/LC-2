; Verifica divisibilità per 2
	.ORIG	x3000
	LEA	R0,A1
	LEA	R1,A2
	JSR	VERIF_DIV2
END	BRNZP	END


A1	.FILL	-56
	.FILL	15
	.FILL	-9
	.FILL	12
	.FILL	24
	.FILL	0


A2	.BLKW	5

; Inizio subp
; Utilizzo registri: 
; INPUT: R0: Array orig	
; 	 R1: Array dest
; R2: elemento caricato

VERIF_DIV2
	ST	R2,BK2
CHECK	LDR	R2,R0,#0
	BRZ	FINE
	AND	R2,R2,#1
	BRZ	SI
; Qui non è divisibile
	AND	R2,R2,#0
	STR	R2,R1,#0	
CONT	ADD	R0,R0,#1
	ADD	R1,R1,#1
	BRNZP	CHECK

SI	AND	R2,R2,#0
	ADD	R2,R2,#1
	STR	R2,R1,#0
	BRNZP	CONT	


FINE	LD	R2,BK2
	RET

BK2	.BLKW	1

; Fine subp

	.END