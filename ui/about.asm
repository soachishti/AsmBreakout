include irvine32.inc

; About PAGE
.data

printTitle BYTE '"BREAKOUT DEVELOPERS"',0ah,0dh,0 

printOwaisRole BYTE "PROJECT MANAGER",0ah,0dh,0 
	
printZerkRole BYTE " CORE DEVELOPER",0ah,0dh,0
	
printShaleemRole BYTE "   UI DEVELOPER",0ah,0dh,0
	
printFaisalRole BYTE "    SOFTWARE QA",0ah,0dh,0

printOwais BYTE "Syed Owais Ali Chisti",0ah,0dh,0 
	
printZerk BYTE "Zerk Shaban",0ah,0dh,0
	
printShaleem BYTE "Shaleem John",0ah,0dh,0
	
printFaisal BYTE "Faisal Usman",0ah,0dh,0

printLanguageTitle BYTE "LANGUAGE USED",0ah,0dh,0

printSubmitTitle BYTE "SUBMITTED TO",0ah,0dh,0

printLanguage BYTE "       Assembly",0ah,0dh,0

printSubmit BYTE "Sir Muhammad Tehseen",0ah,0dh,0


num BYTE ?

; s_frontboundries data
bars BYTE 178,0
inc_bars BYTE 0

.code

main PROC
		
		call s_about
		;call s_frontboundries

exit
main ENDP


s_about PROC
		
		mov edx,OFFSET printFaisal
		push edx
		mov edx, OFFSET printFaisalRole
		push edx
		mov edx,OFFSET printShaleem
		push edx
		mov edx, OFFSET printShaleemRole
		push edx
		mov edx,OFFSET printZerk
		push edx
		mov edx, OFFSET printZerkRole
		push edx
		mov edx,OFFSET printOwais
		push edx
		mov edx, OFFSET printOwaisRole
		push edx
		mov edx, OFFSET printTitle
		push edx
		
		mov dl,34
		mov dh,18
		call GoToXY
		pop edx
		call WriteString							; Printing Breakout Developers
		
		mov ecx, 4
		mov num,20
		
	L1:
	
		mov eax, CYAN
		call SetTextColor
		
		mov eax,600
		call Delay
		
		mov dl,24
		mov dh,num
		call GoTOXY
		pop edx
		call WriteString							; Printing Roles
		
		mov eax, YELLOW
		call SetTextColor
		
		mov dl,47
		mov dh,num
		call GoTOXY
		pop edx
		call WriteString							; Printing Names
		
		add num,2
		
		loop L1
		
; -----------------------------------------
		
		
		mov edx,OFFSET printSubmit
		push edx
		mov edx,OFFSET printSubmitTitle
		push edx
		mov edx,OFFSET printLanguage
		push edx
		mov edx,OFFSET printLanguageTitle
		push edx
		
		mov ecx, 2
		
		add num,1
		
	L2:
	
		mov eax, CYAN
		call SetTextColor
		
		mov eax,600
		call Delay
		
		mov dl,37
		mov dh,num
		call GoTOXY
		pop edx
		call WriteString							; Printing Titles	
				
		mov eax, YELLOW
		call SetTextColor
				
		add num,1
		
		mov dl,33
		mov dh,num
		call GoTOXY
		pop edx
		call WriteString							; Printing Lang and name
				
		add num,2
				
		loop L2
		
		ret
s_about ENDP

; ------------------------------------------------------------------------------------------------------
; ------------------------------------------------------------------------------------------------------

s_frontboundries PROC
		
		mov eax, GREEN
		call SetTextColor
		mov ecx,90
		
	Line1:
		mov dl,inc_bars
		mov dh,0
		call GoToXY
		mov edx, OFFSET bars
		;mov eax, 40
		;call Delay
		call WriteString
			
		inc inc_bars
			
	loop Line1
		
		mov ecx, 17
		mov inc_bars,1
		
	Line2:	
		mov dl,89
		mov dh,inc_bars
		call GoToXY
		mov edx, OFFSET bars
		;mov eax, 70
		;call Delay
		call WriteString
					
		inc inc_bars
			
	loop Line2
		
		mov ecx, 90
		mov inc_bars,89
		
	
	Line3:	
		mov dl,inc_bars
		mov dh,18
		call GoToXY
		mov edx, OFFSET bars
		;mov eax, 40
		;call Delay
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
		;mov eax, 70
		;call Delay
		call WriteString
					
		dec inc_bars
		
	loop Line4
	
	
		;call s_textborder
		
		ret
s_frontboundries ENDP

END main