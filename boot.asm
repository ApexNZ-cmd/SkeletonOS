[bits 16]
[org 0x7c00]

start:
    ; Set up segment registers
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti

    ; Set VGA Text Mode (80x25 characters)
    mov ax, 0x0003
    int 0x10

    ; Print Welcome Message
    mov si, msg

print_welcome:
    lodsb
    or al, al
    jz input_loop
    mov ah, 0x0e
    mov bx, 0x000d    ; Purple text
    int 0x10
    jmp print_welcome

input_loop:
    ; Wait for keypress (AH = 0x00, int 0x16)
    ; Returns ASCII character in AL
    mov ah, 0x00
    int 0x16

    ; Check for Enter key (ASCII 0x0D / '\r')
    cmp al, 0x0D
    je newline

    ; Print typed character (AH = 0x0E, int 0x10)
    mov ah, 0x0e
    mov bx, 0x000b    ; Cyan text for user typing
    int 0x10
    jmp input_loop

newline:
    ; Print carriage return + line feed
    mov ah, 0x0e
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10

    ; Print prompt symbol '>'
    mov al, '>'
    mov bx, 0x000d
    int 0x10
    mov al, ' '
    int 0x10
    jmp input_loop

msg db "SkeletonOS v0.1 Interactive Shell", 0x0D, 0x0A, "> ", 0

times 510 - ($ - $$) db 0
dw 0xaa55
