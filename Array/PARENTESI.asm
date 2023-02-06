; PARENTESI
	.ORIG	x3000
	LEA	R0,STRING
	LEA	R1,LAST
	ADD	R1,R1,#-2
	JSR	PARENTESI
END	BRNZP	END


STRING	.STRINGZ	"5 * [ 7 + 9 / ( 6 + 12 ) ]]] + 24"
LAST	.BLKW	1

; Inizio subp
; Utilizzo registri
; INPUT: R0: array
;	 R1: ultimo char
; R2: elemento caricato
; R3: valore quadra aperta e o chiusa
; R4: differenza indirizzi
; R5: conta aperte
; R6: conta chiuse
; OUTPUT: R0: differenza 

PARENTESI
	ST	R2,BK2
	ST	R3,BK3
	ST	R4,BK4
	ST	R5,BK5
	ST	R6,BK6
	
	AND	R5,R5,#0
	AND	R6,R6,#0

	NOT	R1,R1
	ADD	R1,R1,#1

CHECK	ADD	R4,R0,R1
	BRP	FINE
	
	LD	R3,AP
	LDR	R2,R0,#0
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R3
	BRZ	CONTA_AP
CK_AC	LD	R3,AC
	LDR	R2,R0,#0
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R2,R3
	BRZ	CONTA_AC
CONT	ADD	R0,R0,#1
	BRNZP	CHECK

CONTA_AP
	ADD	R5,R5,#1
	BRNZP	CONT

CONTA_AC
	ADD	R6,R6,#1
	BRNZP	CONT

FINE	NOT	R6,R6
	ADD	R6,R6,#1
	ADD	R0,R5,R6
	LD	R2,BK2
	LD	R3,BK3
	LD	R4,BK4
	LD	R5,BK5
	LD	R6,BK6
	RET

AP	.FILL	x5B
AC	.FILL	x5D	

BK2	.BLKW	1
BK3	.BLKW	1
BK4	.BLKW	1
BK5	.BLKW	1
BK6	.BLKW	1
; Fine subp


	.END