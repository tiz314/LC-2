; Trova posizione del minimo valore assoluto
	.ORIG	x3000
	LEA	R0,ARRAY
	LD	R1,NUM
	JSR	TROVA_MIN_ASS
END	BRNZP	END

ARRAY	.FILL	-2
	.FILL	13
	.FILL	2
	.FILL	12
	.FILL	27
NUM	.FILL	5

; Inizio subp
; Utilizzo registri
; INPUT: R0: indirizzo array
; 	 R1: numero elementi
; R2: min (negativo)
; R3: elemento caricato
; R4: indice (da azzerare)
; R5: check indice
; R6: backup R0
; OUTPUT: R0: indice minimo abs


TROVA_MIN_ASS
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4
	ST	R5,BK5
	ST	R6,BK6
	ADD	R6,R0,#0
	AND	R4,R4,#0
	NOT	R1,R1
	ADD	R1,R1,#1	; Inverto numero elementi
	ADD	R5,R4,R1	; Check posizione in cui sono
	BRZ	FINE		; Se array vuoto esco
	LDR	R2,R0,#0	; Carico primo elemento
	BRNZ	M_N		; numero già negativo
	NOT	R2,R2
	ADD	R2,R2,#1
M_N	ADD	R0,R0,#1
	ADD	R4,R4,#1
	ADD	R5,R4,R1	; Check indice
	BRZ	FINE
	LDR	R3,R0,#0	; Carico elemento
	BRZP	R3_POS
	NOT	R3,R3
	ADD	R3,R3,#1	; Se negativo lo rendo positivo
R3_POS	ADD	R3,R3,R2	; Check tra elemento e minimo
	BRN	NEW_N		; Se negativa significa che R3 positivo più piccolo
	BRNZP	M_N

NEW_N	LDR	R2,R0,#0	; Carico nuovo minimo in R2
	BRNZ	M_N		; Vado a nuovo check
	NOT	R2,R2
	ADD	R2,R2,#1	; Lo rendo eventualmente negativo
	BRNZP	M_N


FINE	AND	R4,R4,#0	; Riazzero indice
CHECK	LDR	R3,R6,#0	; Carico il primo elemento
	BRZP	CONT		; se positivo o nullo continuo
	NOT	R3,R3
	ADD	R3,R3,#1	
CONT	ADD	R3,R3,R2	; Check con min
	BRZ	FOUND
	ADD	R4,R4,#1
	ADD	R6,R6,#1
	BRNZP	CHECK

FOUND	ADD	R0,R4,#0
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


; Fine subp

	.END