include Irvine32.inc
INCLUDELIB user32.lib
INCLUDE Macros.inc 
include core.asm

SetTextColor PROTO
.data

.code 
main PROC
	call core
    
	ret
main ENDP
END main
