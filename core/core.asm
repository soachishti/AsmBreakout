
COORDv2 STRUCT
	X BYTE ?
	Y BYTE ?
COORDv2 ENDS

.data
    str1 BYTE "[======]",0
    Block1x COORDv2 <?>
	val1 BYTE 0
	val2 BYTE 0
	color_rand DWORD 2
.code 
include helperPROC.asm

core PROC
		
		mov ecx,10
	L1:
		
		mov al,val1
		mov bl,val2
		mov Block1x.X, al
		mov Block1x.Y, bl
		
		mov dl, Block1x.X
		mov dh, Block1x.Y 
		call Gotoxy   
        mov  eax,color_rand 
		call SetTextColor

		mov edx,OFFSET str1
		call writestring
		add val1,8
		add color_rand,1
		loop L1
		mov color_rand,3
		inc val2
		mov ecx,10
		
	L2:
		
		mov al,val1
		mov bl,val2
		mov Block1x.X, al
		mov Block1x.Y, bl
		
		mov dl, Block1x.X
		mov dh, Block1x.Y
		call Gotoxy
        mov  eax,color_rand
		call SetTextColor
   
		mov edx,OFFSET str1
		call writestring
		add val1,8
		add color_rand,1
		loop L2
		mov color_rand,4
		inc val2
		mov ecx,10
	L3:
		
		mov al,val1
		mov bl,val2
		mov Block1x.X, al
		mov Block1x.Y, bl
		
		mov dl, Block1x.X
		mov dh, Block1x.Y
		call Gotoxy
        mov  eax,color_rand
		call SetTextColor

		mov edx,OFFSET str1
		call writestring
		add val1,8
		add color_rand,1
		loop L3
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
