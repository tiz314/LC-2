; Cambia ordine di array da descrescenti a crescenti, equivalentemente al contrario con array invertito in partenza
	.ORIG	x3000
	LEA	R0,I_A
	LEA	R1,F_A
	JSR	CAMBIA_ORD
END	BRNZP	END


I_A	.FILL	112
	.FILL	27
	.FILL	15
	.FILL	0
	.FILL	-2
F_A	.FILL	-56


; Inizio subp
; Utilizzo registri: 
; INPUT: R0: array
; 	 R1: indirizzo ultimo elemento
; R2: elemento1
; R3: elemento 2
; R4: check pos
; R5: backup R1

CAMBIA_ORD
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4
	ST	R5,BK5

	ADD	R5,R1,#0	; Backup r1

	NOT	R1,R1
	ADD	R1,R1,#1

CHECK	ADD	R4,R0,R1
	BRP	FINE		; qui già devo uscire

	LDR	R2,R0,#0
	LDR	R3,R5,#0	
	
	STR	R3,R0,#0
	STR	R2,R5,#0

	ADD	R5,R5,#-1
	ADD	R1,R1,#1
	ADD	R0,R0,#1

	BRNZP	CHECK

FINE	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	LD	R5,BK5
	RET	


BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1
BK5	.BLKW	1

; Fine subp

	.END