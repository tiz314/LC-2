; Sequenza
	.ORIG	x3000
	LD	R0,A
	JSR	SEQMOD
END	BRNZP	END

A	.FILL	8


SEQMOD
	ST	R1,BK1
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4

	ADD	R0,R0,#0
	BRN	NEGATIVO
	
	AND	R2,R2,#0
	ADD	R2,R2,#1
	ADD	R3,R2,#0

	ADD	R1,R0,#-2
	BRNZ	BASE
; qui necessari calcoli
	ADD	R0,R0,#-2
CONTA	ADD	R4,R2,#0
	BRZP	NO_ABS
	NOT	R4,R4
	ADD	R4,R4,#1	; qui valore assoluto di Sn-1
NO_ABS	ADD	R1,R3,#0	; copio penultimo in R0 per definire doppio negativo
	ADD	R1,R1,R1
	NOT	R1,R1
	ADD	R1,R1,#1
	ADD	R1,R1,R4
	ADD	R3,R2,#0	; sposto nuovo valore in penultimo
	ADD	R2,R1,#0	; sposto nuovo valore in ultimo
	ADD	R0,R0,#-1
	BRZ	FINE
	BRNZP	CONTA

FINE	ADD	R0,R2,#0
	BRNZP	RESTORE
	


NEGATIVO
	AND	R0,R0,#0
	BRNZP	RESTORE

BASE	ADD	R0,R2,#0
	BRNZP	RESTORE


RESTORE
	LD	R1,BK1
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	RET	



BK1	.BLKW	1
BK2	.BLKW	1	; ultimo
BK3	.BLKW	1	; penultimo
BK4	.BLKW	1
	.END