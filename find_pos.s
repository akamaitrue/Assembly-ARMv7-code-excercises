.text
.global char_pos
.type char_pos, %function

@ r0 = indirizzo base della stringa
@ r1 = char
@ ris in r0

@ prende in input una stringa *s* e un carattere *c*, 
@ restituisce l'indice della prima occorrenza di *c* in *s*
char_pos:	push{r4}
			mov r2,#0			@ r2 = index loop
            mov r3,#-1			@ r3 = ris
            
loop:	 	ldrb r4, [r0,r2]	@ r4 = str[i] ; puntatore al prossimo carattere della stringa tramite incremento post index
			@ oss: se ti avesse dato un array di caratteri avresti dovuto fare incremento di 4 e leggere solo il primo byte
			cmp r4,#0			@ "\0"
            beq fine
            cmp r4,r1			@ str[i] == char ?
            moveq r3,r2
            beq fine
            add r2,r2,#1		@ i++
            b loop
            
fine:		mov r0,r3
			pop{r4}
            mov pc,lr