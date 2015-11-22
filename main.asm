include Irvine32.inc
INCLUDE Macros.inc 
INCLUDELIB Kernel32.Lib
INCLUDELIB User32.Lib

SetTextColor PROTO
Beep PROTO dwFreq:DWORD, dwDuration:DWORD

; Collecting team source
include core\core.asm
include ui\ui.asm
include tests\tests.asm

.data
    titleStr    BYTE    "AsmBreakout v1.0", 0
.code 
main PROC
    invoke SetConsoleTitle, ADDR titleStr 	
    
    ;call s_frontboundries   ; Front Screen
    ;call Clrscr
    
    ;call s_menu
    ;call Clrscr
    
    ;call s_about
    ;call Clrscr
    
    ;call s_pause
    ;call Clrscr
    
    call core
    
    call ReadChar
       
	exit
main ENDP
END main