@ oss: un carattere ha dimensione 1byte, con ldrb è possibile leggere 1byte anziché un indirizzo intero di 4byte (32bit)
@ ASCII

.text
.global maius
.type maius, %function	@ etichetta globale della funzione

@ ASCII: a=77=0x61,...,z=122=0x7a ; A=65,...,Z=90
@ oss: non c'è il parametro length perché la fine della stringa si detecta con \0
@ ldrb r0,r1 prende il byte (8bit) meno di significativo del valore di r1 e lo scrive in r0, con i restanti 3 byte a 0

maius:		ldr r0,=string
			ldrb r1,[r0]		    @ carico in r1 il primo carattere (1byte) della stringa
            cmp r1,#0				@ char == '\0'  (null terminated string)
            beq fine
			cmp r1,#77
            blo next				@ blo perché è unsigned
			cmp r1,#122
            bhi next
            @ a questo punto sappiamo che il carattere è una lettera minuscola tra a,...,z
            sub r1,r1,#32		    @ conversione da minuscolo a maiuscolo
            strb r1,[r0]			@ curr_char = curr_char.toUpperCase()
next:		add r0,r0,#1		    @ puntatore al prossimo carattere della stringa
			b maius
            
fine:		mov pc,lr