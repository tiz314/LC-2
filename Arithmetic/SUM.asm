; Somma con traboccamento
	.ORIG	x3000
	LD	R0,A
	LD	R1,B
	JSR	SUM
END	BRNZP	END	


A	.FILL	0
B	.FILL	0
; inizio supb

SUM
	ADD	R0,R0,#0
	BRZP	A_POS
; qui a negativo
	ADD	R1,R1,#0
	BRZP	SOMMA
; qui entrambi negativi
	ADD	R0,R0,R1
	BRN	OK	
; qui under
	AND	R1,R1,#0
	ADD	R1,R1,#-1
	BRNZP	FINE

A_POS	ADD	R1,R1,#0
	BRNZ	SOMMA
; qui entrambi positivi
	ADD	R0,R0,R1
	BRZP	OK
; qui over
	AND	R1,R1,#0
	ADD	R1,R1,#1
	BRNZP	FINE	

OK	AND	R1,R1,#0
	BRNZP	FINE

SOMMA	ADD	R0,R0,R1
	AND	R1,R1,#0	
FINE	RET	

; fine subp
	.END