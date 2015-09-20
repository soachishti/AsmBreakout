include Irvine32.inc
include tests.asm

.data
	; data here
.code 
main PROC
	call tests

	ret
main ENDP
END main
