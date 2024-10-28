;25D      

START:
    MOV P2, #0FFH        
    MOV P1, #0FFH 
       
	MOV A, P2           ;   
    ANL A, #0Fh         
	XRL A, #111111111B
	ANL A, #0FH
	
    MOV R1, A  
   
    MOV A, P2            ;
    ANL A, #11110000B  
	XRL A, #11111111B       
    SWAP A               
    ANL A, #0Fh 
             
    MOV R2, A            
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
	;;;;;DIV
	 MOV A, R2
	MOV B, R1            
    DIV AB          
    MOV R3, A           

   
    XRL A, #11111111B         
    MOV P1, A         

END
