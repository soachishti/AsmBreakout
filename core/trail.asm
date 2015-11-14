include Irvine32.inc
INCLUDE Macros.inc 
INCLUDELIB Kernel32.Lib
INCLUDELIB User32.Lib

SetTextColor PROTO
Beep PROTO dwFreq:DWORD, dwDuration:DWORD

include core.asm

.data

.code 
main PROC
	call core
    
	ret
main ENDP
END main
