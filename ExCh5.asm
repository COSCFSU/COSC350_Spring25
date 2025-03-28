; Sample code for Chapter 5
;	3/3/25
; special thanks to Reece and Marquise!

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	; declare variables here
	myText	BYTE	"friday"
	myRev	BYTE	"xxxxxx"

.code
main proc
	;call reverse
	call aProc

	invoke ExitProcess,0
main endp

aProc proc
	mov eax, 1
	;push 1
	call bProc
	ret
aProc endp

bProc proc
	mov ebx, 1
	call cProc
	ret
bProc endp

cProc proc
	mov ecx, 1
	ret
cProc endp

; Thanks Cole, Reece, Marquise, Kobe, JimmyQ, Selena
reverse proc
	; loop through each letter
	mov ecx, LENGTHOF myText
	mov esi, OFFSET myText
	revtop:
		movzx eax, BYTE PTR [esi]
		inc esi
		push eax
		loop revtop

	mov ecx, LENGTHOF myText
	mov esi, OFFSET myRev
	revtime:
		pop eax
		mov [esi], eax
		inc esi
		loop revtime

	ret
reverse endp

end main