Include irvine32.inc
Include boundries.asm
; Pause menu
; Resume Game
; Restart Game
; Exit to main menu
; Exit to quit

.data
pausegame BYTE "GAME PAUSED",0ah,0dh,0
resumegame BYTE "     Resume",0ah,0dh,0
restartgame BYTE "  Restart Game",0ah,0dh,0
exitmain BYTE "Exit to Main Menu",0ah,0dh,0
exitgame BYTE "    Exit Game",0ah,0dh,0

dh_num BYTE 9

.code
main PROC
		call s_pausetextborder
		call s_pause

exit
main ENDP

s_pause PROC

		mov edx, OFFSET exitgame
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
		mov dl,39
		mov dh,8
		call GoToXY
			
		pop edx
		call WriteString
				
		inc dh_num
		mov ecx,4
		
		mov eax, YELLOW
		call SetTextColor
		
	text:
		mov dl,37
		mov dh,dh_num
		call GoToXY
		
		pop edx
		call WriteString
		
		inc dh_num
		
	loop text
		
		mov dl,30
		mov dh,dh_num
		call GoToXY
ret
s_pause ENDP
END main

