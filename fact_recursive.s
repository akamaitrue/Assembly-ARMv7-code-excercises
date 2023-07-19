		.data
mess:	.string "Il fattoriale di %d è %d\n"
errmsg:	.string "Inserisci un numero da riga di comando\n"

		.text
        .global main	@ r0 <- valore di argc
        				@ r1 <- indirizzo iniziale di argv
                        @ r0 <- valore di ritorno al preambolo GCC
		.type main, %function
        
main:	push{lr}
		cmp r1,#2		@ 2 argomenti in argv
        bne error
        ldr r0, [r1,#4]	@ r0 = argv[1], devo incrementare subito perché argv[0] è il nome del programma chiamato
        cmp r0,#0
        bl atoi			@ chiamata alla funzione atoi per convertire in intero la stringa in r0
        push{r0}		@ salvo il numero di cui voglio calcolare il fattoriale (serve per il messaggio della printf)
        bl fact			@ chiamo la fact che prende in input r0: alla fine della procedura r0 contiene il fattoriale
        mov r2,r0		@ r2 = fattoriale calcolato
        pop{r1}			@ r1 serve per la printf, la quale prende in input la stringa formattata + (nel nostro caso) altri due interi
        ldr r0,=mess
        bl printf
        pop{lr}
        mov r0,#0		@ metto 0 in r0 perché il programma è completato correttamente (return 0; in C)
        mov pc,lr
        
error:	ldr r0,=errmsg
		bl printf
        pop{lr}
        mov pc,lr
        
fact:	@ prende in input r0=n e restituisce r0=n!
		cmp r0,#0
        moveq r0,#1		@ n=0: caso base
        moveq pc,lr
        @ siamo nel caso ricorsivo: dovremo fare una chiamata ricorsiva quindi cambiare lr, ergo bisogna salvare lr (e anche r0)
        push{r0,lr}
        sub{r0,r0,#1}	@ n-=1
        bl fact			@ chiamo fact ricorsivamente con input r0=n-1
        pop{r1,lr}		@ a questo punto ho r0=(n-1)! quindi devo moltiplicarlo per r1=n al fine di ottenere n!
        mul r0,r0,r1	@ (n-1)! * n = n!
        mov pc,lr
        
        
fact_tail:	@ la chiamata ricorsiva è l'ultima operazione eseguita
			@ fact(n) chiama fact1(n,acc) => if n=0 return acc; else return fact(n-1, n*acc)
            mov r1,#1
            push{lr}
            bl fact1
            pop{lr}		@ a questo punto fact1 mi ha restituito n! in r0
            mov pc,lr
            
fact1:		cmp r0,#0	@ n=0: caso base
			moveq r0,#1
            moveq pc,lr		@ ritorna al chiamante (fact_tail)
            mul r1,r1,r0	@ acc=n*acc
            sub r0,r0,#1	@ n-=1
            push{lr}
            bl fact1		@ tail rec
            pop{lr}
            mov pc,lr		@ pop{lr}; mov pc,lr  ==  pop{pc}  scrivo direttamente il vecchio valore di lr nel pc
            
fact1:		cmp r0,#0	@ n=0: caso base
			moveq r0,#1
            moveq pc,lr		@ ritorna al chiamante (fact_tail)
            mul r1,r1,r0	@ acc=n*acc
            sub r0,r0,#1	@ n-=1
            b fact1