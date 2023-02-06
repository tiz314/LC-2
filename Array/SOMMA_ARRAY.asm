; Somma di array in altro array e conto over/under flow

	.ORIG	x3000
	LEA	R0, AR0
	LEA	R1, AR1
	LEA	R2, AR2
	JSR 	SOMMA_ARRAY
FINE	BRNZP	FINE


AR0	.FILL	32760
	.FILL	7
	.FILL	-32760
	.FILL	8
	.FILL	0

AR1	.FILL	8
	.FILL	17
	.FILL	-9
	.FILL	-9
	.FILL	0

AR2	.BLKW	10


; Inizio sottoprograma
; uso registri:
; R0: indirizzo ar0
; R1: indirizzo ar1
; R2: indirizzo ar2
; R3: Somma
; R4: Conta traboccamenti
; R5: contenuto r0
; R6: Contenuto r1


SOMMA_ARRAY
	BRNZP	BACKUP
INIZIO	LDR	R5, R0, #0
	BRZ	RESTORE
	LDR	R6, R1, #0
	BRZ	RESTORE		; Check se almeno uno dei due numeri è 0, se sì vado a restore
	ADD	R3, R5, R6	
	ADD	R5, R5, #0	; Refresh CC di numeri sommati
	BRP	A_POS	
	BRNZP	A_NEG
CONTINUA
	STR	R3, R2, #0	; Salvo somma ad indirizzo puntato da R2
	ADD	R2, R2, #1	; Incremento tutti i puntatori
	ADD	R0, R0, #1
	ADD	R1, R1, #1
	BRNZP 	INIZIO
	

A_POS	ADD	R6, R6, #0
	BRN	CONTINUA
	ADD	R3, R3, #0
	BRN	ADD_R4 		; Se A positivo e B positivo ma Somma negativa, incremento contatore traboccamenti
	BRNZP	CONTINUA

A_NEG	ADD	R6, R6, #0
	BRP	CONTINUA
	ADD	R3, R3, #0
	BRP	ADD_R4		; Stessa logica in caso di A negativo
	BRNZP	CONTINUA

ADD_R4	ADD	R4, R4, #1
	BRNZP	CONTINUA

BACKUP	ST	R3, BACK3
	ST	R4, BACK4
	ST	R5, BACK5
	ST	R6, BACK6
	AND	R4, R4, #0	; Preparo registri extra da usare
	BRNZP	INIZIO

RESTORE	ADD	R0, R4, #0
	LD	R3, BACK3
	LD	R4, BACK4
	LD	R5, BACK5
	LD	R6, BACK6	; Preparo a ritornare, sposto R4 in R0 come richiesto
	RET


BACK3 .BLKW	1
BACK4 .BLKW	1
BACK5 .BLKW	1
BACK6 .BLKW	1

	.END
