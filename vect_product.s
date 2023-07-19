.text
.global prod_vettoriale
.type prod_vettoriale, %function

@ r0 = indirizzo base vect1
@ r1 = indirizzo base vect2
@ r2 = vect.length()
@ valore di ritorno in r0

prod_vettoriale:	push{r4,r5}
				mov r3,#0	        @ index loop
				mov r12,#0	        @ ris
loop:			cmp r3,r2           
                beq fine
                ldr r4, [r0],#4     @ r4 = vect1[i]
                ldr r5, [r1],#4     @ r5 = vect2[i]
                mul r5,r5,r4        @ r5 = vect1[i] * vect2[i]
                add r12,r12,r5      @ ris += r5
                add r3,r3,#1		@ i++
                b loop
                
fine:			mov r0,r12
				pop{r4,r5,pc}       @ return ris