; Trova pos max abs
	.ORIG	x3000
	LEA 	R0,ARRAY
	LD	R1,NUM
	JSR	TROVA_POS_MAX
END	BRNZP	END


ARRAY	.FILL	0
	.FILL	-2
	.FILL	2
	.FILL	-1
NUM	.FILL	4


; Inizio sub

; Utilizzo dei registri
; Input: R0 indirizzo array
;	 R1 numero elementi
; R2 MAX
; R3 indice
; R4 Backup R0
; R5 elemento caricato
; R6 check indice
; 
; Output: R0 indice max abs


TROVA_POS_MAX
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4
	ST	R5,BK5
	ST	R6,BK6
	NOT	R1,R1
	ADD	R1,R1,#2	; Rendo numero elementi negativo per check e sommo 1 per fermarmi a n-1
	AND	R3,R3,#0	; Azzero contatore indice
	LDR	R2,R0,#0 	; Caricamento del MAX iniziale
	ADD	R4,R0,#0	; Backup di R0 in R4, per utilizzo dopo con ricerca
	BRNZ	CHECK
	NOT	R2,R2
	ADD	R2,R2,#1	; Se positivo lo rendo negativo
CHECK	ADD	R6,R3,R1
	BRZ	RESTORE		; Se raggiunto numero max di elementi, vado a restore
	ADD	R0,R0,#1
	LDR	R5,R0,#0	; Carico nuovo elemento in R5
	BRP	MAG		; Se già positivo vado avanti, altrimenti lo rendo positivo
	NOT	R5,R5
	ADD	R5,R5,#1
MAG	ADD	R5,R2,R5	; Sommo max negativo e elemento in R5
	BRP	CAMBIA		; Se trovo nuovo max aggiorno
CONT	ADD	R3,R3,#1	; Incremento indice
	BRNZP	CHECK

CAMBIA	LDR	R2,R0,#0 	; ricarico elemento che deve diventare il nuovo max in R2
	BRNZ	CONT		; Se già negativo vado a check, altrimenti lo rendo negativo
	NOT	R2,R2
	ADD	R2,R2,#1
	BRNZP	CONT


RESTORE
	AND	R3,R3,#0	; Riazzero R3
CERCA	LDR	R5,R4,#0	; Carico elemento in R5
	BRZP	SOMMA
	NOT	R5,R5
	ADD	R5,R5,#1	; Se elemento negativo lo rendo positivo
SOMMA	ADD	R5,R5,R2	; Sommo elemento positivo con max negativo
	BRZ	FINE		; Trovato il max
	ADD	R4,R4,#1	; Incremento indirizzo
	ADD	R3,R3,#1
	ADD	R6,R3,R1
	BRZ	FINE
	BRNZP	CERCA
FINE	ADD	R0,R3,#0	; Se arrivato a fine, carico indice in R0 come richiesto
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	LD	R5,BK5
	LD	R6,BK6
	RET



BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1
BK5	.BLKW	1
BK6	.BLKW	1


; Fine sub


	.END