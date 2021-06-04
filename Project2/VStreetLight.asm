ORG 00H

MOV A,#0FFH ;A=00 hex
MOV P1,A ;make P1 an i/p port

MOV A,#000H ;A=00 hex
MOV P2,A ;make P2 an o/p port

// road sensors
CLR P1.0
CLR P1.1
CLR P1.2

// road lights
CLR P2.0
CLR P2.1
CLR P2.2

LOOP1:
    JB P1.0, LIGHT1
    CLR P2.0

    BACK:
    JB P1.1, LIGHT2
    CLR P2.1

    BACK1:
    JB P1.2, LIGHT3
    CLR P2.2


    BACK2:
    SJMP OVER

    LIGHT1:
        SETB P2.0
        SJMP BACK
    
    LIGHT2:
        SETB P2.1
        SJMP BACK1
    
    LIGHT3:
        SETB P2.2
        SJMP BACK2
        

    OVER:    
    ; LCALL DELAY
    SJMP LOOP1

    ORG 300H ;put DELAY at address 300H
    DELAY: MOV R5,#0FFH ;R5=255 (FF in hex), counter
    AGAIN: DJNZ R5,AGAIN ;stay here until R5 become 0
    RET ;return to caller (when R5 =0)
END