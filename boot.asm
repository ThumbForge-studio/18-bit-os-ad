[org 0x7c00]
[bits 16]

start:
    mov ax, 0x0003
    int 0x10

    mov si, message

print:
    lodsb
    cmp al, 0
    je done

    mov ah, 0x0E
    int 0x10

    jmp print 
done:

    ; New line
    mov ah, 0x0E
    mov al, 13      ; Carriage Return
    int 0x10
    mov al, 10      ; Line Feed
    int 0x10

keyboard:

    ; Wait for a key
    mov ah, 0
    int 0x16

    ; Exit if ESC pressed
    cmp al, 27
    je halt

    ; Print the key
    mov ah, 0x0E
    int 0x10

    jmp keyboard

halt:
    cli

hang:
    hlt
    jmp hang

    message db 13,10
        db "   ______      _                  ",13,10
        db "  |  ____|    | |                 ",13,10
        db "  | |__  __ _ | | ___ ___  _ __   ",13,10
        db "  |  __|/ _` || |/ __/ _ \| '_ \  ",13,10
        db "  | |  | (_| || | (_| (_) | | | | ",13,10
        db "  |_|   \__,_||_|\___\___/|_| |_| ",13,10
        db 13,10
        db "          FALCON OS",13,10
        db "          Version 1.02",13,10
        db 13,10
        db "[OK] BIOS Boot Successful",13,10
        db "[OK] 16-bit Real Mode",13,10
        db "{nasm -f .assembly run by prohack soo (c:\users\aarav\onedrive\dekstop\os\bios.interpret [ok])}"
        db 13,10
        db "FalconOS> ",0
        times 510-($-$$) db 0
    dw 0xAA55