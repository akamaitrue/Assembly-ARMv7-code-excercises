		.data
mess:	.string "Il fattoriale di %d è %d\n"
erms1: 	.string "Inserisci un numero da riga di comando\n"
erms2: 	.string "Errore nella chiamata read\n"
buf: 	.fill 128 @ spazio per stringa da 128 caratteri

		.text
		.global main @ r0 <- valore di ritorno al preambolo GCC
		.type main, %function

@ oss: in questa implementazione l'input n è preso da user input

main:	push {lr}
        mov r0,#0 		@ r0 contiene l'indice di stdin
        Idr r1,=buf 	@ r1 contiene indirizzo inziale del buffer
        mov r2,#128 	@ r2 contiene dimensione del buffer
        mov r7,#3 		@ una read è la syscall no. 3
        svc 0 			@ svc esegue la syscall specificata in r7
        cmp r0, #-1
        beq bad
        ldr r0,=buf 	@ ricarico in r0 indirizzo del buffer
        bl atoi 		@ dopo questa, r0 contiene il numero di cui calcolare il fattoriale
        push {r0} 		@ mi salvo il numero di cui calcolare il fattoriale
        bl fact 		@ dopo questa, rO contiene il fattoriale
        mov r2,r0
        pop {r1}
        ldr r0,=mess
        bl printf
        pop {lr}
        mov r0, #0
        mov pc, lr

error: 	Idr r0,=erms1 	@ carico indirizzo iniziale stringa di errore
		bl printf
        pop {lr}
        mov pc, lr