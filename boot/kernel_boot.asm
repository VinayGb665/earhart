;;my bootloader
bits 32			;nasm directive - to specify  32 bit
section .text
        align 4
        dd 0x1BADB002            ;magic
        dd 0x00                  ;flags
        dd - (0x1BADB002 + 0x00) ;checksum. m+f+c should be zero

global start
extern main_kernel	        ;main_kernel is defined in the kernel/kernel.c file

start:
  cli 			;block interrupts
  mov esp, stack_space	;set stack pointer
  call main_kernel
  hlt		 	;halt the CPU

section .bss
resb 8192		;8KB for stack 
stack_space: