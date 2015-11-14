VK_LEFT		EQU		000000025h
VK_RIGHT	EQU		000000027h
VK_ESCAPE	EQU		00000001bh
VK_F1		EQU		000000070h
maxCol      EQU     79
maxRow      EQU     25

GetKeyState PROTO, nVirtKey:DWORD

POINT STRUCT
	x       BYTE ?
	y       BYTE ?
    color   DWORD ? ; color
POINT ENDS

.data
    stickPos        POINT   <35, 25>           
    
    stickSize       =       10
	stick           BYTE    "<########>",0
	Invisible_stick BYTE    "          ",0
    maxBlock        =       30 + 10
    gameSpeed       =       25
	;block           BYTE    "[======]",0
	;block           BYTE    223,223,223,223,223,223,223,223,0
	block           BYTE    219,219,219,219,219,219,219,219,0
	Space           BYTE    "        ",0
	axis            POINT   maxBlock DUP(<?,?>)
	color_rand      DWORD   2
    
    ballChar        BYTE    'o'
    ball            POINT   <40,25>
    ballDir         POINT   <1,1>
    stickSpeed      =       3
    score           DWORD   0
.code 
include helperPROC.asm

<<<<<<< HEAD
eraseBlock PROC
=======
z_eraseBlock PROC
		mov al,val1
		mov ah,val2
		
		mov axis[esi].x,al 
		mov axis[esi].y,ah
>>>>>>> 9e28c66d9863b78872e20f68b9f59dccf8ae0a32
		mov dl, axis[esi].x
		mov dh, axis[esi].y
		call Gotoxy
		mov edx,OFFSET Space
		call writestring
	ret
z_eraseBlock ENDP

<<<<<<< HEAD
printBlock PROC
    	mov dl, axis[esi].x
=======
z_Print_Grid PROC
		mov eax, 0
		mov esi, 0
		mov ecx, maxBlock
	row1:
		mov al,val1
		mov ah,val2
		
		mov axis[esi].x,ah 
		mov axis[esi].y,al
	
		mov dl, axis[esi].x
>>>>>>> 9e28c66d9863b78872e20f68b9f59dccf8ae0a32
		mov dh, axis[esi].y
		call Gotoxy
		
		mov eax, axis[esi].color
		call SetTextColor
				
		mov edx,OFFSET block
		call writestring
    ret
printBlock ENDP



Init_Grid PROC
        LOCAL val1:BYTE, val2:BYTE
               
        mov val1, 0
        mov val2, 0

		mov eax, 0
		mov esi, 0
		mov ecx, maxBlock
	row1:
		mov al,val1
		mov ah,val2
		
		mov axis[esi].x, ah 
		mov axis[esi].y, al
        
        mov eax, color_rand
        mov axis[esi].color, eax 
        
        call printBlock
			
	.if color_rand >= 15
		mov color_rand, 3
	.endif
		
        
        add val2,8	
		add color_rand,1
	
    .if val2 > maxCol
		mov val2, 0
		add val1, 1
	.endif


        add esi, TYPE axis
	loop row1	

ret
<<<<<<< HEAD
Init_Grid ENDP

StickMovement PROC    
=======
z_Print_Grid ENDP

z_StickMovement PROC
>>>>>>> 9e28c66d9863b78872e20f68b9f59dccf8ae0a32
        INVOKE GetKeyState, VK_LEFT
        .IF ah && stickPos.x > 0
            mov al, stickSpeed
            sub stickPos.x, al
            .IF stickPos.x > maxCol
                mov stickPos.x, 0 
            .ENDIF
        .ENDIF  

        INVOKE GetKeyState, VK_RIGHT
        .IF ah && stickPos.x <= maxCol - stickSize
            mov al, stickSpeed
            add stickPos.x, al
            .IF stickPos.x > maxCol - stickSize
                mov stickPos.x, maxCol - stickSize + 1
            .ENDIF
        .ENDIF     
        
        mov  dl, stickPos.x        
        mov  dh, stickPos.y        
        call Gotoxy         

        mov eax,3    
        call SetTextColor
       
        mov  edx, OFFSET stick          
        call Writestring    
	ret
StickMovement ENDP

EraseStick PROC
        mov  dl, stickPos.x        
        mov  dh, stickPos.y        
        call Gotoxy         
        
        mov  edx, OFFSET Invisible_stick     
        call Writestring     
        
<<<<<<< HEAD
        add color_rand,1  
    ret
EraseStick ENDP

BallMovement PROC
    .IF ball.x >= maxCol   ; Right Wall
        mov ballDir.x, -1
  	.ENDIF

    .IF ball.x <= 0        ; Left Wall
        mov ballDir.x, 1
	.ENDIF     

    .IF ball.y <= 0        ; Top
        mov ballDir.y, 1
	.ENDIF  

    .IF ball.y >= maxRow   ; Down limit
        mov ballDir.y, -1
	.ENDIF     

    mov al, ballDir.x
    add ball.x, al 
    mov al, ballDir.y
    add ball.y, al 
    
    mov  dl, ball.x        ; column
    mov  dh, ball.y        ; row
    call Gotoxy         ; Change position according to new input
        
    mov  al, ballChar          
    call WriteChar      ; Write point on new place   
    ret
BallMovement ENDP

EraseBall PROC
    ; Erase Point
    mov  dl, ball.x        ; column
    mov  dh, ball.y        ; row
    call Gotoxy         ; Change position according to new input
    
    mov  al,' '     
    call WriteChar      ; Remove previous data
    ret
EraseBall ENDP

stickcolision PROC
     mov al, 0
    .IF ball.y == maxRow
        mov dl, stickPos.x 
        mov dh, stickPos.x 
        add dh, stickSize
        .IF ball.x >= dl && ball.x <= dh
            mov al, 0
            ; control ball direction
        .ELSE
            mov al, 1
        .ENDIF
    .ENDIF
    ret
stickcolision ENDP

Print_Block PROC
    mov esi, 0
	mov ecx, maxBlock
    l0:
        .IF axis[esi].x != -1 
            call printBlock
        .ENDIF
        add esi, SIZEOF POINT
    loop l0
    ret
Print_Block ENDP

grid_collision_check PROC
    mov esi, 0
	mov ecx, maxBlock
    l0:
        mov al, ball.x
        mov ah, ball.y
        mov dl, axis[esi].x
        add dl, 8
        
        .IF ah == axis[esi].y && al <= dl && al >= axis[esi].x 
            call eraseBlock
            inc score
            
            neg ballDir.x
            neg ballDir.y
            mov axis[esi].x, -1
            mov axis[esi].y, -1
            ret
        .ENDIF
        
        add esi, SIZEOF POINT
    loop l0
    ret
grid_collision_check ENDP

core PROC
    call Init_Grid
  	foreverLoop: 
        INVOKE GetKeyState, VK_ESCAPE
        .IF ah
            jmp gamePause
        .ENDIF
	
        call Print_Block
        call stickMovement	
        call BallMovement
        
        call grid_collision_check
        
        call stickcolision
        cmp al, 1   ; collision 
        je finish
        
        .IF score == maxBlock
            jmp YouWin
        .ENDIF
        
        invoke Sleep, gameSpeed

        call EraseBall
        call EraseStick
        
    resume:
=======
        add color_rand,1
	ret
z_StickMovement ENDP

core PROC
    call z_Print_Grid
  	foreverLoop: 	
        call z_stickMovement		
>>>>>>> 9e28c66d9863b78872e20f68b9f59dccf8ae0a32
        jmp foreverLoop
    
    
    YouWin:
        
        jmp return
    restart:
        mWrite "Game restart"
        jmp return
    finish:
        ; Will add life
        mWrite "Game End"
        jmp return
    gamePause:
        mWrite "Game Paused"
        jmp return
        
    return:
	ret
core ENDP
