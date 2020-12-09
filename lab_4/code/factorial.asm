;Design an 8086 assembly language program to compute the factorial of a positive integer ‘n’ using a recursive procedure. Integer n is a byte integer.
.model small
.stack

.data
    number db 05h  
    result dw ?
    
.code  

        
    .startup   
        
    mov ax, @data 
    mov ds, ax  
    mov ax, 0001h
    mov dx, 0000h 
    call recurr_func
    mov result , ax
    
    .exit
        
    recurr_func:   
        cmp number, 00h
        jg calc
        ret
            
    calc:
        dec number
        call recurr_func
        inc number
        mov bl, number
        mul bx
        ret