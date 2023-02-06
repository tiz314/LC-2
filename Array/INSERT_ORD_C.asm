; Inserimento ordinato crescente
	.ORIG	x3000
	LEA	R0,AR
	LD	R1,NUM
	JSR	INSERT_ORD
END	BRNZP	END

AR	.FILL	-56
	.FILL	-15
	.FILL	3
	.FILL	12
	.FILL	0
	.BLKW	1
NUM	.FILL	-9

; Inizio subp
; Utilizzo registri
; INPUT: 
; R0: indirizzo array
; R1: numero da inserire
; ---
; R2: elemento caricato
; R3: shift
INSERT_ORD
	ST	R2,BK2
	ST	R3,BK3
	
CHECK	LDR	R2,R0,#0
	BRZ	FOUND		; Array vuoto, procedo inserendo il numero nello spazio a disposizione
	ADD	R1,R1,#0
	BRP	INS_POS		; Il numero da inserire è positivo
	BRNZP	INS_NEG		; Altrimenti negativo

INS_POS
	ADD	R2,R2,#0
	BRN	CH_SUP
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRN	CONT
CH_SUP	LDR	R2,R0,#1
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRNZ	FOUND
	BRNZP	CONT


INS_NEG
	ADD	R2,R2,#0
	BRP	FOUND
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRN	CONT
	LDR	R2,R0,#1
	BRP	FOUND
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRNZ	FOUND
	BRNZP	CONT

CONT	ADD	R0,R0,#1
	BRNZP	CHECK

FOUND	ADD	R2,R2,#0	; se elemento caricato è 0, non incrementare dovendo shiftare a partire da quella posizione
	BRZ	NO_INC
	ADD	R0,R0,#1	; Mi sposto di un elemento, per posizionarmi sul primo da backuppare
NO_INC	LDR	R2,R0,#0
	STR	R1,R0,#0
	ADD	R0,R0,#1
SHIFT	LDR	R3,R0,#0
	STR	R2,R0,#0
	ADD	R2,R3,#0
	BRZ	FINE
	ADD	R0,R0,#1
	BRNZP	SHIFT

FINE	LD	R2,BK2
	LD	R3,BK3
	RET


BK2	.BLKW	1
BK3	.BLKW	1
; Fine subp

	.END