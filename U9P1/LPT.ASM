[BITS 16]
[ORG 100h]

DATA_PORT   EQU 378h
STATUS_PORT EQU 379h
CTRL_PORT   EQU 37Ah

start:

wait_ready:
    mov dx, STATUS_PORT
    in  al, dx
    test al, 10000000b
    jz wait_ready

    mov al, 41h
    mov dx, DATA_PORT
    out dx, al

    mov dx, CTRL_PORT
    in  al, dx
    and al, 11111110b
    out dx, al

    mov cx, 15

delay:
    loop delay

    or  al, 00000001b
    out dx, al

    mov ah, 4Ch
    int 21h