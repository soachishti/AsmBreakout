.data

; s_frontscreen data
g_welcome BYTE "WELCOME",0ah,0dh,0
g_to BYTE "TO",0ah,0dh,0
g_name BYTE "BREAKOUT",0ah,0dh,0ah,0dh,0

; s_frontboundries data
bars BYTE 178,0
inc_bars BYTE 0

include mainmenu.asm
include about.asm
include pausescreen.asm
include gameover.asm
include youwin.asm
	
	
.code 
include helperPROC.asm
s_frontscreen PROC

		mov eax, 500
		call delay
		
		mov eax, yellow
		call SetTextColor
		
		mov dl, 40
		mov dh, 8
		call GoToXY
		
		mov edx, OFFSET g_welcome
		call WriteString
		
		mov dl, 42
		mov dh, 9
		call GoToXY
				
		mov edx, OFFSET g_to
		call WriteString
		
		
		mov dl, 39
		mov dh, 10
		call GoToXY
			
		mov edx, OFFSET g_name
		call WriteString
		
		mov dl, 30
		mov dh, 15
		call GoToXY
	
        call WaitMsg
        
		ret

s_frontscreen ENDP

; ----------------------------------------------------------------------------------------------------------------------------------------

s_frontboundries PROC
		
		mov eax, GREEN
		call SetTextColor
		mov ecx,80
		
	Line1:
		mov dl,inc_bars
		mov dh,0
		call GoToXY
		mov edx, OFFSET bars
		mov eax, 40
		call Delay
		call WriteString
			
		inc inc_bars
			
	loop Line1

		mov ecx, 17
		mov inc_bars,1
		
	Line2:	
		mov dl,79
		mov dh,inc_bars
		call GoToXY
		mov edx, OFFSET bars
		mov eax, 70
		call Delay
		call WriteString
					
		inc inc_bars
			
	loop Line2
		mov ecx, 80
		mov inc_bars,79
		
	Line3:	
		mov dl,inc_bars
		mov dh,18
		call GoToXY
		mov edx, OFFSET bars
		mov eax, 40
		call Delay
		call WriteString
					
		dec inc_bars
						
	loop Line3
	
	
		mov ecx, 17
		mov inc_bars,17
		
	Line4:	
		mov dl,0
		mov dh,inc_bars
		call GoToXY
		mov edx, OFFSET bars
		mov eax, 70
		call Delay
		call WriteString
					
		dec inc_bars
		
	loop Line4
	
		call s_textborder
		ret
s_frontboundries ENDP


; -----------------------------------------------------------------------------------------------------------------------------------------

s_textborder PROC

		mov eax, RED
		call SetTextColor
		
		mov eax, 600
		call delay
		
		mov ecx,20
		mov inc_bars,33
				
	Line1:
		mov dl,inc_bars
		mov dh,6
		call GoToXY	
		mov edx, OFFSET bars
		;mov eax, 40
		;call Delay
		call WriteString
			
		inc inc_bars
			
	loop Line1
				
		mov ecx, 7
		mov inc_bars,6
				
	Line2:	
		mov dl,53
		mov dh,inc_bars
		call GoToXY
		mov edx, OFFSET bars
		;mov eax, 70
		;call Delay
		call WriteString
					
		inc inc_bars
					
	loop Line2
				
		mov ecx, 20
		mov inc_bars,52
		
	Line3:	
		mov dl,inc_bars
		mov dh,12
		call GoToXY
		mov edx, OFFSET bars
		;mov eax, 40
		;call Delay
		call WriteString
							
		dec inc_bars
								
	loop Line3
			
			
		mov ecx, 7
		mov inc_bars,12
				
	Line4:	
		mov dl,33
		mov dh,inc_bars
		call GoToXY
		mov edx, OFFSET bars
		;mov eax, 70
		;call Delay
		call WriteString
							
		dec inc_bars
				
	loop Line4
	
	call s_frontscreen
	
	ret
s_textborder ENDP