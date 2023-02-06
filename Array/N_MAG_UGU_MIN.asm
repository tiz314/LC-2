; conteggio numero di numeri maggiori uguali o minori di un numero ricevuto in ingresso
	.orig	x3000
	lea	r0,array
	ld	r1,num
	jsr 	N_MAG_UGU_MIN
end	brnzp	end

array	.fill	-45
	.fill	12
	.fill	27
	.fill	1
	.fill	-3
	.fill	0

num	.fill	1

; inizio subp

N_MAG_UGU_MIN
	st	r4,bk4
	st	r5,bk5
	st	r6,bk6

	add	r5,r1,#0	; backup di r1 prima di azzeramento per contatore
	and	r1,r1,#0	; contatore uguali
	and	r2,r2,#0	; contatore minori
	and	r6,r6,#0	; contatore maggiori

check	ldr	r4,r0,#0	; elemento caricato da array
	brz	fine

	add	r5,r5,#0
	brzp	n_pos
; qui numero da comparare è negativo
		
	add	r4,r4,#0	
	brzp	inc_mag
	not	r4,r4
	add	r4,r4,#1
	add	r4,r4,r5
	brz	inc_ug
	brn	inc_min
	brnzp	inc_mag

cont	add	r0,r0,#1
	brnzp check

n_pos	add	r4,r4,#0
	brn	inc_mag
	not	r4,r4
	add	r4,r4,#1
	add	r4,r4,r5
	brz	inc_ug
	brn	inc_min
	brnzp 	inc_mag


inc_min	add	r2,r2,#1
	brnzp 	cont

inc_mag	add	r6,r6,#1
	brnzp 	cont

inc_ug	add	r1,r1,#1
	brnzp 	cont

fine	add	r0,r6,#0
	ld	r4,bk4
	ld	r5,bk5
	ld	r6,bk6
	ret

bk4	.blkw 	1
bk5	.blkw	1
bk6	.blkw	1
; fine subp

	.end