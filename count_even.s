.text
.global count_even
type count_even, %function

@ conta il numero di interi dispari in un array di interi

@ r0 = arr
@ r1 = arr.length()

count_even:	mov r2,#0	@ index loop
			mov r3,#0	@ occorrenze
			push{r4}
loop:       cmp r2,r1
            beq fine
            ldr r4, [r0],#4
            and r4,r4,#1
            cmp r4,#1
            addeq r3,r3,#1
            add r2,r2,#1
            b loop         
fine: 		mov r0,r3
			pop{r4}
			mov pc,lr