.MODEL SMALL
.STACK 100H

.DATA
INPUT_MSG DB 'Enter your string: $'
VOWEL_MSG DB 'Vowels= $'
CONSONENT_MSG DB 'Consonents = $'
PRINT_COMA DB ', $'
VOWEL DB 48
CONSONENT DB 48

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, INPUT_MSG
    INT 21H 
    
    MOV SI, 0
    MOV DI, 0
    
    INPUT_STR:
        MOV AH, 1
        INT 21H
        
        CMP AL, 0DH
        JE EXIT_INPUT_STR
        
        CMP AL, 40H
        JG CHECK_VOWEL
        JMP INPUT_STR
        
        CHECK_VOWEL:
            CMP AL, 'A'
            JE VOWEL_COUNT
            CMP AL, 'E'
            JE VOWEL_COUNT
            CMP AL, 'I'
            JE VOWEL_COUNT
            CMP AL, 'O'
            JE VOWEL_COUNT
            CMP AL, 'U'
            JE VOWEL_COUNT
            CMP AL, 'a'
            JE VOWEL_COUNT
            CMP AL, 'e'
            JE VOWEL_COUNT
            CMP AL, 'i'
            JE VOWEL_COUNT
            CMP AL, 'o'
            JE VOWEL_COUNT
            CMP AL, 'u'
            JE VOWEL_COUNT
            
            JMP CHECK_CONSONENT
            
        CHECK_CONSONENT:
            CMP AL, 'A'
            JGE LESS_EQUAL_Z
            JMP INPUT_STR
            
            LESS_EQUAL_Z:
                CMP AL, 'Z'
                JLE CONSONENT_COUNT
                JMP LESS_EQUAL_SMALL_A  
                
            LESS_EQUAL_SMALL_A:
                CMP AL, 'a'
                JGE LESS_EQUAL_SMALL_Z
                JMP INPUT_STR
                
            LESS_EQUAL_SMALL_Z:
                CMP AL, 'z'
                JLE CONSONENT_COUNT
                JMP INPUT_STR
            
        VOWEL_COUNT:
            INC VOWEL
            INC SI
            JMP INPUT_STR        
            
        CONSONENT_COUNT:
            INC CONSONENT
            INC SI
            JMP INPUT_STR 
            
    EXIT_INPUT_STR:
    
    CALL NEW_LINE
    
    MOV AH, 9
    LEA DX, VOWEL_MSG  
    INT 21H
    
    MOV AH, 2
    MOV DL, VOWEL
    INT 21H
    
    MOV AH, 9
    LEA DX, PRINT_COMA
    INT 21H
    
    MOV AH, 9
    LEA DX, CONSONENT_MSG
    INT 21H
    
    MOV AH, 2
    MOV DL, CONSONENT
    INT 21H
     
    MOV AH, 4CH
    INT 21H
    MAIN ENDP

NEW_LINE PROC
      MOV AH,2
      MOV DL,0AH
      INT 21H
      MOV DL,0DH
      INT 21H
      RET
      
NEW_LINE ENDP

END MAIN
