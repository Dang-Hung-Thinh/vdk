LAI:  
MOV AH,1
INT 21H
SUB, AL, 30H
MOV
MOV AH,1
INT 21H
SUB AL,30H 
MOV BL,AL ; Store n
MOV BH,AL
MOV DL,99
CMP BL,DL
JL NHAPLAI
JMP TIEP

NHAPLAI:
MOV AH,2
MOV DL,'F'
INT 21H  
JMP LAI

TIEP:
MOV DI,2    ;  (A and B)
TIEP2:
MOV DX,0
DEC DI
SOTHU1:
MOV AH,1
INT 21H
SUB AL,30H
MOV CL,AL
MOV AX,10  ;  DX * 10 
MUL DX
MOV DX,AX
ADD DX,CX
DEC BL
CMP BL,0
JE NEXT
JMP SOTHU1  
NEXT:
CMP DI,0
JE THOAT  ; xong nhap A< B
MOV SI,DX ; A in SI
MOV BL,BH ; bh -> BL
JMP TIEP2 

THOAT:
MOV DI,DX  ; B in DI
;//
; Add the two numbers (stored in SI and DI)
;MOV AX,SI  ; Load the first number into AX
;ADD AX, DI  ; Add the second number (DI) to AX
;
;MOV CX, AX  ; Store the sum in CX for later use
;MOV DX, 0   ; Initialize DX for division
;
;MOV BX, 10  ; We will divide by 10 to extract digits
;
;; Initialize the counter to 0
;MOV SI, 0   ; SI will count the number of digits pushed
;
;; Extract the digits and push them onto the stack
;PRINT_SUM:
;MOV DX, 0   ; Clear DX before division
;DIV BX      ; Divide AX by 10, quotient in AX, remainder in DX
;ADD DL, 30H ; Convert remainder to ASCII
;PUSH DX     ; Save the digit on the stack
;INC SI      ; Increment the digit count
;CMP AX, 0   ; Check if quotient is zero
;JNZ PRINT_SUM ; If not, continue extracting digits
;
;; Pop the digits and print them
;DISPLAY:
;POP DX      ; Retrieve digits from the stack
;MOV AH, 2   ; Setup for printing
;INT 21H     ; Print the digit
;DEC SI      ; Decrement the digit count
;JNZ DISPLAY 
;//

MOV AX, SI      ; Load the first number into AX
ADD AX, DI      ; Add the second number (DI) to AX

MOV BX, AX      ; Store the result (sum) in BX for further division

; Start the division process to print the result digit by digit
CHIA:
    MOV AX, 10000    ; Initialize the divisor (starting with 10000)
    MOV CX, 10       ; Divisor decrement factor (reduce divisor by 10 each iteration)
LAP: 
    MOV DX, 0        ; Clear DX before division
    CMP AX, BX       ; Compare divisor with the sum (BX)
    JL TINH          ; If divisor is smaller, perform the division
    DIV CX           ; Reduce divisor by a factor of 10
    JMP LAP          ; Loop back to try the next smaller divisor
TINH:
    MOV DX, 0        ; Clear DX before division
    MOV CX, AX       ; Move the divisor into CX
    MOV AX, BX       ; Move the sum (BX) into AX for division
    DIV CX           ; Divide AX by the divisor (CX)
    MOV BX, DX       ; Store the remainder in BX (for the next iteration)
    
    ; Print the quotient (integer part of the division)
    MOV AH, 2        ; Set up for printing
    MOV DL, AL       ; Move the quotient to DL (which holds the ASCII value to print)
    ADD DL, 30h      ; Convert it to ASCII
    INT 21H          ; Print the digit
    
    CMP BX, 0        ; Check if the remainder (BX) is zero
    JE HOANTHANH     ; If remainder is zero, end the program
    JMP CHIA         ; Otherwise, continue dividing the remainder
HOANTHANH:
RET