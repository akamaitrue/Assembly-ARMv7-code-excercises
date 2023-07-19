.text
.global countZeros

            mov r0,#0		@ r0 = contatore degli zeri trovati
            mov r1,#0		@ r1 = index loop
                            @ r2 = array.length()
            ldr r3, =array	@ r3 = indirizzo base dell'array  (ldr literal)

  loop:	    cmp r1,r2		@ i==array.length()
  		    beq fine
            ldr r12, [r3],#4		@ r12 = arr[i]; puntatore al prossimo elemento di arr (+4)
            cmp r12,#0				@ arr[i] == 0
            beq match
            add r1,r1,#1	@ i++
            b loop
            
  match:	add r0,r0,#1	@ incremento il contatore degli zeri trovati (ris)			
            add r1,r1,#1
            b loop
          
  fine:	    mov pc,lr