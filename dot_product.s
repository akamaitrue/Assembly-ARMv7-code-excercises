.text
.global dot_product 

@ r0 indirizzo base array
@ r1 valore x scalare
@ r2 arr.length()

dot_product:    mov r3, #0 @ r3 indice loop
loop:           cmp r3,r2                   @ se i >= arr.length() goto fine
                beq fine
                ldr r12, [r0, r3,lsl #2]    @ r12 = array[i]
                mul r12, r12, r1            @ r12 = array[i] * x
                str r12, [r0, r3,lsl #2]    @ array[i] = r12
                add r3, r3, #1              @ i++
                b loop                      @ goto loop
fine:           mov pc, lr                  @ ritora al chiamante