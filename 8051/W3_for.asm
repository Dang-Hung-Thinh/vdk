
; 99<n<999 tram chuc donvi
begin: mov bx,10 
mov ch, 5 ;

;nhap so - 
mov ah, 1 
int 21h 
sub al, 30h 
mov ah, 0
mul bx      
mov cx, ax 

cmp cx, 10000
jle lap0

lap0:
mov ah, 1
int 21h
sub al, 30h
add cl, al
mov ax, cx
mul bx
mov cx, ax
jmp begin

;mov ah, 1 
;int 21h 
;sub al, 30h     
;add cl, al   
;mov ax, cx
;mul bx
;mov cx, ax
;
;mov ah, 1 
;int 21h 
;sub al, 30h     
;add cl, al   
;mov ax, cx
;mul bx
;mov cx, ax   
;
;mov ah, 1 
;int 21h 
;sub al, 30h     
;add cl, al   
;mov ax, cx
;mul bx
;mov cx, ax
;
mov ah, 1 
int 21h 
sub al, 30h 
add cl, al  
           
;;;;;;;;;;;;           
cmp cx, 9999
jge lap 
cmp cx, 99
jle lap
mov dl, 'T'
jmp exit       
lap:
mov dl, 'F'
mov ah, 2
int 21h
jmp begin
exit: mov ah, 2
int 21h      ;;30 instructions
       
 





