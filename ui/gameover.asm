; Pause menu
; Resume Game
; Restart Game
; Exit to main menu
; Exit to quit
.data
gameover1 BYTE "  !!! Game Over !!!",0ah,0dh,0
restartgame1 BYTE "  Restart (G)ame",0ah,0dh,0
exitmain1 BYTE "Exit to (M)ain Menu",0ah,0dh,0
exitgame2 BYTE "    (E)xit Game",0ah,0dh,0

.code

s_gameover PROC
        mov dh_num1, 8

        
        mGotoxy 35, 7 
        mWrite "SCORE: "
        mov eax, score
        call WriteInt
        
        call s_nodelay_boundries
        call s_pausetextborder
        
		mov edx, OFFSET exitgame2
		push edx
		mov edx, OFFSET exitmain1
		push edx
		mov edx, OFFSET restartgame1
		push edx
		mov edx, OFFSET gameover1
		push edx
		
		mov eax, WHITE
		call SetTextColor
		mov dl,30
		mov dh,6
		call GoToXY
			
		pop edx
		call WriteString
				
		inc dh_num1
		mov ecx,3
		
		mov eax, YELLOW
		call SetTextColor
		
	text:
		mov dl,31
		mov dh,dh_num1
		call GoToXY
		
		pop edx
		call WriteString
		
		inc dh_num1
		
	loop text
		
		mov dl,15
		mov dh,dh_num1
		call GoToXY
        
        
        tryagain:
        mGotoxy 37, 12
        mov eax, RED
		call SetTextColor
        mWrite "Key: "
        call ReadChar
        .IF al == 'g' || al == 'm' || al == 'e'
            ret
        .ELSE    
            jmp tryagain
        .ENDIF
        
ret
s_gameover ENDP