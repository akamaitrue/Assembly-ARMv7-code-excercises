.text
.global countZeros

            mov r0,#0		@ r0 = contatore degli zeri trovati
            mov r1,#0		@ r1 = index loop
                            @ r2 = array.length()
            ldr r3, =array	@ r3 = indirizzo base dell'array  (ldr literal)

        @	soluzione con incremento post-index
    loop:	cmp r1,r2
            beq fine
            ldr r12, [r3], #4	@ incremento +4 post-index <=> ldr r12,r3; add r3,r3,#4
            cmp r12,#0
            beq match
            add r1,r1,#1
            b loop
            
  match:	add r0,r0,#1	@ incremento il contatore degli zeri trovati (ris)			
            add r1,r1,#1
            b loop
          
  fine:	    mov pc,lr