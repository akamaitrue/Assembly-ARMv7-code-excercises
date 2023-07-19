.text
.global merge
.type merge, %function

@ r0 = puntatore prima lista
@ r1 = puntatore seconda lista
@ r0 = valore di ritorno (puntatore lista unita)
merge: 	cmp r0,#0 		@ prima == NULL ?
       	moveq r0,r1
       	moveq pc,lr
       	mov r2,r0 		@ r2 puntatore prima (che sicuro non è vuota)
loop: 	cmp r2,#0 		@ prima == NULL ?
       	beq fine
       	mov r3,r2 		@ r3 contiene precedente elemento
		ldr r2, [r2, #4] @ r2 contiene successivo elemento
		b loop
 fine: 	str r1, [r3, #4] @ concateno prima con seconda
       	mov pc,lr