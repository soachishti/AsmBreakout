include Irvine32.inc
INCLUDE Macros.inc 
INCLUDELIB Kernel32.lib
INCLUDELIB User32.Lib
;INCLUDE     GraphWin.inc

VK_ESCAPE		EQU		00000001bh
VK_LBUTTON		EQU		000000001h
VK_RBUTTON		EQU		000000002h

DeleteFile PROTO lpFileName:DWORD
SetTextColor PROTO
Beep PROTO dwFreq:DWORD, dwDuration:DWORD

GetCursorPos                PROTO, lpPoint:DWORD
ScreenToClient              PROTO, hWnd:DWORD, lpPoint:DWORD
GetConsoleWindow            PROTO
GetKeyState                 PROTO :DWORD
extrn MessageBoxA@16 : PROC

POINTv2 STRUCT
  X   DWORD ?
  Y   DWORD ?
POINTv2 ENDS

POINT STRUCT
	x       BYTE ?
	y       BYTE ?
    color   DWORD ? ; color
POINT ENDS

RECT STRUCT
  left      DWORD ?
  top       DWORD ?
  right     DWORD ?
  bottom    DWORD ?
RECT ENDS

.data
    gameNameStr    BYTE    "AsmBreakout v1.0", 0
    clsText        BYTE     80 DUP(' '), 0
    PlayerName     BYTE    51 DUP(?)

    cursorPos POINTv2 <?,?>
    hwndConsole DWORD ?
    hStdOut DWORD ?
    screen RECT <>
    
    ExitMsg BYTE "Have a good day!",0
.code 

; Collecting team source
include core\core.asm
include ui\ui.asm
include misc\misc.asm

main PROC            
    invoke SetConsoleTitle, ADDR gameNameStr
	
    call s_nodelay_boundries 
    mov speed1, 30
    call FrontName
    
    INVOKE  GetConsoleWindow
    mov     hwndConsole,eax
    
    INVOKE  GetStdHandle,STD_OUTPUT_HANDLE
    mov     hStdOut,eax
    mouseCheck:
         INVOKE GetCursorPos, ADDR cursorPos
         INVOKE ScreenToClient, hwndConsole, ADDR cursorPos
         
        .IF cursorPos.X > 105 && cursorPos.X < 286 && cursorPos.Y > 202 && cursorPos.Y < 233
            INVOKE  GetKeyState,VK_LBUTTON
            .IF ah
                mov eax, BLUE
                call SetTextColor
            .ELSE
                mov eax, GRAY
                call SetTextColor
            .ENDIF
            mGotoxy 13, 14
            mWrite "-----------------------"
            mGotoxy 13, 15
            mWrite "| CLICK HERE TO START |"
            mGotoxy 13, 16
            mWrite "-----------------------"
            INVOKE  GetKeyState,VK_LBUTTON
            .IF ah 
                jmp mouseEnd
            .ENDIF
        .ELSE 
            mov eax, YELLOW
            call SetTextColor
            mGotoxy 13, 14
            mWrite "-----------------------"
            mGotoxy 13, 15
            mWrite "| CLICK HERE TO START |"
            mGotoxy 13, 16
            mWrite "-----------------------"
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
        mov eax, BLUE
        call SetTextColor
        mov edx, OFFSET playerName
        call ReadString
        call PutPlayerName
    .ELSE
        mGotoxy 30, 10
        mWrite "Welcome back! "
        mov eax, BLUE
        call SetTextColor
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
        call s_rules      
        jmp MainMenuView
    ExitThisGame:
        mov eax, OFFSET ExitMsg
        mov ebx, 0
        push ebx
        push eax
        push eax
        push ebx
        call MessageBoxA@16
        
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