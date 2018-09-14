.MODEL SMALL
.STACK 100H
.DATA
    
    MSG DB "ENTER A NUMBER: $" 
    
    SUM DW 0  
    A DW ?
    B DW ?  
    
    MSG1 DB 'INPUT FIRST DIGIT: $'
    MSG2 DB 10,13,'INPUT SECOND DIGIT: $'
    MSG3 DB 10,13,'RESULT: $'
    

.CODE


 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;TAKE INPUT FROM USER
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H 
    SUB AX,48
    MOV A,AX
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV B,AX  
    
    ;RESULT PRINT
     MOV AH,9
    LEA DX,MSG3
    INT 21H   
    
    MOV BX,OFFSET SUM
    
    
    MOV AX,A
    MUL B ; AX=A*B 
    
    MOV BX,AX
    
    
    MOV AH,2
    MOV DX,BX
    ADD DX,48
    INT 21H
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
 
 END MAIN
    
    
      
    
    
    
    