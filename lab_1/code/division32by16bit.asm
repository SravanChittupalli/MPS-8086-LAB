.model small ; DS and CS <= 64KB
.stack       ; occupies 1024 bytes for stack segment

.data  
    dividend dd 71C2580Ah;04681234h
    divisor dw 0F6F2h     ;01A57h
    quotient dw ?
    remainder dw ?
    
.code           ; initialize code segment
    division proc    ; initializes the procedure name 'division'
        
        .startup    ;  initialize data segment  
        
        mov ax, word ptr [dividend]
        mov dx, word ptr [dividend+2]
        div word ptr divisor
        mov word ptr [quotient], ax
        mov word ptr [remainder], dx
        
        .exit
        
    division endp ; terminates the procedure with procedure name 'division'            
    
 end division      ; ends the program; imp to give end a procedure name
    