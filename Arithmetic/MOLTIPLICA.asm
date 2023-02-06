; Moltiplicazione di due numeri
	.ORIG	x3000
	LD	R0,A
	LD	R1,B
	JSR	MOLTIPLICA
END	BRNZP	END


A 	.FILL	-1000
B	.FILL	-70

; Inizio subp
; Utilizzo registri
; INPUT: 
; R0: a
; R1: b
; ---
; R2: contatore (da b a 0)
; R3: somma
; ---
; OUTPUT: 
; R0: prodotto
MOLTIPLICA
	ST	R2,BK2
	ST	R3,BK3
	
	ADD	R2,R1,#0
	BRZ	FINE		; Prodotto per 0, non devo fare nulla
	BRP 	NO_CONV
	NOT	R2,R2
	ADD	R2,R2,#1

	ADD	R0,R0,#0
	BRZP	NO_CONV
	NOT	R0,R0
	ADD	R0,R0,#1


NO_CONV	AND	R3,R3,#0

SOMMA	ADD	R3,R3,R0	; Aggiungo una volta a

	ADD	R2,R2,#-1
	BRZ	FINE
	JMP	SOMMA
	
FINE	ADD	R0,R3,#0
	LD	R2,BK2
	LD	R3,BK3
	RET
	

	


BK2	.BLKW	1
BK3	.BLKW	1

; Fine subp


	.END