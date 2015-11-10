VK_LEFT		EQU		000000025h
VK_RIGHT	EQU		000000027h
maxCol      EQU     79
maxRow      EQU     25

GetKeyState PROTO, nVirtKey:DWORD

POINT STRUCT
	x BYTE ?
	y BYTE ?
POINT ENDS

.data
	stickCol        BYTE    0
    stickRow        BYTE    25 ; 25 is standard
    stickSize       =       10
	stick           BYTE    "<########>",0
	Invisible_stick BYTE    "          ",0
    maxBlock        =       30
    gameSpeed       =       25
	block           BYTE    "[======]",0
	Space           BYTE    "        ",0
	sizeA           =       10
	axis            POINT   sizeA DUP(<?,?>)
	val1            BYTE    0
	val2            BYTE    0
	color_rand      DWORD   2
.code 
include helperPROC.asm

eraseBlock PROC
		mov al,val1
		mov ah,val2
		
		mov axis[esi].x,al 
		mov axis[esi].y,ah
		mov dl, axis[esi].x
		mov dh, axis[esi].y
		call Gotoxy
		mov edx,OFFSET Space
		call writestring
		
	ret
eraseBlock ENDP

Print_Grid PROC
		mov eax, 0
		mov esi, 0
		mov ecx, maxBlock
	row1:
		mov al,val1
		mov ah,val2
		
		mov axis[esi].x,ah 
		mov axis[esi].y,al
	
		mov dl, axis[esi].x
		mov dh, axis[esi].y
		call Gotoxy
		
		mov eax,color_rand
		call SetTextColor
				
		mov edx,OFFSET block
		call writestring
		
	.if color_rand >= 15
		mov color_rand, 3
	.endif
		
	.if val2 >= 80
		mov val2, 0
		add val1, 1
	.endif
		add val2,8	
		add color_rand,1	
	loop row1	

ret
Print_Grid ENDP

StickMovement PROC
        INVOKE GetKeyState, VK_LEFT
        .IF ah && stickCol > 0 
            DEC stickCol
        .ENDIF  

        INVOKE GetKeyState, VK_RIGHT
        .IF ah && stickCol <= maxCol - stickSize
            INC stickCol
        .ENDIF     

        mov  dl, stickCol        
        mov  dh, stickRow        
        call Gotoxy         

        mov eax,3    
        call SetTextColor
       
        mov  edx, OFFSET stick          
        call Writestring    
        
        invoke Sleep, gameSpeed
        
        mov  dl, stickCol        
        mov  dh, stickRow        
        call Gotoxy         
        
        mov  edx,OFFSET Invisible_stick     
        call Writestring     
        
        add color_rand,1
	ret
StickMovement ENDP

core PROC
    call Print_Grid
  	foreverLoop: 	
        call stickMovement		
        jmp foreverLoop
    
	ret
core ENDP
