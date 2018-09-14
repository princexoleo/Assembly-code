 .MODEL SMALL
 .STACK 100H  
 .DATA
   
   PROMPT    DB  'Type a line of text',0DH,0AH,'$'
   NOCAP_MSG DB  0DH,0AH,'No Capitals $'
   CAP_MSG   DB  0DH,0AH,'First Capital = '
   FIRST     DB  ']'
             DB  'Last Capital = '
             
   LAST      DB '@ $'
   
 
 
 .CODE
 
  MAIN PROC
  
     MOV AX,@DATA
     MOV DS,AX 
    
     ;DISPLAY OPENING MSG
     MOV AH,9
     LEA DX, PROMPT
     INT 21H
     
     ;READ A PROCESS OF LINE OF TEXT
     
     MOV AH,1
     INT 21H
    
    
   WHILE_:
            CMP AL,0DH
            JE END_WHILE ;IF PRESS ENTER THEN STOP READ CHAR
            
            CMP AL,'A'
            JNGE END_IF  ;IF NOT CAPITA; LETTER
            CMP AL,'Z'   ;THEN CHAR<=Z ??
            JNLE END_IF  ;IF CHAR NOT LESS THAN EQUAL Z THEN GOTO END_IF
            
            CMP AL,FIRST
            JNL CHECK_LAST
            MOV FIRST, AL  ;FIRST=CHAR
            
      CHECK_LAST:
            CMP AL,LAST
            JNG END_IF 
            MOV LAST ,AL ;LAST=CHAR
            
       END_IF:
            INT 21H    ;AGAIN READ CHAR
            JMP WHILE_ ;REPEAT LOOP
            
    
    END_WHILE:   
            
            ;DISPLAY
            
            MOV AH,9
            CMP FIRST, ']'    ;FIRST=']'???
            JNE CAPS         ;NO THEN DIPLAY CAP MSG
            LEA DX,NOCAP_MSG ;NO CAPITAL          
            JMP DISPLAY
            
      CAPS:
            LEA DX,CAP_MSG
            
       DISPLAY:
             INT 21H
            
            
            MOV AX,4CH
            INT 21H
    
    
      
    
  ENDP
  
END MAIN