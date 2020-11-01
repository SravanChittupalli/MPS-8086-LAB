.model small     
.stack

.data            
    number db 04h
    source db ?
    destination db ?
    
.code
    ascending proc  ; smallest to largest
        
        .startup 
        
        mov al, 00h     ; epoch
        mov cl, number  ; inloop
        mov ch, 00h
        mov DI, cx      ; destination count 
        dec DI
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
        JNG SWITCH 
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
        
    ascending endp
    
end ascending
    
 