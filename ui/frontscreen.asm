Include irvine32.inc
Include boundries.asm

 ;call ui
.data

; s_frontscreen data
g_welcome BYTE "WELCOME",0ah,0dh,0
g_to BYTE "TO",0ah,0dh,0
g_name BYTE "BREAKOUT",0ah,0dh,0ah,0dh,0

; s_frontboundries data
bars BYTE 240,0
bars_num BYTE 0
	
num DWORD 1

; Controlling delay speed
speed DWORD 80

;colors 3,6,9,12,13,14

.code 
;include helperPROC.asm
main PROC

		
	call s_frontboundries
	
	mov eax, 12
	call SetTextColor
	call s_alphaB
	
	mov eax, 6
	call SetTextColor
	call s_alphaR
	
	mov eax, 5
	call SetTextColor
	call s_alphaE
	
	mov eax, 3
	call SetTextColor
	call s_alphaA	
	
	mov eax, 9
	call SetTextColor
	call s_alphaK
	
	mov eax, 14
	call SetTextColor
	call s_alphaO
	
	mov eax, 13
	call SetTextColor
	call s_alphaU
	
	mov eax, 8
	call SetTextColor
	call s_alphaT
exit
main ENDP

;=================================================================
;=================================================================
;=================================================================

s_alphaB PROC

		mov ecx,7
		mov bars_num,9
		
		straightline: 	
				
			mov dl,12
			mov dh,bars_num
			call GoToXY
				
			mov eax,speed
			call delay	
			mov edx, OFFSET bars
			call WriteString
			
			dec bars_num
			
		loop straightline
		
;----------------------------------------------------------
		
			mov ecx,7
			mov bars_num,12
			
		vert1a:
			
			mov dl,bars_num
			mov dh,3
			call GoToXY
			
			mov eax,speed
			call delay	
			mov edx, OFFSET bars
			call WriteString
			
			inc bars_num			

		loop vert1a
		
;-----------------------------------------------------------
		
			mov dl,19
			mov dh,4
			call GoToXY
				
			mov eax,speed
			call delay	
			mov edx, OFFSET bars
			call WriteString
				
			mov dl,19
			mov dh,5
			call GoToXY
				
			mov eax,speed
			call delay	
			mov edx, OFFSET bars
			call WriteString
			
;-----------------------------------------------------------
		
			mov ecx,6
			mov bars_num,18
			
		vert1b:
					
			mov dl,bars_num
			mov dh,6
			call GoToXY
					
			mov eax,speed
			call delay			
			mov edx, OFFSET bars
			call WriteString
					
			dec bars_num			
		
		loop vert1b
		
;-----------------------------------------------------------
		
			mov dl,20
			mov dh,6	
			call GoToXY
			
			mov eax,speed
			call delay
			mov edx, OFFSET bars
			call WriteString
			
			mov dl,21
			mov dh,7
			call GoToXY
			
			mov eax,speed
			call delay
			mov edx, OFFSET bars
			call WriteString
			
			mov dl,21
			mov dh,8
			call GoToXY
			
			mov eax,speed
			call delay
			mov edx, OFFSET bars
			call WriteString	
			
;------------------------------------------------------------
			
			mov ecx,8
			mov bars_num,20
			
		vert2:
			
			mov dl,bars_num
			mov dh,9
			call GoToXY
					
			mov eax,speed
			call delay			
			mov edx, OFFSET bars
			call WriteString
					
			dec bars_num	
				
		loop vert2
		
;-------------------------------------------------------------
				
ret
s_alphaB ENDP

;=================================================================
;=================================================================
;=================================================================


s_alphaR PROC

		mov ecx,7
		mov bars_num,9
		
	straightline: 	
				
		mov dl,24
		mov dh,bars_num
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		dec bars_num
			
	loop straightline
	
	
;----------------------------------------------------------
		
		mov ecx,7
		mov bars_num,24
			
	vert1a:
			
		mov dl,bars_num
		mov dh,3
		call GoToXY
			
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		inc bars_num			

	loop vert1a
	
;-----------------------------------------------------------
		
		mov dl,31
		mov dh,4
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
				
		mov dl,31
		mov dh,5
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
		
;-----------------------------------------------------------
		
		mov ecx,6
		mov bars_num,30
			
	vert1b:
					
		mov dl,bars_num
		mov dh,6		
		call GoToXY
					
		mov eax,speed
		call delay			
		mov edx, OFFSET bars
		call WriteString
					
		dec bars_num			
		
	loop vert1b
		
;-------------------------------------------------------------
; R Italic line		
		
		mov dl,30
		mov dh,7
		call GoToXY
		
		mov eax,speed
		call delay			
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,31
		mov dh,8
		call GoToXY
		
		mov eax,speed
		call delay			
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,32
		mov dh,9
		call GoToXY
		
		mov eax,speed
		call delay			
		mov edx, OFFSET bars
		call WriteString		
		
;----------------------------------------------------------------		
		
ret
s_alphaR ENDP

;=================================================================
;=================================================================
;=================================================================

s_alphaE PROC


		mov ecx,7
		mov bars_num,9
		
	straightline: 	
				
		mov dl,35
		mov dh,bars_num
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		dec bars_num
			
	loop straightline
	
;----------------------------------------------------------

		mov ecx,7
		mov bars_num,35
			
	vert1b:
			
		mov dl,bars_num
		mov dh,6
		call GoToXY
			
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		inc bars_num			

	loop vert1b
	
	;-----------------------------
		mov ecx,7
		mov bars_num,35
			
	vert1ac:
		
		; Vertical line A
		mov dl,bars_num
		mov dh,3
		call GoToXY
			
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		; Vertical line C
		mov dl,bars_num
		mov dh,9
		call GoToXY
						
		mov edx, OFFSET bars
		call WriteString
		inc bars_num			

	loop vert1ac
				
ret
s_alphaE ENDP

;=================================================================
;=================================================================
;=================================================================

s_alphaA PROC


		mov ecx,4
		mov bars_num,9
		
	straightline: 	
				
		mov dl,44
		mov dh,bars_num
		call GoToXY
		
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		mov dl,52
		mov dh,bars_num
		call GoToXY
		
		mov edx, OFFSET bars
		call WriteString
		
		dec bars_num
			
	loop straightline
	
;----------------------------------------------------------

		mov eax,speed
		call delay
		
		mov dl,45
		mov dh,5
		call GoToXY
		
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,51
		mov dh,5
		call GoToXY
				
		mov edx, OFFSET bars
		call WriteString
		
		;-------------------- 
		
		mov eax,speed
		call delay
		
		mov dl,46
		mov dh,4
		call GoToXY
		
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,50
		mov dh,4
		call GoToXY
				
		mov edx, OFFSET bars
		call WriteString
		
		;---------------------
		
		mov eax,speed
		call delay
		
		mov dl,47
		mov dh,3
		call GoToXY
		
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,49
		mov dh,3
		call GoToXY
				
		mov edx, OFFSET bars
		call WriteString		
		
		mov dl,48
		mov dh,3
		call GoToXY
				
		mov edx, OFFSET bars
		call WriteString
		
;-----------------------------------------------------------

		mov ecx,9
		mov bars_num,44
			
	vert1:
			
		mov dl,bars_num
		mov dh,6
		call GoToXY
			
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		inc bars_num			

	loop vert1
	
ret
s_alphaA ENDP

;=================================================================
;=================================================================
;=================================================================

s_alphaK PROC


		mov ecx,7
		mov bars_num,9
		
	straightline: 	
				
		mov dl,55
		mov dh,bars_num
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
			
		dec bars_num
			
	loop straightline
	
;----------------------------------------------------------
		
		mov dl,57
		mov dh,6
		call GoToXY
		
		mov eax,speed
		call delay
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,59
		mov dh,5
		call GoToXY
		
		mov eax,speed
		call delay
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,59
		mov dh,7
		call GoToXY
		
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,60
		mov dh,4
		call GoToXY
		
		mov eax,speed
		call delay
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,60
		mov dh,8
		call GoToXY
		
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,62
		mov dh,3
		call GoToXY
		
		mov eax,speed
		call delay
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,62
		mov dh,9
		call GoToXY
		
		mov edx, OFFSET bars
		call WriteString
		
ret
s_alphaK ENDP

;=================================================================
;=================================================================
;=================================================================

s_alphaO PROC


		mov ecx,3
		mov bars_num,13
		
	straightline: 	
				
		mov dl,44
		mov dh,bars_num
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,52
		mov dh,bars_num
		call GoToXY
					
		mov edx, OFFSET bars
		call WriteString		
			
		inc bars_num
			
	loop straightline
	
;----------------------------------------------------------------
		mov dl,45 
		mov dh,12
		call GoToXY
		
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString
		
		;-----------------------
		
		mov dl,45
		mov dh,16
		call GoToXY
				
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString
		
		mov ecx,5
		mov bars_num,46
	
;----------------------------------------------------------------------
	horiline:
		
		mov dl, bars_num
		mov dh,11
		call GoToXY
		
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,bars_num
		mov dh,17
		call GoToXY
		
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString
				
		inc bars_num
		
	loop horiline
	
;-----------------------------------------------------------
		mov dl,51 
		mov dh,12
		call GoToXY
				
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString

		mov dl,51 
		mov dh,16
		call GoToXY
				
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString		

ret
s_alphaO ENDP

;=================================================================
;=================================================================
;=================================================================

s_alphaU PROC

		mov ecx,5
		mov bars_num,11
		
	straightline: 	
				
		mov dl,55
		mov dh,bars_num
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
		
		mov dl,62
		mov dh,bars_num
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString		
			
		inc bars_num
			
	loop straightline
	
;----------------------------------------------------------

		mov dl, 56
		mov dh,16
		call GoToXY

		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString

;----------------------------------------------------------------------

		mov ecx,4
		mov bars_num,57
		
	horiline:
		
		mov dl, bars_num
		mov dh,17
		call GoToXY
		
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString
				
		inc bars_num
		
	loop horiline
	
;----------------------------------------------------------------------

		mov dl,61
		mov dh,16
		call GoToXY

		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString

ret
s_alphaU ENDP

;=================================================================
;=================================================================
;=================================================================


s_alphaT PROC

		mov ecx,9
		mov bars_num,65
		
	horiline:
		
		mov dl, bars_num
		mov dh,11
		call GoToXY
		
		mov eax, speed
		call DELAY
		mov edx, OFFSET bars
		call WriteString
				
		inc bars_num
		
	loop horiline
	
;----------------------------------------------------------------------

		mov ecx,7
		mov bars_num,11
		
	straightline: 	
				
		mov dl,69
		mov dh,bars_num
		call GoToXY
				
		mov eax,speed
		call delay	
		mov edx, OFFSET bars
		call WriteString
		
		inc bars_num
			
	loop straightline
	
	mov dl,2
	mov dh,18
	call GoToXY
	call WaitMsg
	

ret
s_alphaT ENDP

END main

	