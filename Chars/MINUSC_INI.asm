		.ORIG		x3000
; Inizio main
		LEA		R0, PAROLA		; Carico indirizzo per parola
		TRAP		x22
		JSR		SUBPR
		LEA		R0, PAROLA
		TRAP		x22
		TRAP		x25
	
PAROLA		.STRINGZ	"Oggi e' il 13 Settembre 2022"

; Fine main



; Inizio sottoprogramma

SUBPR		BRNZP		BACKUP		
CHECK_MIN	LDR		R1, R0, #0		; Carico lettera
		LD		R2, MAX_M		; Carico valore da sottrarre
		ADD		R1, R1, R2 		; Check se minore o uguale a 90
		BRP		PROSEGUI		; Sicuramente non maiuscola, cambio lettera da controllare
		LDR		R1, R0, #0		; Ripristino lettera
		LD		R2, MIN_M		; Carico valore da sottrarre
		ADD		R1, R1, R2		; Check se maggiore o uguale a 65
		BRN		PROSEGUI		; Se minore, sicuramente non minuscola, cambio lettera da controllare
		BRNZP		CAMBIA			; Procedo a cambiare la lettera essendo maiuscola

CAMBIA		LDR		R1, R0, #0		; Ripristino lettera originale
		LD		R2, CONV
		ADD		R1, R1, R2		; Converto a minuscola
		STR		R1, R0, #0		; Salvo in PAROLA
		BRNZP 		PROSEGUI		; Procedo a check successivo

PROSEGUI	ADD		R0, R0, #1		; Incremento indirizzo lettera
		LDR		R1, R0, #0		; Salvo nuova lettera per check fine frase
		BRZ		FINE			; Se finita la frase, fine
		LD		R2, SPACE		; Altrimenti, carico il valore -32 per check dello spazio
		ADD		R1, R1, R2		; Sottraggo valore spazio
		BRNP		PROSEGUI		; Continuo finche' non trovo spazio
		ADD		R0, R0, #1		; Altrimenti se ho incontrato spazio, vado avanti di lettera e torno al check
		BRNZP		CHECK_MIN		; Ritorno al check minuscola

BACKUP		ST		R1, BACKUP1
		ST		R2, BACKUP2	
		BRNZP		CHECK_MIN		; Inizio con il check



FINE		LD		R1, BACKUP1
		LD		R2, BACKUP2
		RET



BACKUP1		.BLKW		1
BACKUP2		.BLKW		1	
MAX_M		.FILL		-90
MIN_M		.FILL		-65
SPACE		.FILL		-32
CONV		.FILL		32

; Fine sottoprogramma


	.END