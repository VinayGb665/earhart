nasm -f elf32 boot/kernel_boot.asm -o boot.o
gcc -m32 -c kernel/kernel.c -o kernel.o
ld -m elf_i386 -T linker.ld -o kernel_hart boot.o kernel.o
qemu-i386 -kernel -display curses kernel_hart 