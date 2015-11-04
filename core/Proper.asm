Include Irvine32.inc
.code
main PROC
        xor     eax, eax
        mov     ax, 0ABCDh
        mov     bx, 0EF01h
        call    DumpRegs
        shrd    ax, bx, 4
        call    DumpRegs
    exit
main ENDP
END main
