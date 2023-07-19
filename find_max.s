.text
.global find_max
.type find_max, %function

@ funzione che prende in input un array di interi e la sua size
@ e restituisce l'intero di valore massimo

@ r0 = indirizzo base array
@ r1 = arr.length()
@ ris (max) in r0

find_max:	mov r2,#0	@ index loop
			mov r3,#0	@ current_max
loop:		cmp r2,r1	@ i==size ?
			beq fine
			ldr r12, [r0],#4	
			cmp r12,r3
            movgt r3,r12		@ arr[i] > curr_max => curr_max = arr[i]
            add r2,r2,#1		@ i++
            b loop
            
fine:		mov r3,r0
			mov pc,lr