; Pause menu
; Resume Game
; Restart Game
; Exit to main menu
; Exit to quit
.data
pausegame BYTE "GAME PAUSED",0ah,0dh,0
resumegame BYTE "     (R)esume",0ah,0dh,0
restartgame BYTE "  Restart (G)ame",0ah,0dh,0
exitmain BYTE "Exit to (M)ain Menu",0ah,0dh,0
exitgame1 BYTE "    (E)xit Game",0ah,0dh,0

dh_num1 BYTE 7

.code

s_pause PROC
        call s_nodelay_boundries
        call s_pausetextborder
        
		mov edx, OFFSET exitgame1
		push edx
		mov edx, OFFSET exitmain
		push edx
		mov edx, OFFSET restartgame
		push edx
		mov edx, OFFSET resumegame
		push edx
		mov edx, OFFSET pausegame
		push edx
		
		mov eax, WHITE
		call SetTextColor
		mov dl,34
		mov dh,6
		call GoToXY
			
		pop edx
		call WriteString
				
		inc dh_num1
		mov ecx,4
		
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
ret
s_pause ENDP