; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	; declare variables here
	; commented out first example...
	;mybyte BYTE 11h
	;myword WORD 2222h
	;mydword DWORD 4a4b4c4dh

	myarr	BYTE	11h, 22h, 33h, 44h
	mydwarr	DWORD	1a1b1c1dh, 2a2b2c2dh, 3a3b3c3dh
	mystr	BYTE	"Hello, World!", 0dh, 0ah, 0

.code
main proc

	;mov eax, LENGTHOF myarr
	;mov ebx, TYPE mydwarr
	;mov ecx, LENGTHOF mydwarr
	;mov edx, SIZEOF mydwarr

	; do the same thing, but on the dword array
	mov ecx, LENGTHOF mydwarr
	mov esi, OFFSET mydwarr
	topdw:
		mov eax, [esi]
		add esi, 4
		loop topdw ;a conditional jump...

	; put every character from mystr into eax 1 by 1
	; loop through mystr somehow...
	mov ecx, LENGTHOF mystr
	mov esi, OFFSET mystr
	top:
		mov ah, [esi]
		inc esi
		;movzx eax, mystr ; alternate solution
		loop top ;a conditional jump...




	;mov ah, mybyte

	;mov ebx, mydword
	;mov al, BYTE PTR mydword
	;mov cx, WORD PTR mydword

	invoke ExitProcess,0
main endp
end main