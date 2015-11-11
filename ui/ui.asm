.data

; s_frontscreen data
g_welcome BYTE "WELCOME",0ah,0dh,0
g_to BYTE "TO",0ah,0dh,0
g_name BYTE "BREAKOUT",0ah,0dh,0ah,0dh,0

; s_frontboundries data
stars BYTE 178,0
inc_stars BYTE 0
	
.code 
include helperPROC.asm

ui PROC

	call s_frontboundries
	
	ret
ui ENDP

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
	
		ret

s_frontscreen ENDP

; ----------------------------------------------------------------------------------------------------------------------------------------

s_frontboundries PROC
		
		mov eax, GREEN
		call SetTextColor
		mov ecx,90
		
	Line1:
		mov dl,inc_stars
		mov dh,0
		call GoToXY
		mov edx, OFFSET stars
		mov eax, 40
		call Delay
		call WriteString
			
		inc inc_stars
			
	loop Line1
		
		mov ecx, 17
		mov inc_stars,1
		
	Line2:	
		mov dl,89
		mov dh,inc_stars
		call GoToXY
		mov edx, OFFSET stars
		mov eax, 70
		call Delay
		call WriteString
					
		inc inc_stars
			
	loop Line2
		
		mov ecx, 90
		mov inc_stars,89
		
	Line3:	
		mov dl,inc_stars
		mov dh,18
		call GoToXY
		mov edx, OFFSET stars
		mov eax, 40
		call Delay
		call WriteString
					
		dec inc_stars
						
	loop Line3
	
	
		mov ecx, 17
		mov inc_stars,17
		
	Line4:	
		mov dl,0
		mov dh,inc_stars
		call GoToXY
		mov edx, OFFSET stars
		mov eax, 70
		call Delay
		call WriteString
					
		dec inc_stars
		
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
		mov inc_stars,33
				
	Line1:
		mov dl,inc_stars
		mov dh,6
		call GoToXY	
		mov edx, OFFSET stars
		;mov eax, 40
		;call Delay
		call WriteString
			
		inc inc_stars
			
	loop Line1
				
		mov ecx, 7
		mov inc_stars,6
				
	Line2:	
		mov dl,53
		mov dh,inc_stars
		call GoToXY
		mov edx, OFFSET stars
		;mov eax, 70
		;call Delay
		call WriteString
					
		inc inc_stars
					
	loop Line2
				
		mov ecx, 20
		mov inc_stars,52
		
	Line3:	
		mov dl,inc_stars
		mov dh,12
		call GoToXY
		mov edx, OFFSET stars
		;mov eax, 40
		;call Delay
		call WriteString
							
		dec inc_stars
								
	loop Line3
			
			
		mov ecx, 7
		mov inc_stars,12
				
	Line4:	
		mov dl,33
		mov dh,inc_stars
		call GoToXY
		mov edx, OFFSET stars
		;mov eax, 70
		;call Delay
		call WriteString
							
		dec inc_stars
				
	loop Line4
	
	call s_frontscreen
	
	ret
s_textborder ENDP
