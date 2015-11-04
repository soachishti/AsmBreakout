include Irvine32.inc
include core.asm

.data
	   str1 BYTE "[======]",0
    Block1x COORDv2 <?>
	val1 BYTE 0
	val2 BYTE 0

.code 
main PROC
	call core
    
	ret
main ENDP
END main
