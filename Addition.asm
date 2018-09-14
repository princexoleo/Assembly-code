;Take 2 numbers and printout the Sum of number with function


.MODEL SMALL
.STACK 100H

.CODE

 MAIN PROC
    MOV AX, 156
    MOV DS, AX
    
    INPUT:
       MOV AH,1
       INT 21H 
       PUSH AX
              
    INPUT2:
       MOV AH,1
       INT 21H 
       PUSH AX 
       
    ;CALL SUM FUNTION  
      CALL SUM_FUN
     
    ;CALL PRINT FUNTION 
     CALL PRINT_FUN
       
       
     
     
     
     SUM_FUN:     
      ;take 2 numbers
      ;and ADD this number  
     
      PUSH AX
      PUSH DX  
      
      POP AX
      POP AX
      
      MOV DX,AX
      
      ADD DL,AL 
      
      POP DX
      POP AX
      
     END SUM_FUN
       
  
      PRINT_FUN:
        
       PUSH AX
       PUSH DX
            
       MOV DL,AL
       MOV AH,2
       INT 21H  
       
       POP DX
       POP AX  
       
      END PRINT_FUN
       
       
       
       MOV AH,4CH
       INT 21H
  ENDP
 END MAIN