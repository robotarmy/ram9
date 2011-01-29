.arm
.align
.global initSystem
.global main

initSystem:
    bx lr

main:
    mov r0,#0x04000000      @ I/O space offset
    mov r1,#0x3             @ Both screens on
    mov r2,#0x00020000      @ Framebuffer mode
    mov r3,#0x80            @ VRAM bank A enabled, LCD - bit 8 on 
   
    str r1,[r0, #0x304]     @ Set POWERCNT  # couldn't find reference to this in gbatek
    str r2,[r0]             @     DISPCNT   #
    str r3,[r0, #0x240]     @     VRAMCNT_A #
    
    @ desmune lcd seems to be 512 pixels across (contrary to wiki specifying 256)
    @#262144                @ color to use 18bit max
    mov r6, #32             @ Color change delay
    mov r7, #262144         @ color to start with
    mov r8, #0x1000         @ number of pixels of the screen occupied by animation
    mov r9, #0x08           @ color delta 
    mov r1, r7              @ Writing pixel

event: mov r4, #512       @ number of frames 512=0x200
    mov r2, r8              @ number of pxels for lp loop
    mov r3, r6              @ r3 is how often to change color 

nf:    
    mov r0,  #0x06800000      @ VRAM offset #reset each loop
lp: 
    strh r1, [r0], #1       @ Write r1 into in and increment r0 by 1
    subs r2, r2, #1         @ decrement number of pixels to write
    bne lp                  @ branch if not equal (is it checking the flags??)
    mov r2, r8              @ resest number of pixel counter

    @@ Delay r6 / r3
    @@ Between color change
    subs r3,   r3, #4        @ if color change delay reaches zero then change color
    bne after
next_color:
    mov r3, r6               @ reset the color change amount 
    sub r1, r1, r9           @ modify color by color change amount
after:
    subs r4, r4, #1          @ number of loops
    bne nf                   @ branch on zero back to r4
    
    b event

inf: b inf

@ blue gradient
@    mov r0, #0x06800000     @ VRAM offset
@    mov r1, #0x00          @ Writing pixel value
@    mov r2, #0x18000         @ number of pxels
@    mov r3, #0x800
@lp: strh r1, [r0], #1      @ Write a pixel in - increment r0 by #128
@    subs r3,r3, #1
@    bne next_px
@next_color: adds  r1, r1, #
@    mov r3, #0x800
@next_px   : subs r2,   r2, #1          @ decrement r2 - update flags
@    bne lp                  @ branch if not equal (is it checking the flags??)

@white lemon blue
@    mov r0, #0x06800000     @ VRAM offset
@    mov r1, #0x00          @ Writing pixel value
@    mov r2, #0x18000         @ number of pxels
@    mov r3, #0x1600
@lp: strh r1, [r0], #1      @ Write a pixel in - increment r0 by #128
@    subs r3,r3, #1
@    bne next_px
@next_color: adds  r1, r1, #0xffffffff
@    mov r3, #0x1600
@next_px   : subs r2,   r2, #1          @ decrement r2 - update flags
@    bne lp                  @ branch if not equal (is it checking the flags??)
@
@nf: b nf                    @ Sit in an infinite loop to finish

