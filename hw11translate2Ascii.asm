; Ravindu Gunasekara
; CMSC313 @ 14:30 Mo/We
;
; assemble: nasm -f elf32 -g -F dwarf -o hw11translate2Ascii.o hw11translate2Ascii.asm
; link/load: ld -m elf_i386 -o hw11translate2Ascii hw11translate2Ascii.o

SECTION .data
inputBuf db 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A

SECTION .bss
outputBuf resb 80

SECTION .text
global _start

_start:
    ; initialize pointers and counter
    mov esi, inputBuf
    mov edi, outputBuf
    mov ecx, 8

translate:
    ; load byte, make a backup of it, and increment esi
    lodsb
    mov bl, al

    ; translate first 4 bits and store
    mov al, bl
    shr al, 4
    call convert_alpha
    stosb

    ; translate second 4 bits and store
    mov al, bl
    and al, 0x0F
    call convert_alpha
    stosb

    ; add a space to separate translated data
    mov al, ' '
    stosb

    loop translate

    ; add newline character
    mov al, 0x0A
    stosb

    ; print output
    sub edi, outputBuf
    mov edx, edi
    mov ecx, outputBuf
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; translate A-F to ASCII, jump if 0-9
convert_alpha:
    cmp al, 9
    jbe convert_num
    add al, 0x37
    ret

; translate 0-9 to ASCII
convert_num:
    add al, 0x30
    ret