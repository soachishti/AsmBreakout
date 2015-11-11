INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDELIB user32.lib

VK_LEFT		EQU		000000025h
VK_UP		EQU		000000026h
VK_RIGHT	EQU		000000027h
VK_DOWN		EQU		000000028h
maxX      EQU     79
maxY      EQU     30

GetKeyState PROTO, nVirtKey:DWORD

.data
    X BYTE 40
    Y BYTE 20
    dirX BYTE -1
    dirY BYTE -2
.code
main PROC

looop:   
	.IF X >= maxX   ; Right Wall
        mov dirX, -1
  	.ENDIF

    .IF X <= 0        ; Left Wall
        mov dirX, 1
	.ENDIF     

    .IF Y <= 0        ; Top
        mov dirY, 1
	.ENDIF  

    .IF Y >= maxY   ; Down limit
        mov dirY, -1
	.ENDIF     

    mov al, dirX
    add X, al 
    mov al, dirY
    add Y, al 
    
    mov  dl, X        ; column
    mov  dh, Y        ; row
    call Gotoxy         ; Change position according to new input
        
    mov  al, '*'          
    call WriteChar      ; Write point on new place
 
    invoke Sleep, 20
    
    ; Erase Point
    mov  dl, X        ; column
    mov  dh, Y        ; row
    call Gotoxy         ; Change position according to new input
    
    mov  al,' '     
    call WriteChar      ; Remove previous data
    jmp looop

	exit
main ENDP
END main