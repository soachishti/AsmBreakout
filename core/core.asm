VK_LEFT		EQU		000000025h
VK_RIGHT	EQU		000000027h
VK_ESCAPE	EQU		00000001bh
VK_F1		EQU		000000070h
maxCol      EQU     79
maxRow      EQU     25

GetKeyState PROTO, nVirtKey:DWORD

POINTv2 STRUCT
	x       BYTE ?
	y       BYTE ?
    color   DWORD ? ; color
POINTv2 ENDS

.data
    stickPos        POINTv2   <38, 25>           
    ;UpperBorder     BYTE	247,247,247,247,247,247,247,247,0
	;LowerBorder     BYTE 	247,247,247,247,247,247,247,247,0
    stickSize       =       10
	stick           BYTE    219,219,219,219,219,219,219,219,0
	Invisible_stick BYTE    "          ",0
    maxBlock        =       30 + 10
    gameSpeed       =       25
	;block           BYTE    "[======]",0
	;block           BYTE    223,223,223,223,223,223,223,223,0
	block           BYTE    240,240,240,240,240,240,240,240,0
	Space           BYTE    "        ",0
	axis            POINTv2   maxBlock DUP(<?,?>)
	color_rand      DWORD   2
    
    ballChar        BYTE    'O'
    ball            POINTv2   <40,25>
    ballDir         POINTv2   <1,1>
    stickSpeed      =       3
    score           DWORD   0
        
    life            BYTE    4
    lifeCh          BYTE    3    
.code 
eraseBlock PROC
		mov dl, axis[esi].x
		mov dh, axis[esi].y
		call Gotoxy
		mov edx,OFFSET Space
		call writestring
	ret
eraseBlock ENDP

printBlock PROC
    	mov dl, axis[esi].x
		mov dh, axis[esi].y
		call Gotoxy
		
		mov eax, axis[esi].color
		call SetTextColor
				
		mov edx,OFFSET block
		call writestring
    ret
printBlock ENDP

UBorder PROC
		LOCAL val1:BYTE,val2:BYTE
		
		mov val1,1
		mov val2,0
		
		mov esi,0
		mov ecx,maxBlock
		
		row1:
		mov al,val1
		mov ah,val2
		
		mov axis[esi].x,ah
		mov axis[esi].y,al
		
		mov edx,OFFSET UBorder
		call writestring
		
		loop row1
		
	ret
UBorder ENDP

Init_Grid PROC
        LOCAL val1:BYTE, val2:BYTE
               
        mov val1, 2
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
Init_Grid ENDP

StickMovement PROC    
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
        
        add color_rand,1  
    ret
EraseStick ENDP

BallMovement PROC
    .IF ball.x >= (maxCol - 1)   ; Right Wall
        mov ballDir.x, -1
  	.ENDIF

    .IF ball.x <= 1        ; Left Wall
        mov ballDir.x, 1
	.ENDIF     

    .IF ball.y <= 2        ; Top
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
            
            pushfd
            INVOKE  Beep, 300,50;
            popfd
            ;neg ballDir.x
            neg ballDir.y
            mov axis[esi].x, -1
            mov axis[esi].y, -1
            ret
        .ENDIF
        
        add esi, SIZEOF POINT
    loop l0
    ret
grid_collision_check ENDP

printBorder PROC
	; for top and bottom
    mov ecx, maxCol
    l0:
        mGotoxy cl, 1
        mWrite 1
        mGotoxy cl, maxRow+1
        mWrite 1
        dec ecx
        cmp ecx, 0
        jge l0
			
	; for right and left
    mov ecx, maxRow    
    l1:
        mGotoxy 0, cl
        mWrite 2 ; try different char
        mGotoxy maxCol, cl 
        mWrite 2
        dec ecx
        cmp ecx, 1
        jg l1   
        
    ret
printBorder ENDP

printTitle1 PROC
    mGotoxy 0, 0
    mov  eax,white+(black*16)
    call SetTextColor
    mWrite "Name: "
    
    mov  eax,green+(black*16)
    call SetTextColor
    mov edx, OFFSET playerName
    call WriteString  

    
    mGotoxy 35, 0
    mov  eax,black+(white*16)
    call SetTextColor
    
    mov edx, OFFSET gameNameStr
    call WriteString
    
    mov  eax,white+(black*16)
    call SetTextColor
    mGotoxy 69, 0
    mWrite "Score: 1"
    
    mGotoxy 0, maxRow + 2
    mWrite "Live: "
       
    mov  eax,red+(black*16)
    call SetTextColor
    movzx ecx, life
    l0:
        mov al, lifeCh ; Heart
        call WriteChar
    loop l0


    mGotoxy 55, maxRow + 2
    call printTime
    ret
printTitle1 ENDP

updateScore PROC
    mov  eax,green+(black*16)
    call SetTextColor
    mGotoxy 76, 0
    mWrite "    " ;clean
    mGotoxy 76, 0
    mov eax, score
    call WriteDec
    
    mGotoxy 55, maxRow + 2
    call printTime
    
    ret
updateScore ENDP

core PROC
	;call UBorder
    
    .IF al != 'r'   ; Resume Game
        call Init_Grid
    .ELSE
        call Print_Block
    .ENDIF
    
    call printBorder
    call printTitle1
    
  	foreverLoop: 
        INVOKE GetKeyState, VK_ESCAPE
        .IF ah
            INVOKE  Beep, 600,500;
            jmp gamePause
        .ENDIF
	
        call BallMovement
        ;call Print_Block ; Stick ki flickering khatam karne ke liay           
        call stickMovement	
        
        call grid_collision_check
        
        call stickcolision
        cmp al, 1   ; collision 
        je finish
        
        .IF score == maxBlock
            jmp YouWinGame
        .ENDIF
        
        invoke Sleep, gameSpeed

        call EraseBall
        call EraseStick
        call updateScore
        
    resume:
        jmp foreverLoop
    YouWinGame:
        mov al, 'w'
        jmp return
    finish:        
        dec life
        call updateLife
        
        .IF life == 0
            mov al, 'o'
            jmp return
        .ENDIF
        
        mGotoxy 37, 15
        mWrite 223
        invoke Sleep, 200
        mWrite 223
        invoke Sleep, 200
        mWrite 223 
        invoke Sleep, 200
        mGotoxy 27, 16
        call WaitMsg
        
        mGotoxy 37, 15
        mWrite "   "
        mGotoxy 27, 16
        mWrite "                                "
       
        mGotoxy ball.x, ball.y
        mWrite " "
        
        jmp foreverLoop
    gamePause:
        mov al, 'p'        
        jmp return        
    return:
	ret
core ENDP

updateLife PROC
    mGotoxy 0, maxRow + 2
    mWrite "               "
    
    mGotoxy 0, maxRow + 2
    mWrite "Live: "

    mov  eax,red+(black*16)
    call SetTextColor
    
    .IF life == 0
        ret
    .ENDIF 
    
    movzx ecx, life
    l0:
        mov al, lifeCh ; Heart
        call WriteChar
    loop l0
    
    ret
updateLife ENDP


resetGame PROC
    mov stickPos.x, 38           
    mov stickPos.y, 25
	mov color_rand, 2 
    mov ball.x, 40
    mov ball.y, 25
    mov ballDir.x, 1
    mov ballDir.y, 1 
    mov score, 0
    mov life, 4
    ret
resetGame ENDP