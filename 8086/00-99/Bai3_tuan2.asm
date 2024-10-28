input:
mov ah, 1
int 21h
sub al, 30h
cmp al, 1
jl lap
cmp al, 4
ja lap
je input3 
cmp al, 3
je input2
cmp al, 2
je input1
lap:
mov ah, 2
mov dl, 'F'
int 21h
;mov ah, 2
;mov dl, '_'
;int 21h
;mov ah, 2
;int 21h
jmp input 

input1:             ;nhap so co 2 chu so  
    mov ah, 2
    mov dl, 'T'
    int 21h  
    ;mov ah, 2
;    mov dl, '_'
;    int 21h
    mov cx, 10   
    
  num1:           ;nhap so thu 1
    mov ah, 1
    int 21h
    sub al, 30h
    mov ah, 0
    add ax, bx
    cmp ax, 9
    ja dung1  
    mul cx
    mov bx, ax
    jmp num1
   dung1:
    mov bx, ax
    ;mov ah, 2
;    mov dl, '+'
;    int 21h
    mov dx, 0
    
  num2:            ;nhap so thu 2
   mov ah, 1
   int 21h
   sub al, 30h
   mov ah, 0
   add ax, dx
   cmp ax, 9       ;vi so co 3 chu so >9
   ja dung2 
   mul cx
   mov dx, ax
   jmp num2 
  dung2:
   mov dx, ax
   add bx, dx
  ; mov ah, 2
;   mov dl, '='
;   int 21h
   mov dx, 0
             
   jmp chia
       
       
input2:    ;nhap so co 4 chu so      
   mov ah, 2
   mov dl, 'T'
   int 21h 
    ;mov ah, 2
;   mov dl, '_'
;   int 21h
   mov cx, 10
   
num3:      ;nhap so thu 1
    mov ah, 1
    int 21h
    sub al, 30h
    mov ah, 0
    add ax, bx
    cmp ax, 99
    ja dung3  
    mul cx
    mov bx, ax
    jmp num3
dung3:
    mov bx, ax   
    ;mov ah, 2
;    mov dl, '+'
;    int 21h  
    mov dx, 0 
  
num4:       ;nhap so thu 2
   mov ah, 1
   int 21h
   sub al, 30h
   mov ah, 0
   add ax, dx
   cmp ax, 99   ;vi so co 4 chu so >999
   ja dung4 
   mul cx
   mov dx, ax
   jmp num4
  dung4:
   mov dx, ax
   add bx, ax
   ;mov ah, 2
;   mov dl, '='
;   int 21h
   mov dx, 0   
   jmp chia
input3:    ;nhap so co 4 chu so      
   mov ah, 2
   mov dl, 'T'
   int 21h 
  ; mov ah, 2
;    mov dl, '_'
;    int 21h
   mov cx, 10
   
num5:      ;nhap so thu 1
    mov ah, 1
    int 21h
    sub al, 30h
    mov ah, 0
    add ax, bx
    cmp ax, 999
    ja dung5  
    mul cx
    mov bx, ax
    jmp num5
dung5:
    mov bx, ax   
    ;mov ah, 2
;    mov dl, '+'
;    int 21h  
    mov dx, 0 
  
num6:       ;nhap so thu 2
   mov ah, 1
   int 21h
   sub al, 30h
   mov ah, 0
   add ax, dx
   cmp ax, 999   ;vi so co 4 chu so >999
   ja dung4 
   mul cx
   mov dx, ax
   jmp num6
  dung6:
   mov dx, ax
   add bx, ax
   ;mov ah, 2
;   mov dl, '='
;   int 21h
   mov dx, 0
   
   jmp chia
 ;chia 
chia:
  mov cx, 10   ;hang don vi
  mov ax, bx
  div cx
  mov bl, dl
  
  
  mov dl, 0    ;hang chuc
  div cx
  mov bh, dl 
  
  cmp al, 0
  je hienthi
  
  mov dl, 0     ;hang tram
  div cl        ;dung cl de tien hon (do da thoa 255)
  mov ch, ah
   
  cmp al, 0     ;de ket thuc tong co 3 chu so
  je hienthi3  
  
  mov ah, 0
  div cl       ;hang nghin
  mov dh, ah
  cmp al, 0    ;ket thuc tong co 4 chu so
  je hienthi3 
  
  mov dl, al   ;hang chuc nghin
  jmp hienthi3 
;
;
;hienthi0:       ;tong co 2 chu so
;  mov ah, 2 
;  mov dl, bl
;  add dl, 30h
;  int 21h
;
;  
;  mov dl, bl
;  add dl, 30h
;  int 21h
;  ret

hienthi:       ;tong co 3 chu so
  mov ah, 2 
;  mov dl, ch
;  add dl, 30h
;  int 21h
  
  mov dl, bh
  add dl, 30h
  int 21h
  
  mov dl, bl
  add dl, 30h
  int 21h
  ret
;hienthi1:       ;tong co 4 chu so
;  mov ah, 2 
;  mov dl, dh
;  add dl, 30h
;  int 21h
;  
;  mov dl, ch
;  add dl, 30h
;  int 21h
;  
;  mov dl, bh
;  add dl, 30h
;  int 21h
;  
;  mov dl, bl
;  add dl, 30h
;  int 21h
;  ret
hienthi3:      ;tong co 5 chu so
  mov ah, 2
  add dl, 30h
  int 21h 
  
  mov dl, dh
  add dl, 30h
  int 21h
  
  mov dl, ch
  add dl, 30h
  int 21h
  
  mov dl, bh
  add dl, 30h
  int 21h 
  
  mov dl, bl
  add dl, 30h
  int 21h
  ret
;232 -27=205-20=175_172-9= 145 
;jmp nhay k dk 
;inc = increase
;dec decrease 
; nhan + do 10-----(cal) 
;push
;pop
;lifo