.text
.global multipli_4
.type multipli_4, %function

@ r0 = indirizzo base di arr
@ r1 = arr.length()

@ funzione che conta il numero di interi multipli di 4 in un array di interi
@ proprietà: in binario, i multipli di 4 hanno i due bit meno significativi = 00

multipli_4:	mov r2,#0	@ index loop
			mov r3,#0	@ occorrenze
			push{r4}
loop:		cmp r2,r1
			beq fine			@ i==arr.length()
            ldr r4, [r0],#4		@ r4 = arr[i] ; incremento post-index del puntatore al prossimo elemento di r0
			and r4,r4,#0b11		@ AND bit a bit tra il valore di r4 e #3 (#0b1)
            cmp r4,#0			@ le ultime 2 cifre binarie sono 00
            addeq r3,r3,#1		@ multipli_di_quattro++
            add r2,r2,#1		@ i++
            b loop
            
fine:		mov r0,r3
			pop{r4}
            mov pc,lr