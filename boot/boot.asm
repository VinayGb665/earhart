%macro BiosPrinter 1
                mov si,word %1
        jmp ch_looper
               ; Next iteration of the loop
%endmacro


[ORG 0x7C00]                      ; BIOS loads our programm at this address
    bits 16
    cli
    BiosPrinter msg
    BiosPrinter msg2                           ;disable interrupt                       ; We're working at 16-bit mode here



hang:
   jmp hang                    ; CPU command to halt the execution
ch_looper:lodsb 
    or al, al               ; Checks if the end of the string
    jz hang
    mov ah, 0x0E                 ; Jump to halt if the end
    int 0x10                ; Otherwise, call interrupt for printing the char
    jmp ch_looper    

msg:	db "Hello, World!",0xA,0xD   ; Our actual message to print
msg2:   db "Ok done ",0xA,0xD ;second message
;; Magic numbers
times 510 - ($ - $$) db 0
dw 0xAA55
