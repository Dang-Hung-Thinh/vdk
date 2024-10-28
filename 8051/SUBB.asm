ORG 0000H

START:
    ; C?u hình Port
    MOV P2, #0FFH        ; C?u hình Port 2 làm ngõ vào
    MOV P1, #0FFH        ; C?u hình Port 1 làm ngõ ra cho LED 7 ?o?n

    ; ??c c?ng P2 và tách 4 bit th?p
    MOV A, P2            ; ??c giá tr? t? Port 2
    ANL A, #0Fh          
    XRL A, #11111111B
	ANL A, #0FH
	MOV R1, A            ; L?u 4 bit th?p vào R1

    ; ??c c?ng P2 và tách 4 bit cao
    MOV A, P2            ; ??c l?i giá tr? t? Port 2
    ANL A, #11110000b  
	XRL A, #11111111B        ; Gi? l?i 4 bit cao (P2.4 ??n P2.7)
    SWAP A   
	ANL A, #00001111B            ; Hoán ??i 4 bit cao thành 4 bit th?p
    MOV R2, A            ; L?u 4 bit cao (sau khi hoán ??i) vào R2

    ; Th?c hi?n phép tr? gi?a R2 và R1
    MOV A, R2            ; Chuy?n giá tr? c?a R2 vào thanh ghi A
    SUBB A, R1           ; Tr? giá tr? c?a R1 vào A (A = R2 - R1)
    MOV R0, A            ; L?u k?t qu? vào R0

    MOV A, R0            ; L?y giá tr? t? R0
    MOV B, #10           ; S? chia là 10 (00001010B)
    DIV AB              

	  ; L?u s? d? vào R0, ph?n nguyên vào R3
    MOV R0, B            ; S? d? ???c l?u vào B, l?u vào R0
    MOV R3, A            ; Ph?n nguyên l?u vào R3

    ; Hi?n th? ph?n nguyên (R3) trên LED 7 ?o?n tr??c
    MOV DPTR, #TABLE     ; Tr? ??n b?ng mã LED 7 ?o?n
    MOV A, R3            ; L?y giá tr? ph?n nguyên t? R3
    MOVC A, @A+DPTR      ; Tra c?u mã LED t? b?ng
    MOV P1, A            ; Xu?t mã LED lên Port 1
  ; Hi?n th? s? d? (R0) trên LED 7 ?o?n sau
    MOV A, R0            ; L?y giá tr? s? d? t? R0
    MOVC A, @A+DPTR      ; Tra c?u mã LED t? b?ng
    MOV P1, A            ; Xu?t mã LED lên Port 1
   
    ; Vòng l?p vô h?n
    SJMP START

; B?ng mã LED 7 ?o?n
TABLE: 
    DB 11000000B, 11111001B, 10100100B, 10110000B, 10011001B
    DB 10010010B, 10000010B, 11011000B, 10000000B, 10010000B ; Mã cho các s? t? 0 ??n 9

; Hàm delay ?? hi?n th? giá tr? LED

END
