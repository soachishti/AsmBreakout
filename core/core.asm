include irvine32.inc
include MACROS.inc
COORDv2 STRUCT
	X BYTE ?
	Y BYTE ?
COORDv2 ENDS

.data
   str1 BYTE "[======]",0
    Block1x COORDv2 <?>
	val1 BYTE 0
	val2 BYTE 0

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
           
		mov edx,OFFSET str1
		call writestring
		add val1,8
		loop L1
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
           
		mov edx,OFFSET str1
		call writestring
		add val1,8
		loop L2
		
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
           
		mov edx,OFFSET str1
		call writestring
		add val1,8
		loop L3

		call dumpregs
	ret
core ENDP
