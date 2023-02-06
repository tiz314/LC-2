; Inserimento ordinato in array
	.ORIG	x3000
	LEA	R0,I_A
	LEA	R1,F_A
	LD	R2,NUM
	JSR	INS_ORD
END	BRNZP	END



I_A	.FILL	112
	.FILL	27
	.FILL	0
	.FILL	-2
F_A	.FILL	-56
	.BLKW	1
NUM	.FILL	-1

; Inizio subp
; utilizzo registri
; INPUT: R0: inizio array
; 	 R1: fine array
; 	 R2: numero da inserire
; 
; R3: elemento caricato da array e check andamento ciclo somma indirizzi
; R4: swap per shift
;
; OUTPUT: R0: inizio array
;	  R1: nuova fine array
;	  R2: numero inserito


INS_ORD
	ST	R0,BK0
	ST	R1,BK1
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4

	NOT	R1,R1
	ADD	R1,R1,#1

CHECK	ADD	R3,R0,R1
	BRP	FINE		; Qui indirizzi non utilizzabili, esco

	ADD	R2,R2,#0
	BRP	R2_POS		; Qui numero da inserire positivo
; Qui R2 negativo
	LDR	R3,R0,#0
	BRZP	CHECK_MIN_N
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R3,R3,R2
	BRNZ	CHECK_MIN_N
	BRNZP	CONT
		

R2_POS	LDR	R3,R0,#0
	BRN	CONT
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R3,R3,R2
	BRNZ	CHECK_MIN_P
	BRNZP	CONT


CHECK_MIN_N
	LDR	R3,R0,#1
	BRP	CONT
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R3,R3,R2
	BRZP	FOUND
	BRNZP	CONT

CHECK_MIN_P
	LDR	R3,R0,#1
	BRN	FOUND
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R3,R3,R2
	BRZP	FOUND
	BRNZP	CONT
	

FOUND	ADD	R1,R1,#1
	ADD	R0,R0,#1
SWAP	LDR	R4,R0,#0
	STR	R2,R0,#0
	ADD	R2,R4,#0
	ADD	R0,R0,#1
	ADD	R4,R0,R1
	BRNZ	SWAP
	
	LD	R0,BK0
	LD	R1,BK1
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4	
	RET
	
FINE	STR	R2,R0,#0
	LD	R0,BK0
	LD	R1,BK1
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	ADD	R1,R1,#1
	RET	

CONT	ADD	R0,R0,#1
	BRNZP	CHECK


BK0	.BLKW	1
BK1	.BLKW	1
BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1



; Fine subp

	.END

; TODO: termina shift e togli controlli inutili su minimo