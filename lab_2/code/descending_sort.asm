.model small     
.stack

.data            
    number db 04h
    source db 04 dup (?)
    destination db 04 dup (?)
    
.code
    descending proc  ; largest to smallest
        
        .startup 
        
        mov al, 00h     ; epoch
        mov DI, 0000h   ; destination count 
        EPOCH: 
        mov SI, 0000h   ; source count  
        mov cl, number  ; inloop
        mov ch, 00h
        sub cl, al  
        dec cl
        mov bl, 00h     ; destination count
        inc al 
        cmp al, number
        JZ EXIT
        INLOOP:  
        clc
        mov dl, source[SI]
        cmp dl, source[SI+1]  
        JG SWITCH 
        inc SI
        dec cl
        cmp cl, 00h
        JNZ INLOOP 
        mov bl, source[SI]
        mov destination[DI], bl   
        inc DI  
        cmp cl, 00h
        JZ EPOCH
        
        
        SWITCH:
        mov bl, source[SI+1]
        mov source[SI+1], dl
        mov source[SI], bl 
        inc SI
        dec cl
        cmp cl, 00h
        JNZ INLOOP 
        mov bl, source[SI]
        mov destination[DI], bl    
        inc DI  
        cmp cl, 00h
        JZ EPOCH 
        
        EXIT: 
        mov bl, source[SI]
        mov destination[DI], bl
            
        .exit
        
    descending endp
    
end descending
    
 