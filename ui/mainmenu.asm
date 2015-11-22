Include boundries.asm
; Main Menu screen
; Start Game
; Rules
; Credits
; Exit

SetTextColor PROTO
.data
breakout BYTE "BREAKOUT",0ah,0dh,0
menu BYTE "GAME MAIN MENU",0ah,0dh,0
start BYTE "Start Game",0ah,0dh,0
rules BYTE "  Rules",0ah,0dh,0
credits BYTE " Credits",0ah,0dh,0
exitgame BYTE "  Exit",0ah,0dh,0

; Arrows
pointright BYTE 175,0
pointleft BYTE 174,0
dl_numright BYTE 28
dl_numleft BYTE 59

speed DWORD 300
dh_num BYTE 6

.code

s_menu PROC
	call s_nodelay_boundries
	mov eax,300
	call Delay
	call s_menutextborder
	call s_mainmenu

    ret
s_menu ENDP

s_mainmenu PROC

		mov edx, OFFSET exitgame
		push edx
		mov edx, OFFSET credits
		push edx
		mov edx, OFFSET rules
		push edx
		mov edx, OFFSET start
		push edx
		mov edx, OFFSET menu
		push edx
		mov edx, OFFSET breakout
		push edx
		
		mov eax, GREEN
		call SetTextColor	
		
		mov ecx,10
		
	arrows:
		mov dl,dl_numright
		mov dh,3
		call GoToXY
		
		mov eax,100
		call Delay
		mov edx, OFFSET pointright
		call WriteString
		
		inc dl_numright
		
		mov dl,dl_numleft
		mov dh,3
		call GoToXY
		
		mov eax,100
		call Delay
		mov edx, OFFSET pointleft
		call WriteString
		
		dec dl_numleft
	
	loop arrows
	
			mov dl,40
			mov dh,3
			call GoToXY
			pop edx
			call WriteString
			
			mov dl,37
			mov dh,4
			call GoToXY
			pop edx
		call WriteString
		
; ---------------------------------------------------------------------------

		mov ecx,4
		mov eax, YELLOW
		call SetTextColor
	text:
		add dh_num,2
		
		mov dl,39
		mov dh,dh_num
		call GoToXY
		mov eax, speed
		call Delay
		pop edx
		call WriteString
			
	loop text
		
		mov eax, speed
		call Delay
		mov dl,30
		mov dh,18
		call GoToXY

ret
s_mainmenu ENDP
