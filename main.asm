include Irvine32.inc

; Collecting team source
include core\core.asm
include ui\ui.asm
include tests\tests.asm

.code 
main PROC
    call tests
	call core
	call ui
	
	exit
main ENDP
END main