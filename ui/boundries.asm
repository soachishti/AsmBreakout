.data

; s_frontboundries data
bars_bound BYTE 178,0

bars_top BYTE 0
bars_bottom BYTE 89
bars_right BYTE 1
bars_left BYTE 19

speed_bars_hor DWORD 10
speed_bars_ver DWORD 20

; s_menutextborders data
inc_bars BYTE ?
bars_star BYTE "*",0


.code

s_frontboundries PROC
		
		mov eax, GREEN
		call SetTextColor
		mov ecx,90
		
	Lines_hor:
		mov dl,bars_top
		mov dh,0
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_hor
		call Delay
		call WriteString
			
		inc bars_top
		
		mov dl,bars_bottom
		mov dh,19
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_hor
		call Delay
		call WriteString
							
		dec bars_bottom
			
	loop Lines_hor
		
		mov ecx, 19
		
	Lines_ver:	
		mov dl,89
		mov dh,bars_right
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_ver
		call Delay
		call WriteString
					
		inc bars_right
		
		mov dl,0
		mov dh,bars_left
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_ver
		call Delay
		call WriteString
							
		dec bars_left
		
	loop Lines_ver
	
ret
s_frontboundries ENDP

s_nodelay_boundries PROC
		
		mov eax, GREEN
		call SetTextColor
		mov ecx,90
		
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
		mov dl,89
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
		
		mov ecx,82
		mov inc_bars,4
				
	Line1:
		mov dl,inc_bars
		mov dh,2
		call GoToXY	
		mov edx, OFFSET bars_star
		;mov eax, 40
		;call Delay
		call WriteString
			
		inc inc_bars
			
	loop Line1
				
		mov ecx, 3
		mov inc_bars,2
				
	Line2:	
		mov dl,86	
		mov dh,inc_bars
		call GoToXY
		mov edx, OFFSET bars_star
		;mov eax, 70
		;call Delay
		call WriteString
					
		inc inc_bars
					
	loop Line2
				
		mov ecx, 82
		mov inc_bars,86
		
	Line3:	
		mov dl,inc_bars
		mov dh,5
		call GoToXY
		mov edx, OFFSET bars_star
		;mov eax, 40
		;call Delay
		call WriteString
							
		dec inc_bars
								
	loop Line3
			
			
		mov ecx, 3
		mov inc_bars,5
				
	Line4:	
		mov dl,4
		mov dh,inc_bars
		call GoToXY
		mov edx, OFFSET bars_star
		;mov eax, 70
		;call Delay
		call WriteString
							
		dec inc_bars
				
	loop Line4
	
ret
s_menutextborder ENDP

s_pausetextborder PROC
		
		mov eax, RED
		call SetTextColor
		
		mov ecx,40
		
		mov bars_top, 25
		mov bars_bottom, 64
	Lines_hor:
		mov dl,bars_top
		mov dh,6
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_hor
		call Delay
		call WriteString
			
		inc bars_top
		
		mov dl,bars_bottom
		mov dh,16
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_hor
		call Delay
		call WriteString
							
		dec bars_bottom
			
	loop Lines_hor
		
		mov ecx,10
		mov bars_right,6
		mov bars_left,15
		
	Lines_ver:	
		mov dl,64
		mov dh,bars_right
		call GoToXY
		mov edx, OFFSET bars_bound
		mov eax, speed_bars_ver
		call Delay
		call WriteString
					
		inc bars_right
		
		mov dl,25
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