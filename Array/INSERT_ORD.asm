; Inserimento ordinato
	.ORIG	x3000
	LEA	R0,AR
	LD	R1,NUM
	JSR	INSERT_ORD
END	BRNZP	END

AR	.FILL	12
	.FILL	3
	.FILL	-15
	.FILL	-56
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
	BRN	CONT		; Il numero nell'array è negativo, quindi non può essere maggiore
	LDR	R2,R0,#1	; Carico il successivo
	BRNZ	FOUND		; Se il successivo è negativo sicuramente minore. Se nullo significa che è finito l'array
	NOT	R2,R2
	ADD	R2,R2,#1	; Altrimenti lo rendo negativo
	ADD	R2,R2,R1	; Sommo con numero da inserire
	BRZP	FOUND		; se la somma è nulla o positiva, allora il numero in array è minore, quindi posso inserire
	BRNZP	CONT		; Altrimenti ricomincia con la ricerca
	

INS_NEG
	ADD	R2,R2,#0
	BRP	CH_MIN		; se è positivo, controllo direttamente il successivo
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRP	CONT		; se numero da inserire + tetto negativo è positivo, allora continuo
CH_MIN	LDR	R2,R0,#1
	BRP	CONT
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R1
	BRZP	FOUND
	BRNZP	CONT

CONT	ADD	R0,R0,#1
	BRNZP	CHECK

FOUND	ADD	R0,R0,#1	; Mi sposto di un elemento, per posizionarmi sul primo da backuppare
	LDR	R2,R0,#0
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