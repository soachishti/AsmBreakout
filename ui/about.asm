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
bars1 BYTE 178,0

.code

s_about PROC
		call s_nodelay_boundries
        
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
		
        mov num,2
		mov dl,29
		mov dh,num
		call GoToXY
		pop edx
		call WriteString							; Printing Breakout Developers
		
		mov ecx, 4
		add num, 2
		
	L1:
	
		mov eax, CYAN
		call SetTextColor
		
		mov eax,600
		call Delay
		
		mov dl,19
		mov dh,num
		call GoTOXY
		pop edx
		call WriteString							; Printing Roles
		
		mov eax, YELLOW
		call SetTextColor
		
		mov dl,42
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
		
		mov dl,32
		mov dh,num
		call GoTOXY
		pop edx
		call WriteString							; Printing Titles	
				
		mov eax, YELLOW
		call SetTextColor
				
		add num,1
		
		mov dl,28
		mov dh,num
		call GoTOXY
		pop edx
		call WriteString							; Printing Lang and name
				
		add num,2
				
		loop L2
		
		ret
s_about ENDP