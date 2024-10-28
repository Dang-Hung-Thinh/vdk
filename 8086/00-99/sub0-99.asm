MOV CH, 100        
MOV DH, 10         

; Input first number (SO HANG 1)
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
MOV DL, '-'        
INT 21H

; Input second number (SO HANG 2)
MOV AH, 1
INT 21H
SUB AL, 30H        
MUL DH             ; / 10 (shift to tens place)
MOV CL, AL         

MOV AH, 1
INT 21H
SUB AL, 30H        ;  ASCII to numeric
ADD CL, AL         ; save CL

MOV AH, 2
MOV DL, '='        
INT 21H

; subtraction BL - CL
SUB BL, CL        


       

POSITIVE:
; 100, 10, 1 digits
MOV AH, 0
MOV AL, BL
DIV CH             ; / 100 to get hundreds digit in AL, remainder in AH
MOV DL, AL         ; Store the hundreds digit in DL

MOV AL, AH
MOV AH, 0
DIV DH             ; / 10 to get tens digit in AL, remainder in AH
MOV BL, AH         ; Store the units digit in BL
MOV CL, AL         

; Display result
MOV AH, 2

ADD DL, 30H        ; 100 digit to ASCII
INT 21H

ADD CL, 30H        ; 10 digit to ASCII
MOV DL, CL
INT 21H

ADD BL, 30H        ; 1 digit to ASCII
MOV DL, BL
INT 21H

      