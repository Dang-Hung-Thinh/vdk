ORG 0000H       

START:
    MOV P2, #0FFH        ; C?u hình Port 2 làm ngõ vào (input) cho các switch
    MOV P1, #0FFH        
	MOV A, P2           ;
    
    ; L?y 4 bit th?p (P2.0 ??n P2.3) và l?u vào R1
    ANL A, #0Fh         
	XRL A, #111111111B
	ANL A, #0FH
	
    MOV R1, A  
    ; L?y 4 bit cao (P2.4 ??n P2.7) và l?u vào R2
    MOV A, P2            ; ??c l?i giá tr? t? Port 2 (do giá tr? tr??c ?ó ?ã thay ??i)
    ANL A, #11110000B  
	XRL A, #11111111B        ; AND A v?i F0h ?? gi? l?i 4 bit cao (P2.4 - P2.7)
    SWAP A               ; Hoán ??i 4 bit cao thành 4 bit th?p
    ANL A, #0Fh 
             ; AND A v?i 0Fh ?? xóa các bit cao, ch? gi? l?i 4 bit th?p
    MOV R2, A            ; L?u giá tr? 4 bit cao (sau khi hoán ??i) vào R2

    ; Th?c hi?n phép c?ng gi?a R1 và R2
    MOV A, R2
	MOV B, R1            ; Di chuy?n giá tr? c?a R1 vào thanh ghi A
    MUL AB          ; C?ng giá tr? c?a R2 vào A
    MOV R0, A            ; L?u k?t qu? vào R0

    ; ??o giá tr? và xu?t k?t qu? ra c?ng P1
    XRL A, #11111111B          ; ??o t?t c? các bit trong A
    MOV P1, A            ; Xu?t k?t qu? lên Port 1

END
