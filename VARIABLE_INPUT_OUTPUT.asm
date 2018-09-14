.MODEL SMALL
.STACK 100H
.DATA 
   ;this is for data segment, variable declare here
   ;DB FOR DEFINE BYTE 8 BITS REG
   ;DW FOR DEFINE WORD 16 BITS REG
   
   NUM1 DB 49  ;49 mean 1
   CHAR DB 'A' ; FOR CHARACTER WE USE '' 
   MSG1 DB "My Name is LEON $"

.CODE  
    ;THIS is CODE segment 

 MAIN PROC  
    ;LIKE INT MAIN
    
    MOV AX,@DATA  ;load data segment
    MOV DS,AX     ; load Data to DataSource Regsister
    
    MOV AH,2      ;FOR OUTPUT
    MOV DL, NUM1  ; VALUE STORE IN OUTPUT REGSISTER DL
    INT 21H  
    
    ;FOR NEW LINE PRINT
    
    MOV AH,2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    ;CHAR PRINT
    
    MOV AH,2
    MOV DL,CHAR
    INT 21H   
    
    ;FOR NEW LINE PRINT
    
    MOV AH,2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    ;MSG PRINT
    
    MOV AH,9     ;9 FOR STRING TYPE CONSOLE
    LEA DX,MSG1  ;LEA FOR STRING OUTPUT
    INT 21H
    
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP  ;MAIN PROC END
 
 
 END MAIN    ; CODE END
            