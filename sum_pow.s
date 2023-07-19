.text
.global sumpow
  
  sumpow:	mov r2, r1  @ r2=n
      		mov r1, r0  @ r1=x
            mov r0, #0  @ r0=ris
          
  start:	cmp r2, #0  @ se n=0 il risultato è x^0=1 e ho finito
  		    beq fine
  		    b pow
          
  pow:	    mov r3, r1  @ r3= risultati intermedi
  		    mov r4, r2  @ r4=n
  pow-s:	cmp r4, #1
            beq cont
  		    mul r3,r3,r1
            sub r4,r4,#1
            b pow-s
          
  cont: 	add r0,r0,r3
  		    sub r2,r2,#1
            b start		@ a questo punto potevo fare anche b fine
          
  fine:	    add r0,r0,#1
  		    mov pc, lr