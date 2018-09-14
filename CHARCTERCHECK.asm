        .MODEL SMALL
        .STACK 100H
        .DATA
             
        .CODE
             
          MAIN PROC 
            MOV AX,@DATA
            MOV DS,AX
            
            MOV AH,1
            INT 21H
            
            MOV BL,AL
            
            CMP BL, 'A'
            JNGE ENDIF
            CMP BL,'Z'
            JLE ENDIF 
             
             MOV DL,'N'
             MOV AH,2
             INT 21H  
            
              MOV AH, 9
        
              MOV AH, 4CH
              INT 21H
            
            
           ENDIF:
             MOV DL,'Y'
             MOV AH,2
             INT 21H
           
        MAIN ENDP
        END MAIN
            
            