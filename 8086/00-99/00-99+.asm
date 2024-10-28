MOV CH, 100        
MOV DH, 10         

; (SO HANG 1)
MOV AH, 1
INT 21H
SUB AL, 30H        
MUL DH             
MOV BL, AL         

MOV AH, 1
INT 21H
SUB AL, 30H        
ADD BL, AL         

MOV AH, 2
MOV DL, '+'        
INT 21H

; so 2
MOV AH, 1
INT 21H
SUB AL, 30H        
MUL DH            
MOV CL, AL         

MOV AH, 1
INT 21H
SUB AL, 30H        
ADD CL, AL         

MOV AH, 2
MOV DL, '='        
INT 21H

     

addd: 
add BL, CL

;TRAM, CHUC, DON VI
MOV AH, 0
MOV AL, BL
DIV CH
MOV DL, AL ;TRAM

MOV AL, AH
MOV AH, 0
DIV DH
MOV BL, AH
MOV CL, AL

; Display result
MOV AH, 2

ADD DL, 30H        ; 100 digit to ASCII
INT 21H

ADD CL, 30H        ;  10 digit to ASCII
MOV DL, CL
INT 21H

ADD BL, 30H        ; 1 digit to ASCII
MOV DL, BL
INT 21H
;
