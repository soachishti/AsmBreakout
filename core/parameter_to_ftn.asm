INCLUDE Irvine32.inc

VK_LEFT		EQU		000000025h
VK_RIGHT	EQU		000000027h
maxCol      EQU     73
maxRow      EQU     39

GetKeyState PROTO, nVirtKey:DWORD

.data
    col BYTE 0
    row BYTE 39
	stick BYTE "<****>",0
	Invisible_stick BYTE "      ",0
.code
main PROC

looop:   
    
	
	INVOKE GetKeyState, VK_LEFT
    .IF ah && col > 0 
        ;mWriteLn "LEFT"
        DEC col
	.ENDIF  

	INVOKE GetKeyState, VK_RIGHT
    .IF ah && col < maxCol
        ;mWriteLn "RIGHT"
        INC col
	.ENDIF     
        


    mov  dl, col        ; column
    mov  dh, row        ; row
    call Gotoxy         ; Change position according to new input
        
    mov  edx,OFFSET stick          
    call Writestring      ; Write point on new place
 
    invoke Sleep, 25
    
    
    ; Erase Point
    mov  dl, col        ; column
    mov  dh, row        ; row
    call Gotoxy         ; Change position according to new input
    
    mov  edx,OFFSET Invisible_stick     
    call Writestring      ; Remove previous data

    
    
    jmp looop

	exit
main ENDP
END main