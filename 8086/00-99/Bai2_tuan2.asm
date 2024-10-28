input:
mov ah, 2
mov dl, 'F'
int 21h
mov ah, 2
mov dl, ' '
int 21h
;;;;;;; 
mov ah, 1
int 21h
sub al,30h
mov cl,100
mov ah,0
mul cl
add bx,ax
mov ah, 1
int 21h
sub al,30h
mov cl,10
mov ah,0
mul cl
add bx,ax
mov ah, 1
int 21h
sub al,30h
mov ah,0
add bx,ax 


;input: mov ah, 2
;mov ah, 1
;sub al, 30h



cmp bx,00
jle input

cmp bx, 99
jle input

       


result:
mov ah, 2
	mov dl, 'T'
	int 21h
ret 