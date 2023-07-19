.text
.global occur_m
.type occur_m, %function

@ funzione che conta il numero di occorrenze di un intero m in un array di interi

@ r0 = indirizzo base di arr
@ r1 = arr.length()
@ r2 = m  (intero di cui contare il numero di occorrenze)

occurr_m:	push{r4,r5}
			mov r3,#0	@ index loop
			mov r4,#0	@ occorrenze
			
loop:		cmp r3,r1
			beq fine			@ i==arr.length()
            ldr r5, [r0],#4		@ r4 = arr[i] ; incremento post-index del puntatore al prossimo elemento di r0
            cmp r5,r2			@ arr[i]==m ?
            addeq r4,r4,#1		@ occur_m++
            add r3,r3,#1		@ i++
            b loop
            
fine:		mov r0,r4
			pop{r4,r5}
            mov pc,lr