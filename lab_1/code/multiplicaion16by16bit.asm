.model small ; DS and CS <= 64KB
.stack       ; occupies 1024 bytes for stack segment

.data  
    multiplier dw 1357h
    multiplicand dw 2468h 
    result dd ?
    
.code           ; initialize code segment
    multiplication proc    ; initializes the procedure name 'multipliction'
        
        .startup    ;  initialize data segment  
        
        mov ax, multiplicand
        mul multiplier
        mov word ptr [result], ax
        mov word ptr [result+2], dx
        
        .exit
        
    multiplication endp ; terminates the procedure with procedure name 'multiplication'            
    
end multiplication      ; ends the program; imp to give end a procedure name
    