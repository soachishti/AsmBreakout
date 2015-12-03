; RULES

.data
printrules BYTE "---> RULES <---",0
printline1 BYTE "In the game, a layer of bricks lines the top third of the screen.",0
printline2 BYTE "A ball travels across the screen, bouncing off the top",0 
printline2a BYTE  "                           and side walls of the screen.",0
printline3 BYTE "When a brick is hit, the ball bounces away and the brick is destroyed.",0
printline4 BYTE "The player loses a turn when the ball touches the bottom of the screen.",0
printline5 BYTE "To prevent this from happening, the player has a", 0
printline5b BYTE "         movable paddle to bounce the ball upward keeping it in play.",0
.code

s_rules PROC

	
	call s_nodelay_boundries
	mov eax,300
	call Delay
	call s_menutextborder

	
	mov eax, YELLOW
	call SetTextColor
	mov dh,3
	mov dl,33
	call GoToXy
	
	mov edx, OFFSET printrules
	call WriteString

;--------------------------------------

	mov dh,8
	mov dl,7
	call GoToXy
		
	mov edx, OFFSET printline1
	call WriteString
	
	mov dh,9
	mov dl,13
	call GoToXy
			
	mov edx, OFFSET printline2
	call WriteString
    
    mov dh,10
	mov dl,1
	call GoToXy
			
	mov edx, OFFSET printline2a
	call WriteString
	
	mov dh,11
	mov dl,4
	call GoToXy
		
	mov edx, OFFSET printline3
	call WriteString
	
	
	mov dh,13
	mov dl,3
	call GoToXy
		
	mov edx, OFFSET printline4
	call WriteString
	
	mov dh,14
	mov dl,14
	call GoToXy
		
	mov edx, OFFSET printline5
	call WriteString
    
    mov dh,15
	mov dl,1
	call GoToXy
			
	mov edx, OFFSET printline2a
	call WriteString
	
	call ReadChar
	
	
ret
s_rules ENDP