.text
.global count_odd
.type count_odd, %function

@ r0 = indirizzo base di arr
@ r1 = arr.length()

@ funzione che conta il numero di interi dispari in un array di interi
@ proprietà: in binario, i numeri dispari hanno il bit meno significativo =1 (pari => LSB=0)

count_odd:	mov r2,#0	@ index loop
			mov r3,#0	@ occorrenze
			push{r4}
loop:		cmp r2,r1
			beq fine			@ i==arr.length()
            ldr r4, [r0],#4		@ r4 = arr[i] ; incremento post-index del puntatore al prossimo elemento di r0
			and r4,r4,#1		@ AND bit a bit tra il valore di r4 e #1 (#0b1)
            cmp r4,#1			@ se l'ultima cifra dell'intero in r4 è 1 => AND=1 (intero dispari)
            @ per count_even sostituire la riga precedente con cmp r4,#1
            addeq r3,r3,#1		@ odd_numbers++
            add r2,r2,#1		@ i++
            b loop
            
fine:		mov r0,r3
			pop{r4}
            mov pc,lr