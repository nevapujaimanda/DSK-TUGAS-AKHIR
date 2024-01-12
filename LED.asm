org 100h

jmp start                ;jmp ke start

msg1    db 13,10, '============================'
msg2    db 13,10, '|       PROJECT LED        |'
msg3    db 13,10, '============================'
pilih   db 13,10, '0/1 pilihan $:'
pil1    db 13,10, 'lampu nyala$'
pil2    db 13,10, 'lampu mati$'

start:                   ;int main 
    
    lea dx,msg1,msg2,msg3 
    mov ah,09h
    int 21h
    jmp pilihan          ;lompat ke void pilihan
    
pilihan:
     
     lea dx,pilih        ;manggil pilihan
     mov ah,09h     
     int 21h
     
     mov ah,01h     
     int 21h
     
     cmp al,'0'          ;jika input 0
     je mati             ;maka lompat ke void mati
     
     cmp al,'1'          ;jika imput 1
     je nyala            ;maka lompat ke void nyala
     
     jmp salah           ;jika imputan selain 0 atau 1 maka inputan ke void salah
      
                   
nyala:

    lea dx,pil1          ;manggill pil1
    mov ah,09h  
    int 21h
    
    jmp looping      
    
mati:
    
    lea dx,pil2          ;manggil pil2
    mov ah,09h
    int 21h
    
    jmp looping      
    
salah:

    lea dx, salah         ;menampilkan salah        
    mov ah,09h
    int 21h
 
looping:

    jmp pilihan
    
     
