LPSYSTEMTIME STRUCT
    wYear       WORD ?
    wMonth      WORD ?
    wDayOfWeek  WORD ?
    wDay        WORD ?
    wHour       WORD ?
    wMinute     WORD ?
    wSecond     WORD ?
    wMilliseconds WORD ?
LPSYSTEMTIME ENDS

.data
	localTime LPSYSTEMTIME <>
	jan byte "January",0
	feb byte "faburary",0
	mar byte"March",0
	april byte"April",0
	may byte"May",0
	june byte"June",0
	july byte"July",0
	aug byte"August",0
	sep byte"September",0
	nov byte"November",0
	oct byte"October",0
	decm byte"December",0
        invalid byte" \",0
        grt byte"AM",0
        lrt byte"PM",0
.code 

printTime PROC
	invoke GetLocalTime, ADDR localTime    
	; Day
	xor eax, eax
	mov ax, localTime.wDay
	call WriteDec
	mov al, ' '
	call WriteChar
	
	; Month
	xor eax, eax
	mov ax, localTime.wMonth
	t1:
	   cmp ax,1
 	   JNE t2
	mov edx,offset jan
        t2:
	        cmp ax,2
		JNE t3
		mov edx, offset feb
        t3:
                cmp ax,3
		JNE t4
		mov edx,offset mar
	t4:
		cmp ax,4
		JNE t5
		mov edx,offset april
		
	t5:
                cmp ax,5
	        JNE t6
                mov edx,offset may
		
	t6:
                cmp ax,6
		JNE t7
		mov edx,offset june
		
        t7:
                cmp ax,7
		JNE t8
		mov edx,offset july
                
        
	t8:	cmp ax,8
                JNE t9
		mov edx,offset aug
                
	t9:     
                cmp ax,9
                JNE t10
		mov edx,offset sep
		
       t10:      
                cmp ax,10
                JNE t11
		mov edx,offset nov
		
       t11:
                cmp ax,11
                JNE t12
                mov edx,offset oct
       t12:
                cmp ax,12
               ;JNE t13
                mov edx,offset decm

		
	call writestring
	
	mov al, ','
	call WriteChar
	mWrite " "
	
	; Year
	mov ax, localTime.wYear
	xor edx, edx
	mov ebx, 100
	div ebx
	mov eax, edx
	call WriteDec
	mWrite " | "
	
	
mov ax,localTime.wHour


cmp ax,12
jna label001
	sub ax, 12
label001:

 call writedec
 mov al,':' 
 call writeChar
 mov ax,localTime.wMinute
 call writedec
 mov al,' ' 
 call writeChar
 ;.IF localTime.wHour > 12 
 		;mov edx,offset grt
 		;call writestring
 	;.ELSE
 		;mov edx,offset lrt
 		;call writestring
	;.ENDIF
	t14:
	
	cmp ax,12
	JNE t15
	
	mov edx,offset grt
        call writestring
	
	
	t15:
	mov edx,offset lrt
        call writestring
	
	ret	
printTime ENDP