
POINT STRUCT
	x BYTE ?
	y BYTE ?
POINT ENDS

.data
	block BYTE "[======]",0
	sizeA = 10
	axis POINT sizeA DUP(<?,?>)
	axis1 POINT sizeA DUP(<?,?>)
	axis2 POINT sizeA DUP(<?,?>)
	val1 BYTE 0
	val2 BYTE 0
	color_rand DWORD 2
.code 
include helperPROC.asm
eraseBlock PROC

ret
eraseBlock ENDP
core PROC
	mov eax, 0
	mov esi, 0
	mov ecx, 10
	row1:
		mov al,val1
		mov ah,val2
		mov axis[esi].x,al 
		mov axis[esi].y,ah
	
		mov dl, axis[esi].x
		mov dh, axis[esi].y
		call Gotoxy
		
		mov eax,color_rand
		call SetTextColor
		
		mov edx,OFFSET block
		call writestring
		add val1,8	
		add color_rand,1
	loop row1	
		
		mov color_rand,3
		add val2,1
		mov ecx,10
		
	row2:
		mov al,val1
		mov ah,val2
		mov axis1[esi].x,al
		mov axis1[esi].y,ah
		
		mov dl,axis1[esi].x
		mov dh,axis1[esi].y
		call Gotoxy
		
		mov eax,color_rand
		call SetTextColor
		
		mov edx,OFFSET block
		call writestring
		add val1,8
		add color_rand,1
	loop row2
		
		mov color_rand,4
		add val2,1
		mov ecx,10
		
	row3:
		mov al,val1
		mov ah,val2
		mov axis2[esi].x,al
		mov axis2[esi].y,ah
		
		mov dl,axis2[esi].x
		mov dh,axis2[esi].y
		call Gotoxy 
		
		mov eax,color_rand
		call SetTextColor
		
		mov edx,OFFSET block
		call writestring
		add val1,8
		add color_rand,1
	loop row3
		
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf


	ret
core ENDP
