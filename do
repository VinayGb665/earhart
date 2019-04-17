nasm -f elf32 boot/kernel_boot.asm -o boot.o
gcc -m32 -c kernel/kernel.c -o kernel.o
ld -m elf_i386 -T linker.ld -o kernel boot.o kernel.o