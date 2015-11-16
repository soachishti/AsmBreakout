include Irvine32.inc
include MACROS.inc

; Collecting team source
;include core\core.asm
;include ui\ui.asm
;include tests\tests.asm

.data
    titleStr    BYTE    "AsmBreakout v1.0", 0
.code 
main PROC
    invoke SetConsoleTitle, ADDR titleStr
       
   	;call tests
	;call core
	;call ui
	call WaitMsg
	exit
main ENDP
END main