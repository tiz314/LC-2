; Sottrai elementi due array e salva in un altro 
	.ORIG	x3000
	LEA	R0,A0
	LEA	R1,A1
	LEA	R2,A2
	JSR	SOTTRAI_ARRAY
FINE	BRNZP	FINE


A0	.FILL	32767
	.FILL	-4
	.FILL	-5
	.FILL	0


A1	.FILL	-4
	.FILL	3
	.FILL	-4
	.FILL	0

A2 	.BLKW	4


SOTTRAI_ARRAY
	BRNZP	BACKUP
INIZIO	LDR	R5,R0,#0	; Se raggiungo 0, vado a restore. Solamente un solo controllo perche' da traccia indicata stessa dimensione, quindi duplice controllo sarebbe superfluo
	BRZ	RESTORE
	LDR	R6,R1,#0
	NOT	R6,R6		; Complemento a 2 di uno degli operandi
	ADD	R6,R6,#1
	ADD	R3,R5,R6
	ADD	R5,R5,#0	; Check segno di R5
	BRP	A_P
	BRN	A_N
CONTINUA
	STR	R3,R2,#0
	ADD	R0,R0,#1
	ADD	R1,R1,#1
	ADD	R2,R2,#1
	BRNZP	INIZIO

A_P	ADD	R6,R6,#0
	BRNZ	CONTINUA	; Se discorde con R6, Salto a continua
	ADD	R3,R3,#0
	BRN	TRAB		; Se concorde con R6 ma discorde con somma, traboccamento
	BRNZP	CONTINUA

A_N	ADD	R6,R6,#0
	BRZP	CONTINUA
	ADD	R3,R3,#0
	BRP	TRAB
	BRNZP	CONTINUA

TRAB	ADD	R4,R4,#1	; Aggiungo un traboccamento
	BRNZP	CONTINUA

BACKUP	ST	R3,BK3 		; Backup dei registri extra utilizzati
	ST	R4,BK4
	ST	R5,BK5
	ST	R6,BK6
	AND	R4,R4,#0
	BRNZP	INIZIO
	
RESTORE
	ADD	R0,R4,#0	; Salvo conta traboccamenti in R0
	LD	R3,BK3
	LD	R4,BK4
	LD	R5,BK5
	LD	R6,BK6
	RET


BK3	.BLKW	1
BK4	.BLKW	1
BK5	.BLKW	1
BK6	.BLKW	1

	.END