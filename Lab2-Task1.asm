%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    XOR ECX, ECX   
    LEA EBX, [a]
    MOV EDI, 6  ;ставим длину массива
    MOV ESI, 0  ;записываем нулевой индекс
    MOV DH, 2   ;записываем 2 для проверки четности
START:
    CMP EDI, ESI
    je FINISH   ;если последний элемент, то выходим из подпрограммы
    XOR AH, AH  ;опустошаем регистр остатка
    MOV Al, [EBX+ESI]
    DIV DH
    CMP AH, 0   ;сравниваем остаток от деления на 2 с 0
    JE INCR     ;если 0 то засчитываем
    INC ESI     
    JMP START   ;делаем шаг
INCR:
    INC ECX     ;увеличиваем счетчик
    INC ESI
    JMP START   ;делаем шаг
    
FINISH:
    PRINT_DEC 4, ECX    ;выводим количество
    RET
    
section .data
a: db 1, 7, 14, 2, 30, 0    ;4 четных элемента