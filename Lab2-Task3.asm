%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    LEA ESI, [m] ;
    LEA EDI, [ESI+4] ;длина массива 
START:
    CMP EDI, ESI ;если последний элемент, то заканчиваем сортировку
    JE L3 
    MOV EBX, EDI ;задаем j = n-1
    DEC EBX
J: 
    CMP EBX, ESI 
    JA L
    INC ESI ;увеличиваем i
    JMP START ;если j<i выходим из подпрограммы
L:
    MOV AH, [EBX] ;m[j]
    MOV AL, [EBX-1] ;m[j-1]
    CMP AH, AL
    JA L2 ;если m[j] > m[j-1] обмениваемся значениями
    MOV [EBX], AL
    MOV [EBX-1], AH 
L2:
    DEC EBX ;уменьшаем j
    JMP J
L3:
    LEA ESI, [m] ;переходим к первому элементу
FINISH:
    PRINT_DEC 1, [ESI]  ;выводим
    NEWLINE
    INC ESI
    CMP EDI, ESI
    JA FINISH
    RET  


    
section .data
m: db 43, 12, 35, 0