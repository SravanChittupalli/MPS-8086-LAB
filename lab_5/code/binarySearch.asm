.model small

.data
     ARR DW 0011H,2201H,3723H,4512H,5432H,7126H,0A125H,0C123H, 0D452H 
     KEY DW 2201H
     RES DB 0FFh
     LEN DW ($-ARR)/2


.code
    .startup
     
      MOV AX,@DATA
      MOV DS,AX
    
      MOV BX,00
      MOV DX,LEN 
      DEC DX
      MOV CX,KEY
AGAIN:
      CMP BX,DX
      JA ENDLABEL
      MOV AX,BX
      ADD AX,DX
      SHR AX,1
      MOV SI,AX
      ADD SI,SI
      CMP CX,ARR[SI]
      JAE GREATER
      DEC AX
      MOV DX,AX
      JMP AGAIN
GREATER:   
      JE PASS
      INC AX
      MOV BX,AX
      JMP AGAIN
PASS: 
      MOV RES,AL 
ENDLABEL:
      .exit