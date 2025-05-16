# CMSC313-HW11

Ravindu Gunasekara
CMSC313 @ 14:30 Mo/We

To compile and run the code:
1. Download: hw11translate2Ascii.asm
2. Copy to GL: https://userpages.umbc.edu/~cmarron/cs341.s20/resources/accessing_gl.pdf
3. Assemble: nasm -f elf32 -g -F dwarf -o hw11translate2Ascii.o hw11translate2Ascii.asm
4. Link/Load: ld -m elf_i386 -o hw11translate2Ascii hw11translate2Ascii.o
5. Run: ./hw11translate2Ascii

The program is meant to take in 8 bytes of data, translate it into ASCII, and output the result.
The sample data used in the code is: 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
which should yield the output: 83 6A 88 DE 9A C3 54 9A.
