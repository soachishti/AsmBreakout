include Irvine32.inc
include tests.asm

; Code to be testing.
include ../ui/ui.asm
include ../core/core.asm

.data
	; data here
.code 
main PROC
	call tests

	ret
main ENDP
END main
