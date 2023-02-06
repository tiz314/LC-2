; Sequenza di fibonacci
	.ORIG	x3000
	LD	R0,NUM
	JSR	FIBONACCI
END	BRNZP	END

NUM	.FILL	10
; inizio subp
FIBONACCI
	ST	R1,BK1
	ST	R2,BK2
	ST	R3,BK3
	
	AND	R1,R1,#0
	
	ADD	R0,R0,#0
	BRNZ	NEGATIVO
	ADD	R2,R0,#-2
	BRNZ	BASE
; Qui devo calcolare, ovvero n maggiore di 2
	ADD	R1,R1,#2
	ADD	R0,R0,#-3
	BRZ	FINE
	AND	R2,R2,#0
	AND	R3,R3,#0
	ADD	R3,R3,#1
	ADD	R2,R2,R1

CONT	AND	R1,R1,#0
	ADD	R1,R2,R3
	ADD	R3,R2,#0
	ADD	R2,R1,#0
	ADD	R0,R0,#-1
	BRP	CONT

FINE	ADD	R0,R1,#0
RESTORE
	LD	R1,BK1
	LD	R2,BK2
	LD	R3,BK3
	RET

NEGATIVO
	AND	R0,R0,#0
	BRNZP	RESTORE

BASE	AND	R0,R0,#0
	ADD	R0,R0,#1
	BRNZP	RESTORE	
		

BK1	.BLKW	1	; somma finale
BK2	.BLKW	1	; ultimo elemento
BK3	.BLKW	1	; penultimo elemento
; fine subp

	.END