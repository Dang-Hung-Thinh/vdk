ORG 0000H

START:
    ; C?u h�nh Port
    MOV P2, #0FFH        ; C?u h�nh Port 2 l�m ng� v�o
    MOV P1, #0FFH        ; C?u h�nh Port 1 l�m ng� ra cho LED 7 ?o?n

    ; ??c c?ng P2 v� t�ch 4 bit th?p
    MOV A, P2            ; ??c gi� tr? t? Port 2
    ANL A, #0Fh          
    XRL A, #11111111B
	ANL A, #0FH
	MOV R1, A            ; L?u 4 bit th?p v�o R1

    ; ??c c?ng P2 v� t�ch 4 bit cao
    MOV A, P2            ; ??c l?i gi� tr? t? Port 2
    ANL A, #11110000b  
	XRL A, #11111111B        ; Gi? l?i 4 bit cao (P2.4 ??n P2.7)
    SWAP A   
	ANL A, #00001111B            ; Ho�n ??i 4 bit cao th�nh 4 bit th?p
    MOV R2, A            ; L?u 4 bit cao (sau khi ho�n ??i) v�o R2

    ; Th?c hi?n ph�p tr? gi?a R2 v� R1
    MOV A, R2            ; Chuy?n gi� tr? c?a R2 v�o thanh ghi A
    SUBB A, R1           ; Tr? gi� tr? c?a R1 v�o A (A = R2 - R1)
    MOV R0, A            ; L?u k?t qu? v�o R0

    MOV A, R0            ; L?y gi� tr? t? R0
    MOV B, #10           ; S? chia l� 10 (00001010B)
    DIV AB              

	  ; L?u s? d? v�o R0, ph?n nguy�n v�o R3
    MOV R0, B            ; S? d? ???c l?u v�o B, l?u v�o R0
    MOV R3, A            ; Ph?n nguy�n l?u v�o R3

    ; Hi?n th? ph?n nguy�n (R3) tr�n LED 7 ?o?n tr??c
    MOV DPTR, #TABLE     ; Tr? ??n b?ng m� LED 7 ?o?n
    MOV A, R3            ; L?y gi� tr? ph?n nguy�n t? R3
    MOVC A, @A+DPTR      ; Tra c?u m� LED t? b?ng
    MOV P1, A            ; Xu?t m� LED l�n Port 1
  ; Hi?n th? s? d? (R0) tr�n LED 7 ?o?n sau
    MOV A, R0            ; L?y gi� tr? s? d? t? R0
    MOVC A, @A+DPTR      ; Tra c?u m� LED t? b?ng
    MOV P1, A            ; Xu?t m� LED l�n Port 1
   
    ; V�ng l?p v� h?n
    SJMP START

; B?ng m� LED 7 ?o?n
TABLE: 
    DB 11000000B, 11111001B, 10100100B, 10110000B, 10011001B
    DB 10010010B, 10000010B, 11011000B, 10000000B, 10010000B ; M� cho c�c s? t? 0 ??n 9

; H�m delay ?? hi?n th? gi� tr? LED

END
