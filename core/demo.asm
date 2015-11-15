Include irvine32.inc

.data
	a BYTE 1,1,2,3,4
	b BYTE 5,6,7,1,9
.code
sum_pair PROC
		mov ecx,LENGTHOF a
		mov esi,OFFSET a
		mov edx,OFFSET b
	L1:
		mov eax,[esi]
		mov ebx,[edx]
		add eax,ebx
		call writehex
		call dumpregs
		add esi,1
		add edx,1
	loop L1
	ret
sum_pair ENDP
main PROC
	call sum_pair
	exit
main ENDP
END main