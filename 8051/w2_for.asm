; n=9
mov ah, 1
int 21h 
mov dl, al
;sub al, 30h
mov cl, al
;mov ch, 0
vonglap:
;cmp ch, cl 
cmp cl, 30h
;jl inN
jg inN
jmp exit
inN:
mov ah, 2
int 21h
;inc ch 
dec cl
jmp vonglap
exit: 




