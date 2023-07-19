.text
.global find_char
.type find_char, %function

@ funzione che prende un vettore, size e un carattere, 
@ restituisce 0 se il carattere è presente, 1 altrimenti

@ r0 = indirizzo base array
@ r1 = char
@ r2 = arr.length()
@ ris in r0

find_char:	push{r4}
			mov r3,#0		@ found==0
			mov r12,#0		@ r12 = index loop
loop:       cmp r12,r2		@ i==arr.length() ?
            beq fine
            ldr r4, [r0],#4
            cmp r4,r1		@ arr[i]==char ?
            moveq r3,#1
            beq fine
            add r12,r12,#1	@ i++
            b loop

fine: 		mov r0,r3		@ ris in r0
			pop{r4}
            mov pc,lr