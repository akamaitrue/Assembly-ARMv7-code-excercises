		.data
mess:	.string "Fibo(%d) = %d\n"
		
        .text
        .global main	@ r0 <- valore di argc
        				@ r1 <- indirizzo iniziale di argv
						@ r0 <- valore di ritorno al preambolo GCC        
        .type main, %function
        
fibo:	@ fibo prende in input r0=n e restituisce r0=fibo(n)
		cmp r0,#0		@ caso base: n=0 => fibo(0) = 0
        moveq pc,lr
        moveq r0,#1		@ caso base: n=1 => fibo(1) = 1
        moveq pc,lr
        sub r0,r0,#1	@ r0=n-1
        push{r0,lr}		@ serve preservare r0=n-1
        bl fibo			@ alla fine di questa chiamata ricorsiva ho r0=fibo(n-1)
        pop{r1}			@ r1 = n-1
        push{r0}
        sub r0,r1,#1	@ r0=n-2
        bl fibo			@ alla fine di questa chiamata ricorsiva ho r0=fibo(n-2)
        pop{r1}			@ recupero r1=fibo(n-1)
        add r0,r0,r1	@ r0 = fibo(n-2)+fibo(n-1)
        pop{lr}
        mov pc,lr		@ = pop{pc}