@ r0 = indirizzo base di vect
@ r1 = vect.length() (=n)
@ r2 = x

.text
.global appello
.type appello, %function

appello:	push{r4,r5,lr}
			mov r3,#0		@ ris
			mov r12,#0		@ index loop 	
loop:		cmp r12,r1		@ i==vect.length()
			beq fine
            ldr r4, [r0],#4
            push{r12}
            bl power
            mul r5,r5,r4	@ r5 = x^{i} * vect[i]
            add r3,r3,r5	@ ris += r5
            pop{r12}
            add r12,r12,#1	@ i++
            b loop
            
fine:		mov r0,r3		@ ris in r0
			pop{r4,r5,lr}
            mov pc,lr
            
            
power:		cmp r12,#0		
			moveq{pc,lr}	@ ritorna al chiamante
            mul r5,r2,r2	@ r5 = x*x
            sub r12,r12,#1	@ i--
            b loop