.model small
.stack

.data
    long_string db 'AGHJETSFDJJHGADSFFJJFTEDJJ', '$'
    short_string db 'JJ','$'
    result db 00h

COMPARE MACRO dataptr 
    
    lea ax, short_string   
    mov di, ax  
    
    MATCH: 
        inc di
        inc dataptr
        mov ax, '$'
        cmp al, byte ptr [di]
        jz INCCMP
    
        mov al, byte ptr [si]
        cmp al, byte ptr [di]
        jz MATCH
        jnz EXITCMP 
    
    INCCMP:
        inc result
        jmp MATCH
    
    EXITCMP:
        lea ax, short_string   
        mov di, ax   
    
ENDM
    
.code
    substring proc
        
        .startup
        
        mov ax, @data 
        mov ds, ax  
        lea ax, long_string
        mov si, ax 
        dec si    
        lea ax, short_string   
        mov di, ax  
        
        OUTER: 
            inc si 
            mov ax, '$'
            cmp al, byte ptr [si]
            jz EXIT
         
            mov dx, si     ; temp address storage
            mov al, byte ptr [si]
            cmp al, byte ptr [di]
            jnz OUTER 
            COMPARE si 
            inc dx
            mov si, dx
            jmp OUTER
         
        EXIT:
                   
        .exit
                           
    substring endp
    
end substring