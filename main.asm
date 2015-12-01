include Irvine32.inc
INCLUDE Macros.inc 
INCLUDELIB Kernel32.lib
INCLUDELIB User32.Lib
INCLUDE     GraphWin.inc

VK_ESCAPE		EQU		00000001bh
VK_LBUTTON		EQU		000000001h
VK_RBUTTON		EQU		000000002h

DeleteFile PROTO lpFileName:DWORD
SetTextColor PROTO
Beep PROTO dwFreq:DWORD, dwDuration:DWORD

GetCursorPos                PROTO, lpPoint:DWORD
ScreenToClient PROTO, hWnd:DWORD, lpPoint:DWORD
GetConsoleWindow            PROTO
GetKeyState                 PROTO :DWORD

.data
    gameNameStr    BYTE    "AsmBreakout v1.0", 0
    clsText        BYTE     80 DUP(' '), 0
    PlayerName     BYTE    51 DUP(?)
    
    
    cursorPos POINT <?,?>
    hwndConsole DWORD ?
    hStdOut DWORD ?
    screen RECT <>
    
.code 

; Collecting team source
include core\core.asm
include ui\ui.asm
include misc\misc.asm

main PROC    
    invoke SetConsoleTitle, ADDR gameNameStr	
    
    call s_frontboundries   ; Front Screen
    
    INVOKE  GetConsoleWindow
    mov     hwndConsole,eax
    
    INVOKE  GetStdHandle,STD_OUTPUT_HANDLE
    mov     hStdOut,eax
    mouseCheck:
         INVOKE GetCursorPos, ADDR cursorPos
         INVOKE ScreenToClient, hwndConsole, ADDR cursorPos

        .IF cursorPos.X > 290 && cursorPos.X < 398 && cursorPos.Y > 201 && cursorPos.Y < 229
            INVOKE  GetKeyState,VK_LBUTTON
            .IF ah
                mov eax, BLUE
                call SetTextColor
            .ELSE
                mov eax, GRAY
                call SetTextColor
            .ENDIF
            mGotoxy 36, 14
            mWrite "--------------"
            mGotoxy 36, 15
            mWrite "| CLICK HERE |"
            mGotoxy 36, 16
            mWrite "--------------"
            INVOKE  GetKeyState,VK_LBUTTON
            .IF ah 
                jmp mouseEnd
            .ENDIF
        .ELSE 
            mov eax, YELLOW
            call SetTextColor
            mGotoxy 36, 14
            mWrite "--------------"
            mGotoxy 36, 15
            mWrite "| CLICK HERE |"
            mGotoxy 36, 16
            mWrite "--------------"
        .ENDIF   
        
        INVOKE Sleep, 20
        
    jmp mouseCheck
    mouseEnd:
 
    call Clrscr
    
    call s_nodelay_boundries 
    
    call GetPlayerName
    
    .IF PlayerName[0] == 0
        mGotoxy 30, 10
        mWrite "Enter your name: "
        mov ecx, 50
        mov edx, OFFSET playerName
        call ReadString
        call PutPlayerName
    .ELSE
        mGotoxy 30, 10
        mWrite "Welcome back! "
        mov edx, OFFSET playerName
        call WriteString
        call ReadChar
        
    .ENDIF 
    
    
    MainMenuView:
    call ResetScreen
    call s_menu
    call Clrscr
    
    .IF al == 'e'
        jmp ExitThisGame
    .ELSEIF al == 's'       
        RestartThisGame:
        call resetGame
        ResumeThisGame:         
        jmp StartGame    
    .ELSEIF al == 'c'
        jmp CreditView
    .ELSEIF al == 'r'
        jmp RulesView
    .ENDIF
    
    StartGame:
        call ResetScreen
        call core  
        .IF al == 'o' ; Game Over
            call ResetScreen            
            call s_gameover
            jmp ConditionCheck 
        .ELSEIF al == 'w' ; Win
            call ResetScreen
            call s_youwin
            jmp ConditionCheck 
        .ELSEIF al == 'p'
            call ResetScreen
            call s_pause
            jmp ConditionCheck 
        .ENDIF
        
    ConditionCheck:
    .IF al == 'r'
        jmp ResumeThisGame
    .ELSEIF al == 'g'
        jmp RestartThisGame
    .ELSEIF al == 'm'
        jmp MainMenuView
    .ELSEIF al == 'e'
        jmp ExitThisGame
    .ENDIF   
    exit
        
    CreditView:
        call ResetScreen
        call s_about
        jmp MainMenuView
    RulesView:
        call ResetScreen
        call s_about       
        jmp MainMenuView
    ExitThisGame:
        call DeleteGameFile
        call ResetScreen
        exit          
	exit
main ENDP

ResetScreen PROC 
    mov ecx, 40    
    label001:
        mGotoxy 0, cl
        mov edx, OFFSET clsText 
        call WriteString
        dec ecx
        cmp ecx, 0
        jge label001
    
    mGotoxy 0,0
    ret
ResetScreen ENDP

END main