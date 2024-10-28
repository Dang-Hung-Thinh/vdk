    

START:  
    MOV P2, #0FFH       
    MOV P1, #0FFH       

    ; 3BIT D
    MOV A, P2
		XRL A, #0FFH           
    ANL A, #07H         ; Mask bits 0, 1, 2
    XRL A, #00000111B 
    MOV R1, A          

    ; 3BIT SAU
    MOV A, P2 
		XRL A, #0FFH          
    ANL A, #38H         ; Mask bits 3, 4, 5
    RL A               
    SWAP A              
    XRL A, #00000111B  
    MOV R2, A           

    
    MOV A, P2
	  XRL A, #11111111B           
    ANL A, #11000000B       

  	;SS
    CJNE A, #11000000b, CHECK_01 
    JMP ADDD_OP           
CHECK_01:          
    CJNE A, #10000000b, CHECK_10  
    JMP SUB_OP
CHECK_10:              
	CJNE A, #01000000b, CHECK_11
	JMP MULL_OP
CHECK_11:
    CJNE A, #00000000b, END        
    JMP DIVV_OP            

ADDD_OP:
    
    MOV A, R1
    ADD A, R2
    MOV R7, A           
    XRL A, #0FFH       
    MOV P1, A           
    JMP END           

SUB_OP:
    
    MOV A, R2
    SUBB A, R1
    MOV R6, A          
    XRL A, #0FFH       
    MOV P1, A           
    JMP END           
MULL_OP:
   
    MOV A, R1
    MOV B, R2
    MUL AB              
    MOV R0, A           
    XRL A, #0FFH        
    MOV P1, A          
    JMP END           
DIVV_OP:

    MOV A, R2
    MOV B, R1
    DIV AB             
    MOV R0, A          
    XRL A, #0FFH         
    MOV P1, A          
    JMP END            
END:
    JMP START         

