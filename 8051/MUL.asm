ORG 0000H       

START:
    MOV P2, #0FFH        ; C?u h�nh Port 2 l�m ng� v�o (input) cho c�c switch
    MOV P1, #0FFH        
	MOV A, P2           ;
    
    ; L?y 4 bit th?p (P2.0 ??n P2.3) v� l?u v�o R1
    ANL A, #0Fh         
	XRL A, #111111111B
	ANL A, #0FH
	
    MOV R1, A  
    ; L?y 4 bit cao (P2.4 ??n P2.7) v� l?u v�o R2
    MOV A, P2            ; ??c l?i gi� tr? t? Port 2 (do gi� tr? tr??c ?� ?� thay ??i)
    ANL A, #11110000B  
	XRL A, #11111111B        ; AND A v?i F0h ?? gi? l?i 4 bit cao (P2.4 - P2.7)
    SWAP A               ; Ho�n ??i 4 bit cao th�nh 4 bit th?p
    ANL A, #0Fh 
             ; AND A v?i 0Fh ?? x�a c�c bit cao, ch? gi? l?i 4 bit th?p
    MOV R2, A            ; L?u gi� tr? 4 bit cao (sau khi ho�n ??i) v�o R2

    ; Th?c hi?n ph�p c?ng gi?a R1 v� R2
    MOV A, R2
	MOV B, R1            ; Di chuy?n gi� tr? c?a R1 v�o thanh ghi A
    MUL AB          ; C?ng gi� tr? c?a R2 v�o A
    MOV R0, A            ; L?u k?t qu? v�o R0

    ; ??o gi� tr? v� xu?t k?t qu? ra c?ng P1
    XRL A, #11111111B          ; ??o t?t c? c�c bit trong A
    MOV P1, A            ; Xu?t k?t qu? l�n Port 1

END
