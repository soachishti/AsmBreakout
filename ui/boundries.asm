.data

; s_frontboundries data
bars_bound BYTE 178,0

bars_top BYTE 0
bars_bottom BYTE 79
bars_right BYTE 1
bars_left BYTE 19

speed_bars_hor DWORD 10
speed_bars_ver DWORD 20

; s_menutextborders data
inc_bars2 BYTE ?
bars_star BYTE "*",0


.code

s_nodelay_boundries PROC
		
		mov eax, GREEN
		call SetTextColor
		mov ecx,80
		
	Lines_hor:
		mov dl,bars_top
		mov dh,0
		call GoToXY
		mov edx, OFFSET bars_bound
		call WriteString
			
		inc bars_top
		
		mov dl,bars_bottom
		mov dh,19
		call GoToXY
		mov edx, OFFSET bars_bound
		call WriteString
							
		dec bars_bottom
			
	loop Lines_hor
		
		mov ecx, 19
		
	Lines_ver:	
		mov dl,79
		mov dh,bars_right
		call GoToXY
		mov edx, OFFSET bars_bound
		call WriteString
					
		inc bars_right
		
		mov dl,0
		mov dh,bars_left
		call GoToXY
		mov edx, OFFSET bars_bound
		call WriteString
							
		dec bars_left
		
	loop Lines_ver
	
ret
s_nodelay_boundries ENDP

s_menutextborder PROC

		mov eax, RED
		call SetTextColor
		
		;mov eax, 600
		;call delay
		
		mov ecx,72
		mov inc_bars2,4
				
	Line1:
		mov dl,inc_bars2
		mov dh,2
		call GoToXY	
		mov edx, OFFSET bars_star
		;mov eax, 40
		;call Delay
		call WriteString
			
		inc inc_bars2
			
	loop Line1
				
		mov ecx, 3
		mov inc_bars2,2
				
	Line2:	
		mov dl,76	
		mov dh,inc_bars2
		call GoToXY
		mov edx, OFFSET bars_star
		;mov eax, 70
		;call Delay
		call WriteString
					
		inc inc_bars2
					
	loop Line2
				
		mov ecx, 72
		mov inc_bars2,76
		
	Line3:	
		mov dl,inc_bars2
		mov dh,5
		call GoToXY
		mov edx, OFFSET bars_star
		;mov eax, 40
		;call Delay
		call WriteString
							
		dec inc_bars2
								
	loop Line3
			
			
		mov ecx, 3
		mov inc_bars2,5
				
	Line4:	
		mov dl,4
		mov dh,inc_bars2
		call GoToXY
		mov edx, OFFSET bars_star
		;mov eax, 70
		;call Delay
		call WriteString
							
		dec inc_bars2
				
	loop Line4
	
ret
s_menutextborder ENDP

s_pausetextborder PROC
		
		mov eax, RED
		call SetTextColor
		
		mov ecx,40
		
		mov bars_top, 20
		mov bars_bottom, 59
	Lines_hor:
		mov dl,bars_top
		mov dh,4
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_hor
		call Delay
		call WriteString
			
		inc bars_top
		
		mov dl,bars_bottom
		mov dh,14
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_hor
		call Delay
		call WriteString
							
		dec bars_bottom
			
	loop Lines_hor
		
		mov ecx,10
		mov bars_right,4
		mov bars_left,14
		
	Lines_ver:	
		mov dl,59
		mov dh,bars_right
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_ver
		call Delay
		call WriteString
					
		inc bars_right
		
		mov dl,20
		mov dh,bars_left
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_ver
		call Delay
		call WriteString
							
		dec bars_left
		
	loop Lines_ver
	
ret
s_pausetextborder ENDP