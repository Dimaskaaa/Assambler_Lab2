%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    LEA ESI, [a]   ;загружаем адрес начального элемента
    MOV AL, [ESI]   ;загружаем первый элемент
    AND AL, 0xE0    ;маскируем первые 3 бита
    SHR AL, 5       ;сдвигаем на 5 бит вправо, чтобы получить число
        
    PRINT_DEC 1, AL ;выводим
    NEWLINE
    
    MOV AL, [ESI]   ;обновляем регистр на тот же элемент
    AND AL, 0x1C    ;маскируем 3 бита второго числа
    SHR AL, 2       ;сдвигаем на 2 вправо
    
    PRINT_DEC 1, AL ;выводим
    NEWLINE
    
    MOV AL, [ESI]   ;обновляем регистр на тот же элемент
    AND AL, 0x03    ;маскируем первые 2 бита третьего числа
    SHL AL, 1       ;сдвигаем вправо
    INC ESI         ;переходим на след элемент
    MOV BL, [ESI]   ;загружаем его
    AND BL, 0x80    ;маскируем последний бит третьего числа
    SHR BL, 7       ;сдвигаем его вправо на 7 бит
    OR AL, BL       ;совмещаем маскированные биты в одном регистре
    
    PRINT_DEC 1, AL ;выводим
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x70
    SHR Al, 4
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x0E
    SHR AL, 1
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x01
    SHL AL, 2
    INC ESI
    MOV BL, [ESI]
    AND BL, 0xC0
    SHR BL, 6
    OR AL, BL
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x38
    SHR AL, 3
    
    PRINT_DEC 1, AL
    NEWLINE
    
    MOV AL, [ESI]
    AND AL, 0x03
    
    PRINT_DEC 1, AL
    NEWLINE
    RET
section .data
a: db 0xE8, 0xD2, 0x26

;7 2 1 3 1 0 4 6
;111 010 001 101 001 000 100 110
;11101000 11010010 00100110
;0xE8 0xD2 0x26