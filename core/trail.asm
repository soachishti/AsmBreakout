include Irvine32.inc 
include core.asm

SetTextColor PROTO
.data

.code 
main PROC
	call core
    
	ret
main ENDP
END main
