ORG 0000H       

START:  
    MOV P2, #0FFH       ; Set P2 as input (assuming active low switches)
    MOV P1, #0FFH       ; Set P1 as output

    ; Get the first 3-bit number (from SW 1, 2, 3)
    MOV A, P2           ; Load P2 into accumulator
    ANL A, #07H
	XRL A, #00000111B        
    MOV R1, A           ; Store first number in R1

    ; Get the second 3-bit number (from SW 4, 5, 6)
    MOV A, P2           ; Load P2 again to capture all switch states
    ;ANL A, #38H         ; Mask bits 3, 4, 5 (SW 4, 5, 6 are on P2.3, P2.4, P2.5)
    SWAP A              ; Swap nibbles (brings bits 3, 4, 5 to lower nibble)
    ANL A, #07H         ; Mask lower nibble to get only the 3-bit number
    MOV R2, A           ; Store second number in R2

    ; Add the two numbers
    MOV A, R2           ; Load the second number into A
    ADD A, R1           ; Add the first number (R1)
    MOV R7, A           ; Store the result in R7

    ; Output the result to P1
    XRL A, #0FFH        ; Invert the bits (assuming active low)
    MOV P1, A           ; Output the result to P1

            
	;;;;;ADD
    MOV A, R2           
    ADD A, R1         
    MOV R7, A           

    
    XRL A, #11111111B         
    MOV P1, A 
	;;;;SUB
    MOV A, R2          
    SUBB A, R1         
    MOV R6, A           

    
    XRL A, #11111111B         
    MOV P1, A 


	;;;;;;;;SUB


    MOV A, R2
	MOV B, R1            
    MUL AB          
    MOV R0, A           

   
    XRL A, #11111111B         
    MOV P1, A            

END
