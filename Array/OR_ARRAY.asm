; OR delle stringhe
	.ORIG	x3000
	LEA	R0,A
	LD	R1,B
	JSR	OR_ARRAY
END	BRNZP	END

A	.FILL	b0000111100001111
	.FILL	b0011001100110011
	.FILL	b1100110011001100
	.FILL	0

B	.FILL	b1111000011110000

OR_ARRAY
	ST	R2,BK2

	NOT	R1,R1

CHECK	LDR	R2,R0,#0
	BRZ	FINE
	NOT	R2,R2
	AND	R2,R2,R1
	NOT	R2,R2
	STR	R2,R0,#0
	ADD	R0,R0,#1
	BRNZP	CHECK

FINE	LD	R2,BK2
	RET

BK2	.BLKW	1
	.END