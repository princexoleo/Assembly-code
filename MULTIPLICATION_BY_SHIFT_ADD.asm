  ;MULTIPLICATION BY ADD AND SHIFT
  
  .MODEL SMALL
  .STACK 100H
  
  .DATA
  
    A DW 4
    B DW 3
  
  .CODE
  
  MAIN PROC       
    
     
    
     CALL MULTIPLY
     
     
     MOV AH,2
     INT 21H
     
     MOV AH,4CH
     INT 21H
    
    MAIN ENDP
  
  
  MULTIPLY PROC  
    
    ; VAR A MULTIPLY BY VAR B BY SHIFTING AND ADDTION
    ; INPUT AX=A
    ; INPUT BX=B
    ; RANGE 0-FFH 32BITS
    ; OUTPUT DX=PRODUCT
    
    PUSH AX
    PUSH BX
    XOR DX,DX  ;CLEAR DX REG
    
  REPEAT:
       TEST BX,1    ;IS B ODD ??
       JZ END_IF
       ADD DX,AX   ;PROD=PROD+A
       
  END_IF:  
       SHL AX, 1   ;SHIFT LEFT A
       SHR BX, 1   ;SHIFT RIGHT B
       
       JNZ REPEAT  ;UNTIL NOT EQUAL 0
       
       
       POP BX
       POP AX
       
       RET
    
  MULTIPLY ENDP 
  
  END MAIN